import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/functions/custom_toast_message.dart';
import 'package:fruits_hub/core/services/get_it_service.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar.dart';
import 'package:fruits_hub/core/widgets/custom_loading_progress_hud.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:fruits_hub/features/auth/presentation/cubits/signin_cubit/signin_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/widgets/sign_in_view_body.dart';
import 'package:fruits_hub/features/home/presentation/views/home_view.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  static const routeName = 'login';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(authRepo: getIt<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, 'تسجيل الدخول', showBackArrow: false),
        body: const SignInViewBodyBlocConsumer(),
      ),
    );
  }
}

class SignInViewBodyBlocConsumer extends StatelessWidget {
  const SignInViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninSuccess) {
          Navigator.pushReplacementNamed(context, HomeView.routeName);
        }
        if (state is SigninFailure) {
          toastMsg(msg: state.message);
        }
      },
      builder: (context, state) {
        return CustomLoadingProgressHud(
          isLoading: state is SigninLoading,
          child: const SignInViewBody(),
        );
      },
    );
  }
}
