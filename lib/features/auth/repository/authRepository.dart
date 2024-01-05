import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final authRepositoryProvider = Provider((ref) => AuthRepository());

class AuthRepository {
  Future<void> signUp(
      {required String email,
      required String password,
      required String username}) async {
    final supabase = Supabase.instance;

    try {
      await supabase.client.auth.signUp(
          email: email, password: password, data: {"username": username});
    } catch (err) {
      rethrow;
    }
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    final supabase = Supabase.instance;

    try {
      await supabase.client.auth
          .signInWithPassword(email: email, password: password);
    } catch (err) {
      rethrow;
    }
  }
}
