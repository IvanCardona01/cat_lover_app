import 'package:cat_lover_app/app/translations/locale/en_translation.dart';
import 'package:cat_lover_app/app/translations/locale/es_translation.dart';
import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': EnTranslation.en,
    'es_ES': EsTranslation.es,
  };
}