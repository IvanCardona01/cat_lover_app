abstract class SettingsRepository {
  Future<void> saveThemeMode(String themeMode);
  Future<String?> getThemeMode();
  
  Future<void> saveLocale(String languageCode, String countryCode);
  Future<Map<String, String>?> getLocale();
}