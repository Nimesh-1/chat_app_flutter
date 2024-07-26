import 'package:chat_app/common/default_usecase/default_usecase.dart';
import 'package:chat_app/domain/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignOutUsecase extends DefaultUseCase<void, void> {
  final UserRepository _userRepository;

  SignOutUsecase(this._userRepository);

  @override
  Future<void> run(void input) {
    return _userRepository.signOut();
  }
}
