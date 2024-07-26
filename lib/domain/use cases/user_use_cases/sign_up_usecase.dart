import 'package:chat_app/common/default_usecase/default_usecase.dart';
import 'package:chat_app/domain/repositories/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignUpUsecase
    extends DefaultUseCase<SignUpWithEmailInput, UserCredential> {
  final UserRepository _userRepository;

  SignUpUsecase(this._userRepository);

  @override
  Future<UserCredential> run(SignUpWithEmailInput input) {
    return _userRepository.signUpWithEmailPassword(
        input.emailAddress, input.password);
  }
}

class SignUpWithEmailInput {
  String emailAddress;
  String password;

  SignUpWithEmailInput(this.emailAddress, this.password);
}
