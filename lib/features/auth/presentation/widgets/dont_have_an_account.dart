import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/features/auth/presentation/views/sign_up_view.dart';

class DontHaveAnAccount extends StatelessWidget {
  const DontHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'لا تمتلك حساب؟ ',
            style: AppTextStyles.semiBold16.copyWith(color: Color(0xff949D9E)),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = () => Navigator.pushNamed(
              context,
              SignUpView.routeName,
            ),
            text: 'قم بإنشاء حساب',
            style: AppTextStyles.semiBold16.copyWith(
              color: AppColors.lightPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
