import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/errors/exceptions.dart';
import 'package:fruits_hub/core/errors/failures.dart';
import 'package:fruits_hub/core/services/firebase_auth_service.dart';
import 'package:fruits_hub/features/auth/data/models/user_model.dart';
import 'package:fruits_hub/features/auth/domain/entities/user_entity.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImplementation extends AuthRepo {
  final FirebaseAuthService _firebaseAuthService;

  AuthRepoImplementation({required FirebaseAuthService firebaseAuthService})
    : _firebaseAuthService = firebaseAuthService;

  @override
  Future<Either<ServerFailure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    try {
      User user = await _firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      log(
        'Exception in AuthRepoImplementation.createUserWithEmailAndPassword: ${e.toString()}',
      );
      return left(ServerFailure(e.message));
    } catch (e) {
      log(
        'Unexpected error in AuthRepoImplementation.createUserWithEmailAndPassword: ${e.toString()}',
      );
      return left(ServerFailure(e.toString()));
    }
  }
}
