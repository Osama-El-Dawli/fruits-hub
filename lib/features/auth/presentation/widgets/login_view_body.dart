import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/utils/assets.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruits_hub/features/auth/presentation/widgets/dont_have_an_account.dart';
import 'package:fruits_hub/features/auth/presentation/widgets/or_divider.dart';
import 'package:fruits_hub/features/auth/presentation/widgets/social_login_button.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),
            Form(
              child: Column(
                children: [
                  CustomTextFormField(
                    hintText: 'البريد الالكتروني',
                    textInputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 16),
                  CustomTextFormField(
                    hintText: 'كلمة المرور',
                    textInputType: TextInputType.visiblePassword,
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.visibility, color: Color(0xffC9CECF)),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'نسيت كلمة المرور؟',
                          style: AppTextStyles.semiBold13.copyWith(
                            color: AppColors.lightPrimaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 33),
                  CustomButton(onPressed: () {}, text: 'تسجيل الدخول'),
                  const SizedBox(height: 33),
                  DontHaveAnAccount(),
                  const SizedBox(height: 33),
                  OrDivider(),
                  const SizedBox(height: 16),
                  SocialLoginButton(
                    title: 'تسجيل بواسطة جوجل',
                    image: Assets.imagesGoogleIcon,
                    onPressed: () {},
                  ),
                  const SizedBox(height: 16),
                  SocialLoginButton(
                    title: 'تسجيل بواسطة أبل',
                    image: Assets.imagesAppleIcon,
                    onPressed: () {},
                  ),
                  const SizedBox(height: 16),
                  SocialLoginButton(
                    title: 'تسجيل بواسطة فيسبوك',
                    image: Assets.imagesFacebookIcon,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
