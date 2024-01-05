import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CurrUserSession extends StateNotifier<Session?> {
  CurrUserSession() : super(null);

  void setUserSession(Session session) {
    state = session;
  }
}

final userSessionProvider = StateNotifierProvider<CurrUserSession, Session?>(
    (ref) => CurrUserSession());
