import "package:flutter_riverpod/flutter_riverpod.dart";

class navScreen extends StateNotifier<int> {
  // the inital page displayed on the screen
  navScreen() : super(3);

  void changePageAndPos(int index) {
    state = index;
  }
}

final navScreenProvider =
    StateNotifierProvider<navScreen, int>((ref) => navScreen());
