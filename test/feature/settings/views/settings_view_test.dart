import 'package:cat_lover_app/features/settings/domain/settings_repository.dart';
import 'package:cat_lover_app/features/settings/viewmodels/settings_viewmodel.dart';
import 'package:cat_lover_app/features/settings/widgets/theme_modal.dart';
import 'package:cat_lover_app/features/settings/widgets/language_modal.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:cat_lover_app/app/translations/app_translations.dart';
import 'package:cat_lover_app/features/settings/views/settings_view.dart';
import 'package:mocktail/mocktail.dart';

class MockSettingRepository extends Mock implements SettingsRepository {}

void main() {
  late SettingsViewModel viewModel;
  late MockSettingRepository mockRepository;

  Widget createSettingsView({required Locale locale}) {
    return GetMaterialApp(
      home: const SettingsView(),
      translations: AppTranslations(),
      locale: locale,
    );
  }

  setUp(() {
    Get.testMode = true;
    mockRepository = MockSettingRepository();
    viewModel = SettingsViewModel(mockRepository);

    when(() => mockRepository.saveThemeMode(any()))
        .thenAnswer((_) async => Future.value());
    when(() => mockRepository.saveLocale(any(), any()))
        .thenAnswer((_) async => Future.value());

    Get.put<SettingsViewModel>(viewModel);
  });

  tearDown(() {
    Get.reset();
  });

  group('SettingsView Widget Test', () {
    testWidgets('should render app bar title in spanish', (tester) async {
      await tester.pumpWidget(
        createSettingsView(locale: const Locale('es', 'ES')),
      );
      await tester.pumpAndSettle();

      expect(find.text('Ajustes'), findsOneWidget);
    });

    testWidgets('should render app bar title in english', (tester) async {
      await tester.pumpWidget(
        createSettingsView(locale: const Locale('en', 'US')),
      );
      await tester.pumpAndSettle();

      expect(find.text('Settings'), findsOneWidget);
    });

    testWidgets('should render two setting buttons', (tester) async {
      await tester.pumpWidget(
        createSettingsView(locale: const Locale('es', 'ES')),
      );
      await tester.pumpAndSettle();

      expect(find.text('Aspecto'), findsOneWidget);
      expect(find.text('Idioma'), findsOneWidget);
    });

    testWidgets('should open theme modal when tapping theme button', (tester) async {
      await tester.pumpWidget(
        createSettingsView(locale: const Locale('es', 'ES')),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('Aspecto'));
      await tester.pumpAndSettle();

      expect(find.byType(ThemeModal), findsOneWidget);
    });

    testWidgets('should open language modal when tapping language button', (tester) async {
      await tester.pumpWidget(
        createSettingsView(locale: const Locale('es', 'ES')),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('Idioma'));
      await tester.pumpAndSettle();

      expect(find.byType(LanguageModal), findsOneWidget);
    });
  });
}