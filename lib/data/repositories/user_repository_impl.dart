import 'package:chat_app/data/data_source/user/user_cache_datasource.dart';
import 'package:chat_app/data/data_source/user/user_cloud_datasource.dart';
import 'package:chat_app/data/data_source/user/user_datasource_factory.dart';
import 'package:chat_app/data/models/user_model.dart';
import 'package:chat_app/domain/entities/user_entity.dart';
import 'package:chat_app/domain/repositories/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: UserRepository)
class UserRepositoryImpl extends UserRepository {
  final UserDatasourceFactory _datasourceFactory;
  late UserCacheDatasource cacheDatasource;
  late UserCloudDatasource cloudDatasource;

  UserRepositoryImpl(this._datasourceFactory) {
    cloudDatasource = _datasourceFactory.getCloudDatasource();
    cacheDatasource = _datasourceFactory.getCacheDatasource();
  }

  @override
  Future<UserEntity> getUser() {
    return cloudDatasource.getUser();
  }

  @override
  Future<void> signOut() {
    return cloudDatasource.signOut();
  }

  @override
  Future<UserCredential> signUpWithEmailPassword(
      String emailAddress, String password) {
    return cloudDatasource.signUpWithEmailPassword(emailAddress, password);
  }

  @override
  Future<UserCredential> signInWithEmailPassword(
      String emailAddress, String password) {
    return cloudDatasource.signInWithEmailPassword(emailAddress, password);
  }

  @override
  Future<void> updateUser(UserModel input, String uid) {
    return cloudDatasource.updateUser(input, uid);
  }
}
