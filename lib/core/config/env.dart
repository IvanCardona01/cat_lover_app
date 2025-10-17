import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static String get baseUrl => dotenv.env['BASE_URL'] ?? 'https://api.thecatapi.com';
  static String get apiKey => dotenv.env['API_KEY'] ?? 'live_99Qe4Ppj34NdplyLW67xCV7Ds0oSLKGgcWWYnSzMJY9C0QOu0HUR4azYxWkyW2nr';
  static String get storageName => dotenv.env['STORAGE_NAME'] ?? 'cat_lover_app';
}