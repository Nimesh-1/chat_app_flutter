import 'package:chat_app/data/data_source/user/user_cloud_datasource.dart';
import 'package:chat_app/data/firebase/service/user_service.dart';
import 'package:chat_app/data/models/user_model.dart';
import 'package:chat_app/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: UserCloudDatasource)
class UserCloudDatasourceImpl extends UserCloudDatasource {
  final UserService _userService;

  UserCloudDatasourceImpl(this._userService);

  @override
  Future<UserEntity> getUser() {
    return _userService.getUser();
  }

  @override
  Future<bool> signOut() {
    return _userService.signOut();
  }

  @override
  Future<UserCredential> signUpWithEmailPassword(
      String emailAddress, String password) {
    return _userService.signUpWithEmailPassword(emailAddress, password);
  }

  @override
  Future<UserCredential> signInWithEmailPassword(
      String emailAddress, String password) {
    return _userService.signInWithEmailPassword(emailAddress, password);
  }

  @override
  Future<bool> updateUser(UserModel input) {
    return _userService.updateUser(input);
  }
}
