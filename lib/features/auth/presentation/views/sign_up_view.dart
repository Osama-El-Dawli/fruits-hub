import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/functions/custom_toast_message.dart';
import 'package:fruits_hub/core/services/get_it_service.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:fruits_hub/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/widgets/sign_up_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  static const routeName = 'sign-up';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'حساب جديد'),
      body: BlocProvider(
        create: (context) => SignupCubit(getIt<AuthRepo>()),
        child: SignUpViewBodyBlocConsumer(),
      ),
    );
  }
}

class SignUpViewBodyBlocConsumer extends StatelessWidget {
  const SignUpViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          Navigator.of(context).pop();
        }
        if (state is SignupFailure) {
          toastMsg(msg: state.message);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignupLoading ? true : false,
          child: const SignUpViewBody(),
        );
      },
    );
  }
}
