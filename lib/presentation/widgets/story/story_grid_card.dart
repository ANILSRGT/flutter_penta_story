import 'package:flutter/material.dart';
import 'package:penta_core/penta_core.dart';
import 'package:penta_story/core/configs/theme/i_app_theme.dart';
import 'package:penta_story/core/extensions/localization_ext.dart';
import 'package:penta_story/core/localization/locale_keys.g.dart';
import 'package:penta_story/presentation/widgets/story/story_book_image.dart';

class StoryGridCard extends StatelessWidget {
  const StoryGridCard({
    required this.image,
    required this.title,
    required this.pagesCount,
    super.key,
  });

  final String image;
  final String title;
  final int pagesCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: StoryBookImage(image: image),
        ),
        context.ext.sizedBox.height.sm,
        Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: context.ext.theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          pagesCount == 1
              ? LocaleKeys.widgetsStoryStoryGridCardPagesCountSingular.translate
              : LocaleKeys.widgetsStoryStoryGridCardPagesCountPluralArgs1
                  .translateWith([pagesCount.toString()]),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: context.ext.theme.textTheme.labelMedium?.copyWith(
            color: context.appThemeExt.appColors.grey,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
