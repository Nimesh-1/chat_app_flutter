import 'dart:io';

import 'package:chat_app/common/data_resources/data_failure.dart';
import 'package:firebase_core/firebase_core.dart';

class ErrorHandler {
  DataFailure traceErrorException(dynamic error) {
    if (error is FirebaseException) {
      return handleFirebaseError(error);
    } else {
      return DataFailure(
          '000', 'else in traceErrorException', error.toString());
    }
  }

  DataFailure handleFirebaseError(FirebaseException error) {
    if (error is SocketException) {
      return DataFailure('900', error.message, error.toString());
    }
    return DataFailure(error.code, error.message, error.toString());
  }
}
