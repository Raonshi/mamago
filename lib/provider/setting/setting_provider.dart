import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mamago/common/tools.dart';
import 'package:mamago/provider/setting/setting_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

final settingProvider = StateNotifierProvider<SettingStateNotifier, SettingState>((ref) => SettingStateNotifier());

class SettingStateNotifier extends StateNotifier<SettingState> {
  late final SharedPreferences _localStorage;
  SettingStateNotifier() : super(const SettingState()) {
    _init();
  }

  void _init() async {
    _localStorage = await SharedPreferences.getInstance();
    if (!_localStorage.containsKey("THEME_MODE")) {
      _localStorage.setString("THEME_MODE", ThemeMode.system.name);
    }

    state = state.copyWith(themeMode: getEnumValueByString(_localStorage.getString("THEME_MODE"), ThemeMode.values));
  }

  void setThemeMode(ThemeMode mode) {
    state = state.copyWith(themeMode: mode);
    _localStorage.setString("THEME_MODE", mode.name);
  }
}
