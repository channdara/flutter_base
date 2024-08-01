import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

void logDebug(List<dynamic> contents) {
  if (kDebugMode) print('👉 ${contents.join(' | ')}');
}

void dismissKeyboard() => FocusManager.instance.primaryFocus?.unfocus();
