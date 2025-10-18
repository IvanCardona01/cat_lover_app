import 'package:flutter_test/flutter_test.dart';
import 'package:cat_lover_app/shared/utils/theme_convertions_util.dart';
import 'package:flutter/material.dart';

void main() {
  group('ThemeConvertionsUtil Tests', () {
    test('themeModeFromString should return the correct theme mode', () {
      expect(
        ThemeConvertionsUtil.themeModeFromString('light'),
        ThemeMode.light,
      );
      expect(ThemeConvertionsUtil.themeModeFromString('dark'), ThemeMode.dark);
      expect(
        ThemeConvertionsUtil.themeModeFromString('system'),
        ThemeMode.system,
      );
    });

    test('themeModeToString should return the correct theme mode', () {
      expect(ThemeConvertionsUtil.themeModeToString(ThemeMode.light), 'light');
      expect(ThemeConvertionsUtil.themeModeToString(ThemeMode.dark), 'dark');
      expect(
        ThemeConvertionsUtil.themeModeToString(ThemeMode.system),
        'system',
      );
    });
  });
}
