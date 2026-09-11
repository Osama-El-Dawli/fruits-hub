import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruits_hub/core/errors/exceptions.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        'Exception in FirebaseAuthService.createUserWithEmailAndPassword: code:${e.code} - ${e.toString()}',
      );
      if (e.code == 'weak-password') {
        throw CustomException(message: 'كلمة المرور ضعيفة جداً.');
      } else if (e.code == 'invalid-email') {
        throw CustomException(message: 'البريد الإلكتروني غير صالح.');
      } else if (e.code == 'operation-not-allowed') {
        throw CustomException(
          message: 'العملية غير مسموح بها. يرجى التحقق من إعدادات Firebase.',
        );
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
          message:
              'البريد الإلكتروني مستخدم بالفعل. يرجى استخدام بريد إلكتروني آخر.',
        );
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
          message: 'فشل الاتصال بالشبكة. يرجى التحقق من اتصال الإنترنت.',
        );
      } else if (e.code == 'too-many-requests') {
        throw CustomException(
          message: 'تم تجاوز الحد الأقصى لطلبات التسجيل. يرجى المحاولة لاحقاً.',
        );
      } else {
        throw CustomException(message: 'حدث خطأ غير متوقع: ${e.message}');
      }
    } catch (e) {
      log(
        'Unexpected error in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()}',
      );
      throw CustomException(message: 'حدث خطأ غير متوقع: $e');
    }
  }

  Future<User> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        'Exception in FirebaseAuthService.loginWithEmailAndPassword: code:${e.code} - ${e.toString()}',
      );
      if (e.code == 'weak-password') {
        throw CustomException(message: 'كلمة المرور ضعيفة جداً.');
      } else if (e.code == 'invalid-email') {
        throw CustomException(
          message: 'البريد الإلكتروني او كلمة المرور غير صالحة.',
        );
      } else if (e.code == 'operation-not-allowed') {
        throw CustomException(
          message: 'العملية غير مسموح بها. يرجى التحقق من إعدادات Firebase.',
        );
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
          message:
              'البريد الإلكتروني مستخدم بالفعل. يرجى استخدام بريد إلكتروني آخر.',
        );
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
          message: 'فشل الاتصال بالشبكة. يرجى التحقق من اتصال الإنترنت.',
        );
      } else if (e.code == 'too-many-requests') {
        throw CustomException(
          message: 'تم تجاوز الحد الأقصى لطلبات التسجيل. يرجى المحاولة لاحقاً.',
        );
      } else {
        throw CustomException(message: 'حدث خطأ غير متوقع: ${e.message}');
      }
    } catch (e) {
      log(
        'Unexpected error in FirebaseAuthService.loginWithEmailAndPassword: ${e.toString()}',
      );
      throw CustomException(message: 'حدث خطأ غير متوقع: $e');
    }
  }

  Future<void> deleteUser(User user) async {
    await user.delete();
  }

  Future<User> signInWithGoogle() async {
    await GoogleSignIn.instance.initialize(
      serverClientId:
          '409091263950-rdqq1uaj4upj3o8tbff6v9i7bumdes53.apps.googleusercontent.com',
    );

    final GoogleSignInAccount googleUser = await GoogleSignIn.instance
        .authenticate();

    final GoogleSignInAuthentication googleAuth = googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );

    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  Future<User> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);
    return (await FirebaseAuth.instance.signInWithCredential(
      facebookAuthCredential,
    )).user!;
  }
}
