import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:get/get.dart';
import 'package:cat_lover_app/features/settings/viewmodels/settings_viewmodel.dart';
import 'package:cat_lover_app/features/settings/domain/settings_repository.dart';

class MockSettingsRepository extends Mock implements SettingsRepository {}

void main() {
  late SettingsViewModel viewModel;
  late MockSettingsRepository mockRepository;

  setUp(() {
    Get.testMode = true;

    mockRepository = MockSettingsRepository();
    viewModel = SettingsViewModel(mockRepository);
  });

  tearDown(() {
    Get.reset();
  });

  group('SettingsViewModel Tests', () {
    test('changeThemeMode should change to dark mode', () async {
      when(
        () => mockRepository.saveThemeMode(any()),
      ).thenAnswer((_) async => Future.value());

      viewModel.changeThemeMode(ThemeMode.dark);

      expect(viewModel.themeMode.value, ThemeMode.dark);

      verify(() => mockRepository.saveThemeMode('dark')).called(1);
    });

    test('changeThemeMode should change to light mode', () async {
      when(
        () => mockRepository.saveThemeMode(any()),
      ).thenAnswer((_) async => Future.value());

      viewModel.changeThemeMode(ThemeMode.light);

      expect(viewModel.themeMode.value, ThemeMode.light);
      verify(() => mockRepository.saveThemeMode('light')).called(1);
    });


    test('changeLanguage should change to spanish', () async {
      when(
        () => mockRepository.saveLocale(any(), any()),
      ).thenAnswer((_) async => Future.value());

      viewModel.changeLanguage(const Locale('es', 'ES'));

      expect(viewModel.currentLocale.value, const Locale('es', 'ES'));
      verify(() => mockRepository.saveLocale('es', 'ES')).called(1);
    });

    test('changeLanguage should change to english', () async {
      when(
        () => mockRepository.saveLocale(any(), any()),
      ).thenAnswer((_) async => Future.value());

      viewModel.changeLanguage(const Locale('en', 'US'));

      expect(viewModel.currentLocale.value, const Locale('en', 'US'));
      verify(() => mockRepository.saveLocale('en', 'US')).called(1);
    });
  });
}
