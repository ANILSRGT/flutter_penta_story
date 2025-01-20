import 'package:flutter/material.dart';
import 'package:penta_core/penta_core.dart';
import 'package:penta_story/core/extensions/localization_ext.dart';
import 'package:penta_story/core/localization/locale_keys.g.dart';
import 'package:penta_story/presentation/widgets/buttons/app_elevated_button.dart';
import 'package:penta_story/presentation/widgets/dropdown/app_lang_dropdown.dart';

class OnboardingPageItem extends StatelessWidget {
  const OnboardingPageItem({
    required this.index,
    required this.maxIndex,
    required this.data,
    required this.onBack,
    required this.onNext,
    required this.onComplete,
    required this.onSkip,
    required this.onChangeLang,
    super.key,
  });

  final int index;
  final int maxIndex;
  final OnboardingPageItemData data;
  final VoidCallback onBack;
  final VoidCallback onNext;
  final VoidCallback onComplete;
  final VoidCallback onSkip;
  final VoidCallback onChangeLang;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          context.ext.padding.horizontal.xl + context.ext.padding.vertical.lg,
      child: Column(
        spacing: context.ext.values.xl,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: AppLangDropdown.circle(
              onChanged: (_) => onChangeLang(),
            ),
          ),
          Expanded(
            child: Center(
              child: context.ext.screen.byOrientation(
                portrait: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildImage(context),
                      context.ext.sizedBox.height.xl6,
                      _buildTitle(context),
                      _buildSubtitle(context),
                      context.ext.sizedBox.height.md,
                      _buildDesc(context),
                    ],
                  ),
                ),
                landscape: Row(
                  children: [
                    Flexible(
                      child: _buildImage(context),
                    ),
                    context.ext.sizedBox.width.xl6,
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildTitle(context),
                            _buildSubtitle(context),
                            context.ext.sizedBox.height.md,
                            _buildDesc(context),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          _buildActions(context),
        ],
      ),
    );
  }

  SizedBox _buildImage(BuildContext context) {
    return SizedBox(
      height: context.ext.screen.byOrientation(
        portrait: context.ext.screen.width * 0.5,
        landscape: context.ext.screen.height * 0.3,
      ),
      child: data.image,
    );
  }

  Text _buildTitle(BuildContext context) {
    return Text(
      data.title,
      textAlign: TextAlign.center,
      style: context.ext.theme.textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Text _buildSubtitle(BuildContext context) {
    return Text(
      data.subtitle,
      textAlign: TextAlign.center,
      style: context.ext.theme.textTheme.titleSmall,
    );
  }

  Text _buildDesc(BuildContext context) {
    return Text(
      data.description,
      textAlign: TextAlign.center,
      style: context.ext.theme.textTheme.bodyLarge,
    );
  }

  Row _buildActions(BuildContext context) {
    return Row(
      spacing: context.ext.values.md,
      children: [
        if (index != 0) _backbtn(),
        const Spacer(),
        _nextOrCompleteBtn(),
        if (index < maxIndex - 1) _skipBtn(),
      ],
    );
  }

  AppElevatedButton _backbtn() {
    return AppElevatedButton(
      onPressed: onBack,
      child:
          Text(LocaleKeys.pagesOnboardingItemWidgetBackButtonLabel.translate),
    );
  }

  AppElevatedButton _nextOrCompleteBtn() {
    return AppElevatedButton(
      onPressed: index == maxIndex ? onComplete : onNext,
      child: Text(
        index == maxIndex
            ? LocaleKeys.pagesOnboardingItemWidgetCompletedButtonLabel.translate
            : LocaleKeys.pagesOnboardingItemWidgetNextButtonLabel.translate,
      ),
    );
  }

  AppElevatedButton _skipBtn() {
    return AppElevatedButton(
      onPressed: onSkip,
      child:
          Text(LocaleKeys.pagesOnboardingItemWidgetSkipButtonLabel.translate),
    );
  }
}

class OnboardingPageItemData {
  const OnboardingPageItemData({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.description,
  });

  final Widget image;
  final String title;
  final String subtitle;
  final String description;
}
