import "package:flutter_riverpod/flutter_riverpod.dart";

class navScreen extends StateNotifier<int> {
  // the inital page displayed on the screen
  navScreen() : super(0);

  void changePageAndPos(int index) {
    state = index;
  }
}

final navScreenProvider =
    StateNotifierProvider<navScreen, int>((ref) => navScreen());
