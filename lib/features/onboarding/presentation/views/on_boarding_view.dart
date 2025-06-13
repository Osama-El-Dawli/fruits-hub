import 'package:flutter/material.dart';
import 'package:fruits_hub/features/onboarding/presentation/widgets/on_boarding_view_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  static const String routeName = 'onboarding';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: OnBoardingViewBody());
  }
}
