import 'package:chat_app/data/models/user_model.dart';
import 'package:chat_app/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class UserService {
  Future<UserCredential> signInWithEmailPassword(
    String emailAddress,
    String password,
  );

  Future<UserCredential> signUpWithEmailPassword(
    String emailAddress,
    String password,
  );

  Future<void> signOut();

  Future<void> updateUser(
    UserModel input,
  );

  Future<UserEntity> getUser();
}
