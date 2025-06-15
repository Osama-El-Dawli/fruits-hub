import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.name, required super.email, required super.uid});

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      name: user.displayName ?? 'No Name',
      email: user.email ?? 'No Email',
      uid: user.uid,
    );
  }
}