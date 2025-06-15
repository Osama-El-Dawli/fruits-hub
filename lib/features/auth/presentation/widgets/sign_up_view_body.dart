import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_password_field.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruits_hub/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/widgets/have_an_account.dart';
import 'package:fruits_hub/features/auth/presentation/widgets/terms_and_conditions.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String userName, email, password;
  late bool isTermsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(height: 24),
              CustomTextFormField(
                onSaved: (value) => userName = value!,
                hintText: 'الاسم كامل',
                textInputType: TextInputType.name,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) => email = value!,
                hintText: 'البريد الالكتروني',
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              CustomPasswordField(onSaved: (value) => password = value!),
              const SizedBox(height: 16),
              TermsAndConditions(
                onChanged: (value) {
                  isTermsAccepted = value;
                },
              ),
              const SizedBox(height: 30),
              CustomButton(
                text: 'إنشاء حساب جديد',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    if (isTermsAccepted) {
                      context
                          .read<SignupCubit>()
                          .createUserWithEmailAndPassword(
                            email,
                            password,
                            userName,
                          );
                    } else {
                      errorToastMsg(msg: 'يجب قبول الشروط والأحكام');
                      }
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
              const SizedBox(height: 26),
              const HaveAnAccount(),
            ],
          ),
        ),
      ),
    );
  }

  void errorToastMsg({required String msg}) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
