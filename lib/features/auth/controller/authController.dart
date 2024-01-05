import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:task_manager/Core/providers/AuthErrorProvider.dart';
import 'package:task_manager/features/auth/repository/authRepository.dart';
import 'package:task_manager/Core/providers/UserProvider.dart';

final authControllerProvider = Provider((ref) => AuthController(ref));

class AuthController {
  final ProviderRef _ref;

  AuthController(this._ref);
  final supabase = Supabase.instance.client;

  setSession() {
    // checking if an error occurred

    if (_ref.read(authErrorProvider) == null) {
      _ref
          .watch(userSessionProvider.notifier)
          .setUserSession(supabase.auth.currentSession!);
    }
  }

  Future<void> signUp(
      {required String email,
      required String password,
      required String username}) async {
    try {
      await _ref
          .read(authRepositoryProvider)
          .signUp(email: email, password: password, username: username);

      setSession();
    } on AuthException catch (err) {
      if (err.statusCode == "422") {
        _ref.read(authErrorProvider.notifier).setError(err.message);
      } else if (err.statusCode == "400") {
        _ref.read(authErrorProvider.notifier).setError(err.message);
      }
      // print(err);
    }
  }

  Future<void> signIn({required String email, required String password}) async {
    try {
      await _ref
          .read(authRepositoryProvider)
          .signIn(email: email, password: password);
      setSession();
    } on AuthException catch (err) {
      if (err.message == "Invalid login credentials") {
        _ref
            .read(authErrorProvider.notifier)
            .setError("Incorrect Email or Password");

        return;
      }

      _ref.read(authErrorProvider.notifier).setError(err.message);
    }
  }
}
