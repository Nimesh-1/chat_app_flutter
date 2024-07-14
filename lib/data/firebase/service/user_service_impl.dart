import 'package:chat_app/data/firebase/database_referances.dart';
import 'package:chat_app/data/firebase/service/user_service.dart';
import 'package:chat_app/data/models/user_model.dart';
import 'package:chat_app/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: UserService)
class UserServiceImpl extends UserService {
  @override
  Future<UserEntity> getUser() async {
    var documentSnapshot =
        await FirestoreDatabaseReference.currentUserRef().get();
    var user = UserModel.fromSnapshot(documentSnapshot);
    return user;
  }

  @override
  Future<bool> signOut() async {
    await FirebaseAuth.instance.signOut();
    return Future.value(true);
  }

  @override
  Future<bool> signUpWithEmailPassword(
      String emailAddress, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return Future.value(true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      return Future.value(false);
    } catch (e) {
      print(e);
    }
    return Future.value(false);
  }

  @override
  Future<bool> signinWithEmailPassword(
      String emailAddress, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      return Future.value(true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return Future.value(false);
    }
  }

  @override
  Future<bool> updateUser(UserModel input) async {
    try {
      await FirestoreDatabaseReference.usersColRef().add(input.toDocument());
      return Future.value(true);
    } catch (e) {
      print(e);
      return Future.value(false);
    }
  }
}
