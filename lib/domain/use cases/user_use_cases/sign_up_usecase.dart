import 'package:chat_app/domain/repositories/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignUpUsecase {
  final UserRepository _userRepository;

  SignUpUsecase(this._userRepository);

  Future<UserCredential> signUpWithEmailPassword(
    String emailAddress,
    String password,
  ) {
    return _userRepository.signUpWithEmailPassword(emailAddress, password);
  }
}
