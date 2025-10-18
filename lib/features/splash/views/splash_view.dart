import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cat_lover_app/features/splash/viewmodels/splash_viewmodel.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashViewModel>(
      builder: (viewModel) {
        return Scaffold(
          body: Center(
            child: Text('Splash Screen'),
          ),
        );
      },
    );
  }
}