import 'package:cat_lover_app/core/local_storage/domain/local_storage_service.dart';
import 'package:cat_lover_app/features/settings/domain/settings_repository.dart';
import 'package:cat_lover_app/shared/constants/local_storage_keys.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final LocalStorageService _localStorageService;

  SettingsRepositoryImpl(this._localStorageService);

  @override
  Future<void> saveThemeMode(String themeMode) async {
    await _localStorageService.write(LocalStorageKeys.themeModeKey, themeMode);
  }

  @override
  Future<String?> getThemeMode() async {
    return _localStorageService.read<String>(LocalStorageKeys.themeModeKey);
  }

  @override
  Future<void> saveLocale(String languageCode, String countryCode) async {
    await _localStorageService.write(LocalStorageKeys.localeLanguageKey, languageCode);
    await _localStorageService.write(LocalStorageKeys.localeCountryKey, countryCode);
  }

  @override
  Future<Map<String, String>?> getLocale() async {
    final languageCode = _localStorageService.read<String>(LocalStorageKeys.localeLanguageKey);
    final countryCode = _localStorageService.read<String>(LocalStorageKeys.localeCountryKey);
    
    if (languageCode == null || countryCode == null) {
      return null;
    }
    
    return {
      'languageCode': languageCode,
      'countryCode': countryCode,
    };
  }
}