import 'package:chat_app/data/models/user_model.dart';
import 'package:chat_app/domain/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateUserUsecase {
  final UserRepository _userRepository;

  UpdateUserUsecase(this._userRepository);

  Future<bool> updateUser(UserModel input) {
    return _userRepository.updateUser(input);
  }
}
