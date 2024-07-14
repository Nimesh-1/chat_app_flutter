import 'package:chat_app/domain/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignOutUsecase {
  final UserRepository _userRepository;

  SignOutUsecase(this._userRepository);

  Future<bool> signout() {
    return _userRepository.signOut();
  }
}
