import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mamago/provider/home/home_state.dart';

final homeProvider = StateNotifierProvider<HomeStateNotifer, HomeState>((ref) => HomeStateNotifer());

class HomeStateNotifer extends StateNotifier<HomeState> {
  HomeStateNotifer() : super(const HomeState());

  void switchConvertingDirection() {
    state = state.copyWith(isLeft: !state.isLeft);
  }
}
