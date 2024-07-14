import 'package:chat_app/data/data_source/user/user_cache_datasource.dart';
import 'package:chat_app/data/data_source/user/user_cloud_datasource.dart';
import 'package:injectable/injectable.dart';

@injectable
class UserDatasourceFactory {
  final UserCacheDatasource _cacheDatasource;
  final UserCloudDatasource _cloudDatasource;

  UserDatasourceFactory(this._cacheDatasource, this._cloudDatasource);

  UserCacheDatasource getCacheDatasource() {
    return _cacheDatasource;
  }

  UserCloudDatasource getCloudDatasource() {
    return _cloudDatasource;
  }
}
