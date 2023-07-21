import 'dart:math';

import 'package:flutter/material.dart';

class ThemeSwitchDialog extends StatefulWidget {
  const ThemeSwitchDialog({super.key, required this.initialThemeMode, required this.onChangeThemeMode});

  final ThemeMode initialThemeMode;
  final ValueChanged<ThemeMode> onChangeThemeMode;

  @override
  State<ThemeSwitchDialog> createState() => _ThemeSwitchDialogState();
}

class _ThemeSwitchDialogState extends State<ThemeSwitchDialog> {
  bool _isChecked = false;
  bool _isSwitchEnabled = false;

  @override
  void initState() {
    _isChecked = widget.initialThemeMode == ThemeMode.system;
    _isSwitchEnabled = widget.initialThemeMode == ThemeMode.dark;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Theme Switch"),
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.close),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CheckboxListTile(
            value: _isChecked,
            onChanged: (value) {
              setState(() {
                _isChecked = value ?? false;
              });

              widget.onChangeThemeMode(_isChecked ? ThemeMode.system : ThemeMode.light);
            },
            title: const Text("Enable system theme Mode"),
          ),
          Visibility(
            visible: !_isChecked,
            child: SwitchListTile.adaptive(
              value: _isSwitchEnabled,
              onChanged: (value) {
                setState(() {
                  _isSwitchEnabled = value;
                });
                widget.onChangeThemeMode(value ? ThemeMode.dark : ThemeMode.light);
              },
              title: const Text("Dark mode"),
            ),
          ),
        ],
      ),
    );
  }
}
