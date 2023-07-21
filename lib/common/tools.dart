import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

Logger get lgr => Logger();

Timer debouncer(Timer? debounce, VoidCallback callback, [Duration duration = const Duration(milliseconds: 300)]) {
  if (debounce != null) debounce.cancel();
  debounce = Timer(duration, callback);
  return debounce;
}

T getEnumValueByString<T extends Object>(String? value, List<T> values) {
  if ((value ?? "").isEmpty) return values.first;
  return values.firstWhere((element) => describeEnum(element) == value);
}
