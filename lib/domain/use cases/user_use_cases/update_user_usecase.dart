import 'package:chat_app/common/default_usecase/default_usecase.dart';
import 'package:chat_app/data/models/user_model.dart';
import 'package:chat_app/domain/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateUserUsecase extends DefaultUseCase<UpdateUserInput, void> {
  final UserRepository _userRepository;

  UpdateUserUsecase(this._userRepository);

  @override
  Future<void> run(UpdateUserInput input) {
    return _userRepository.updateUser(input.userModel, input.uid);
  }
}

class UpdateUserInput {
  final UserModel userModel;
  final String uid;
  UpdateUserInput(this.userModel, this.uid);
}
