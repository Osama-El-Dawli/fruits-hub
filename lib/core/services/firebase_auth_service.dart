import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/errors/exceptions.dart';

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
}
