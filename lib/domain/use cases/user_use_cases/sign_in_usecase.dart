import 'package:chat_app/domain/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignInUsecase {
  final UserRepository _userRepository;

  SignInUsecase(this._userRepository);

  Future<bool> signinWithEmailPassword(
    String emailAddress,
    String password,
  ) {
    return _userRepository.signUpWithEmailPassword(emailAddress, password);
  }
}
