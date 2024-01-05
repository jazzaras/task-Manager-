import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthError extends StateNotifier<String?> {
  AuthError() : super(null);

  // void setEmailErr(String err) {
  //   state = [err, state[1], state[2]];
  // }

  setError(String err) {
    state = err;
  }

  clear() {
    state = null;
  }

  // void setUsernameErr(String err) {
  //   state = [state[0], err, state[2]];
  // }

  // void setPasswordErr(String err) {
  //   state = [state[0], state[1], err];
  // }

  // void clearAll() {
  //   state = [null, null, null];
  // }
}

final authErrorProvider =
    StateNotifierProvider<AuthError, String?>((ref) => AuthError());
