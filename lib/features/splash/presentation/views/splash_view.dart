import 'package:flutter/material.dart';
import 'package:fruits_hub/features/splash/presentation/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  static const String routeName = 'splash';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SplashViewBody());
  }
}
