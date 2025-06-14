import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar.dart';
import 'package:fruits_hub/features/auth/presentation/widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  static const routeName = 'sign-up';
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildAppBar(context, 'حساب جديد'), body: SignUpViewBody(),);
  }
}
