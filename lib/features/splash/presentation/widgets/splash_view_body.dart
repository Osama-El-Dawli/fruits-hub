import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/core/services/shared_prefrences.dart';
import 'package:fruits_hub/core/utils/assets.dart';
import 'package:fruits_hub/features/auth/presentation/views/login_view.dart';
import 'package:fruits_hub/features/onboarding/presentation/views/on_boarding_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    excuteNavigation();
    super.initState();
  }

  void excuteNavigation() {
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        bool isOnBoardingSeen = Prefs.getBool('isOnBoardingSeen');
        if (isOnBoardingSeen) {
          Navigator.pushReplacementNamed(context, LoginView.routeName);
          return;
        } else {
          Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: SvgPicture.asset(Assets.imagesSplashTop),
        ),
        SvgPicture.asset(Assets.imagesLogo),
        SvgPicture.asset(Assets.imagesSplashBottom, fit: BoxFit.fill),
      ],
    );
  }
}
