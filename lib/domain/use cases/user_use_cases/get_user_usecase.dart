import 'package:chat_app/common/default_usecase/default_usecase.dart';
import 'package:chat_app/domain/entities/user_entity.dart';
import 'package:chat_app/domain/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetUserUsecase extends DefaultUseCase<void, UserEntity> {
  final UserRepository _userRepository;

  GetUserUsecase(this._userRepository);

  @override
  Future<UserEntity> run(void input) {
    return _userRepository.getUser();
  }
}
