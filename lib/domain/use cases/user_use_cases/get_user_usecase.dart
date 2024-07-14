import 'package:chat_app/domain/entities/user_entity.dart';
import 'package:chat_app/domain/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetUserUsecase {
  final UserRepository _userRepository;

  GetUserUsecase(this._userRepository);

  Future<UserEntity> getUser() {
    return _userRepository.getUser();
  }
}
