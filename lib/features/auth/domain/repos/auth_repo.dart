import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/errors/failures.dart';
import 'package:fruits_hub/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<ServerFailure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  );

  Future<Either<ServerFailure, UserEntity>> loginWithEmailAndPassword(
    String email,
    String password,
  );

  Future<Either<ServerFailure, UserEntity>> signInWithGoogle();

  Future<Either<ServerFailure, UserEntity>> signInWithFacebook();

  Future<void> addUserData({required UserEntity user, required String uid});

  Future<UserEntity> getUserData({required String uid});
}
