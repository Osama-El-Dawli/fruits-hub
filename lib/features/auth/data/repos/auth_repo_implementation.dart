import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/errors/exceptions.dart';
import 'package:fruits_hub/core/errors/failures.dart';
import 'package:fruits_hub/core/services/data_service.dart';
import 'package:fruits_hub/core/services/firebase_auth_service.dart';
import 'package:fruits_hub/core/utils/backend_endpoints.dart';
import 'package:fruits_hub/features/auth/data/models/user_model.dart';
import 'package:fruits_hub/features/auth/domain/entities/user_entity.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImplementation extends AuthRepo {
  final FirebaseAuthService _firebaseAuthService;
  final DatabaseService _databaseService;

  AuthRepoImplementation({
    required FirebaseAuthService firebaseAuthService,
    required DatabaseService databaseService,
  }) : _databaseService = databaseService,
       _firebaseAuthService = firebaseAuthService;

  @override
  Future<Either<ServerFailure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    User? user;
    try {
      user = await _firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity = UserModel(email: email, name: name, uid: user.uid);
      await addUserData(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      log(
        'Exception in AuthRepoImplementation.createUserWithEmailAndPassword: ${e.toString()}',
      );
      if (user != null) {
        await _firebaseAuthService.deleteUser(user);
      }
      return left(ServerFailure(e.message));
    } catch (e) {
      log(
        'Unexpected error in AuthRepoImplementation.createUserWithEmailAndPassword: ${e.toString()}',
      );
      if (user != null) {
        await _firebaseAuthService.deleteUser(user);
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, UserEntity>> loginWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      User user = await _firebaseAuthService.loginWithEmailAndPassword(
        email: email,
        password: password,
      );

      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      log(
        'Exception in AuthRepoImplementation.loginWithEmailAndPassword: ${e.toString()}',
      );
      return left(ServerFailure(e.message));
    } catch (e) {
      log(
        'Unexpected error in AuthRepoImplementation.loginWithEmailAndPassword: ${e.toString()}',
      );
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<void> addUserData({required UserEntity user}) async {
    await _databaseService.addData(
      path: BackEndEndPoints.addUserData,
      data: user.toMap(),
    );
  }

  @override
  Future<Either<ServerFailure, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      user = await _firebaseAuthService.signInWithGoogle();
      var userEntity = UserModel.fromFirebaseUser(user);
      await addUserData(user: userEntity);
      return right(userEntity);
    } catch (e) {
      log(
        'Unexpected error in AuthRepoImplementation.signInWithGoogle: ${e.toString()}',
      );
      if (user != null) {
        await _firebaseAuthService.deleteUser(user);
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, UserEntity>> signInWithFacebook() async {
    try {
      User user = await _firebaseAuthService.signInWithFacebook();

      return right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      log(
        'Unexpected error in AuthRepoImplementation.signInWithFacebook: ${e.toString()}',
      );
      return left(ServerFailure(e.toString()));
    }
  }
}
