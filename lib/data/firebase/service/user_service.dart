import 'package:chat_app/data/models/user_model.dart';
import 'package:chat_app/domain/entities/user_entity.dart';

abstract class UserService {
  Future<bool> signinWithEmailPassword(
    String emailAddress,
    String password,
  );

  Future<bool> signUpWithEmailPassword(
    String emailAddress,
    String password,
  );

  Future<bool> signOut();

  Future<bool> updateUser(
    UserModel input,
  );

  Future<UserEntity> getUser();
}
