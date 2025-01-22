import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:penta_core/penta_core.dart';
import 'package:penta_story/core/configs/constants/firestore_paths.dart';
import 'package:penta_story/core/extensions/localization_ext.dart';
import 'package:penta_story/core/localization/locale_keys.g.dart';
import 'package:penta_story/data/models/stories/params/stories_get_by_id_params.dart';
import 'package:penta_story/data/models/stories/story_chapter_model.dart';
import 'package:penta_story/data/models/stories/story_entity.dart';
import 'package:penta_story/data/models/stories/story_page_model.dart';
import 'package:penta_story/data/models/stories/story_page_part_model.dart';

abstract class StoriesRemoteSource {
  Future<ResponseModel<List<StoryModel>>> getStories();
  Future<ResponseModel<StoryModel>> getStoryById(StoriesGetByIdParams params);
}

final class StoriesRemoteSourceImpl implements StoriesRemoteSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<ResponseModel<StoryModel>> _storyFromDoc(
    DocumentSnapshot<Map<String, dynamic>> storyDoc,
  ) async {
    try {
      final storyData = storyDoc.data();
      if (storyData == null) {
        return ResponseModelFail(
          error: ErrorModel(
            message: LocaleKeys
                .dataSourcesStoriesStoryFromDocErrorsStoryNotFound.translate,
            throwMessage: 'Stories/_storyFromDoc: Story data is null',
          ),
        );
      }
      final chaptersSnap = await storyDoc.reference
          .collection(
            FirestorePaths.storyChapters(storyId: storyDoc.id),
          )
          .orderBy(StoryChapterModel.indexKey)
          .get();
      final chaptersFuture = chaptersSnap.docs.map((chapterDoc) async {
        final chapterData = chapterDoc.data();
        final pagesSnap = await chapterDoc.reference
            .collection(
              FirestorePaths.storyPages(
                storyId: storyDoc.id,
                chapterId: chapterDoc.id,
              ),
            )
            .orderBy(StoryPageModel.indexKey)
            .get();
        final pagesFuture = pagesSnap.docs.map((pageDoc) async {
          final pageData = pageDoc.data();
          final pagePartsSnap = await pageDoc.reference
              .collection(
                FirestorePaths.storyPageParts(
                  storyId: storyDoc.id,
                  chapterId: chapterDoc.id,
                  pageId: pageDoc.id,
                ),
              )
              .orderBy(StoryPagePartModel.indexKey)
              .get();
          final pagePartsFuture = pagePartsSnap.docs.map((partDoc) async {
            final partData = partDoc.data();
            return StoryPagePartModel.fromJson(
              id: partDoc.id,
              json: partData,
            );
          }).toList();
          final pageParts = await Future.wait(pagePartsFuture);
          return StoryPageModel.fromJson(
            id: pageDoc.id,
            json: pageData,
            parts: pageParts,
          );
        }).toList();
        final pages = await Future.wait(pagesFuture);
        return StoryChapterModel.fromJson(
          id: chapterDoc.id,
          json: chapterData,
          pages: pages,
        );
      }).toList();
      final chapters = await Future.wait(chaptersFuture);
      return ResponseModelSuccess(
        data: StoryModel.fromJson(
          id: storyDoc.id,
          json: storyData,
          chapters: chapters,
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ResponseModel<List<StoryModel>>> getStories() async {
    try {
      final storiesSnap =
          await _firestore.collection(FirestorePaths.stories).get();
      final storiesFuture = storiesSnap.docs.map((storyDoc) async {
        return _storyFromDoc(storyDoc);
      }).toList();
      final stories = await Future.wait(storiesFuture);
      return ResponseModelSuccess(
        data: stories
            .where((e) => e.isSuccess)
            .map((e) => e.asSuccess.data)
            .toList(),
      );
    } on Exception catch (e) {
      return ResponseModelFail(
        error: ErrorModel(
          message: LocaleKeys
              .dataSourcesStoriesGetStoriesErrorsAnotherError.translate,
          throwMessage: 'Stories/GetStories/Catch: $e',
        ),
      );
    }
  }

  @override
  Future<ResponseModel<StoryModel>> getStoryById(
    StoriesGetByIdParams params,
  ) async {
    try {
      final storyDoc = await _firestore
          .collection(FirestorePaths.stories)
          .doc(params.id)
          .get();
      final story = await _storyFromDoc(storyDoc);
      return story;
    } on Exception catch (e) {
      return ResponseModelFail(
        error: ErrorModel(
          message: LocaleKeys
              .dataSourcesStoriesGetStoryByIdErrorsAnotherError.translate,
          throwMessage: 'Stories/GetStoryById/Catch: $e',
        ),
      );
    }
  }
}
