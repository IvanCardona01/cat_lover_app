import 'package:cat_lover_app/app/app.dart';
import 'package:cat_lover_app/core/core_binding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  
  await dotenv.load(fileName: ".env");
  await initializeCoreDependencies();
  runApp(const MyApp());
}