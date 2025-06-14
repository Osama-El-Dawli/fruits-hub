import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruits_hub/features/auth/presentation/widgets/have_an_account.dart';
import 'package:fruits_hub/features/auth/presentation/widgets/terms_and_conditions.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              const SizedBox(height: 24),
              CustomTextFormField(
                hintText: 'الاسم كامل',
                textInputType: TextInputType.name,
              ),
              const SizedBox(height: 16),
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
              const TermsAndConditions(),
              const SizedBox(height: 30),
              CustomButton(text: 'إنشاء حساب جديد', onPressed: () {}),
              const SizedBox(height: 26),
              const HaveAnAccount(),
            ],
          ),
        ),
      ),
    );
  }
}
