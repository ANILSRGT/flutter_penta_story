// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomePageViewModel on _HomePageViewModelBase, Store {
  Computed<List<StoryModel>>? _$newStoriesComputed;

  @override
  List<StoryModel> get newStories => (_$newStoriesComputed ??=
          Computed<List<StoryModel>>(() => super.newStories,
              name: '_HomePageViewModelBase.newStories'))
      .value;
  Computed<List<StoryModel>>? _$popularStoriesComputed;

  @override
  List<StoryModel> get popularStories => (_$popularStoriesComputed ??=
          Computed<List<StoryModel>>(() => super.popularStories,
              name: '_HomePageViewModelBase.popularStories'))
      .value;

  late final _$_newStoriesAtom =
      Atom(name: '_HomePageViewModelBase._newStories', context: context);

  @override
  ObservableList<StoryModel> get _newStories {
    _$_newStoriesAtom.reportRead();
    return super._newStories;
  }

  @override
  set _newStories(ObservableList<StoryModel> value) {
    _$_newStoriesAtom.reportWrite(value, super._newStories, () {
      super._newStories = value;
    });
  }

  late final _$_newStoriesLoadingAtom =
      Atom(name: '_HomePageViewModelBase._newStoriesLoading', context: context);

  @override
  bool get _newStoriesLoading {
    _$_newStoriesLoadingAtom.reportRead();
    return super._newStoriesLoading;
  }

  @override
  set _newStoriesLoading(bool value) {
    _$_newStoriesLoadingAtom.reportWrite(value, super._newStoriesLoading, () {
      super._newStoriesLoading = value;
    });
  }

  late final _$_popularStoriesAtom =
      Atom(name: '_HomePageViewModelBase._popularStories', context: context);

  @override
  ObservableList<StoryModel> get _popularStories {
    _$_popularStoriesAtom.reportRead();
    return super._popularStories;
  }

  @override
  set _popularStories(ObservableList<StoryModel> value) {
    _$_popularStoriesAtom.reportWrite(value, super._popularStories, () {
      super._popularStories = value;
    });
  }

  late final _$_popularStoriesLoadingAtom = Atom(
      name: '_HomePageViewModelBase._popularStoriesLoading', context: context);

  @override
  bool get _popularStoriesLoading {
    _$_popularStoriesLoadingAtom.reportRead();
    return super._popularStoriesLoading;
  }

  @override
  set _popularStoriesLoading(bool value) {
    _$_popularStoriesLoadingAtom
        .reportWrite(value, super._popularStoriesLoading, () {
      super._popularStoriesLoading = value;
    });
  }

  late final _$getNewStoriesAsyncAction =
      AsyncAction('_HomePageViewModelBase.getNewStories', context: context);

  @override
  Future<void> getNewStories() {
    return _$getNewStoriesAsyncAction.run(() => super.getNewStories());
  }

  late final _$getPopularStoriesAsyncAction =
      AsyncAction('_HomePageViewModelBase.getPopularStories', context: context);

  @override
  Future<void> getPopularStories() {
    return _$getPopularStoriesAsyncAction.run(() => super.getPopularStories());
  }

  @override
  String toString() {
    return '''
newStories: ${newStories},
popularStories: ${popularStories}
    ''';
  }
}
