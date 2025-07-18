import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/errors/failures.dart';
import 'package:fruits_hub/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<ServerFailure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  );
}
