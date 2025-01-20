import 'dart:async';

import 'package:flutter/material.dart';
import 'package:penta_core/penta_core.dart';
import 'package:penta_story/core/configs/constants/app_icons.dart';
import 'package:penta_story/core/configs/theme/i_app_theme.dart';
import 'package:penta_story/presentation/widgets/loading_indicator/app_loading_indicator.dart';

class AppSearchbar extends StatefulWidget {
  const AppSearchbar({
    required this.hintText,
    required this.onSearch,
    super.key,
    this.reverseColor = false,
  });

  final String hintText;
  final bool reverseColor;
  final void Function(String) onSearch;

  @override
  State<AppSearchbar> createState() => _AppSearchbarState();
}

class _AppSearchbarState extends State<AppSearchbar> {
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  void _onChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 800), () {
      widget.onSearch(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
      onChanged: _onChanged,
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: context.ext.radius.border.all.sm,
        ),
      ),
      backgroundColor: WidgetStatePropertyAll(
        context.appThemeExt.appColors.white
            .byBrightness(context.ext.theme.isDark ^ widget.reverseColor),
      ),
      textStyle: WidgetStatePropertyAll(
        context.ext.theme.textTheme.bodyLarge?.copyWith(
          color: context.appThemeExt.appColors.white
              .byBrightness(context.ext.theme.isDark ^ widget.reverseColor)
              .onColor,
        ),
      ),
      padding: WidgetStatePropertyAll(context.ext.padding.horizontal.md),
      leading: Icon(
        AppIcons.search,
        color: context.appThemeExt.appColors.white
            .byBrightness(context.ext.theme.isDark ^ widget.reverseColor)
            .onColor,
      ),
      hintText: widget.hintText,
    );
  }
}

class AppSearchAnchor extends StatefulWidget {
  const AppSearchAnchor({
    required this.hintText,
    required this.suggestionsBuilder,
    super.key,
    this.reverseColor = false,
  });

  final String hintText;
  final bool reverseColor;
  final FutureOr<Iterable<Widget>> Function(String) suggestionsBuilder;

  @override
  State<AppSearchAnchor> createState() => _AppSearchAnchorState();
}

class _AppSearchAnchorState extends State<AppSearchAnchor> {
  final SearchController _searchController = SearchController();
  Timer? _debounceTimer;
  Iterable<Widget> _suggestions = [];
  bool _isLoading = false;

  @override
  void dispose() {
    _searchController.dispose();
    _debounceTimer?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    if (_debounceTimer?.isActive ?? false) {
      _debounceTimer!.cancel();
    }

    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      if (query.isNotEmpty) {
        _fetchSuggestions(query);
      } else {
        setState(() {
          _suggestions = [];
        });
      }
    });
  }

  Future<void> _fetchSuggestions(String query) async {
    setState(() {
      _isLoading = true;
    });

    _suggestions = await widget.suggestionsBuilder(query);

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SearchAnchor.bar(
      isFullScreen: true,
      textInputAction: TextInputAction.search,
      searchController: _searchController,
      onChanged: _onSearchChanged,
      suggestionsBuilder: (context, controller) {
        return _suggestions.isNotEmpty
            ? _suggestions
            : _isLoading
                ? const [Center(child: AppLoadingIndicator())]
                : [];
      },
      barBackgroundColor: WidgetStatePropertyAll(
        context.appThemeExt.appColors.white
            .byBrightness(context.ext.theme.isDark ^ widget.reverseColor),
      ),
      barTextStyle: WidgetStatePropertyAll(
        context.ext.theme.textTheme.bodyLarge?.copyWith(
          color: context.appThemeExt.appColors.white
              .byBrightness(context.ext.theme.isDark ^ widget.reverseColor)
              .onColor,
        ),
      ),
      barShape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: context.ext.radius.border.all.sm,
        ),
      ),
      barLeading: Icon(
        AppIcons.search,
        color: context.appThemeExt.appColors.white
            .byBrightness(context.ext.theme.isDark ^ widget.reverseColor)
            .onColor,
      ),
      barPadding: WidgetStatePropertyAll(context.ext.padding.horizontal.lg),
      viewHintText: widget.hintText,
      viewBackgroundColor: context.appThemeExt.appColors.background
          .byBrightness(context.ext.theme.isDark),
      viewHeaderTextStyle: context.ext.theme.textTheme.bodyLarge?.copyWith(
        color: context.appThemeExt.appColors.background
            .byBrightness(context.ext.theme.isDark)
            .onColor,
      ),
      barHintText: widget.hintText,
    );
  }
}
