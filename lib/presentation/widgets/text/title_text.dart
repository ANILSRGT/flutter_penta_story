import 'package:flutter/material.dart';
import 'package:penta_core/penta_core.dart';

class TitleText extends Text {
  const TitleText(
    super.data, {
    super.key,
    super.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data ?? '',
      textAlign: textAlign,
      style: context.ext.theme.textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
