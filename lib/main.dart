import 'package:cat_lover_app/app/app.dart';
import 'package:cat_lover_app/core/core_binding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  initializeCoreDependencies();
  runApp(const MyApp());
}