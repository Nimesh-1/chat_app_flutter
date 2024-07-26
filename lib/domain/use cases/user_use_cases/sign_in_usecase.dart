import 'package:chat_app/common/default_usecase/default_usecase.dart';
import 'package:chat_app/domain/repositories/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignInUsecase
    extends DefaultUseCase<SignInWithEmailInput, UserCredential> {
  final UserRepository _userRepository;

  SignInUsecase(this._userRepository);
  @override
  Future<UserCredential> run(SignInWithEmailInput input) {
    return _userRepository.signInWithEmailPassword(
        input.emailAddress, input.password);
  }
}

class SignInWithEmailInput {
  String emailAddress;
  String password;

  SignInWithEmailInput(this.emailAddress, this.password);
}
