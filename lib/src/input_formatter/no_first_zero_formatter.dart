import 'package:flutter/services.dart';

class NoFirstZeroFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text[0] == '0') {
      return TextEditingValue(
        text: newValue.text.substring(1),
        selection: TextSelection.collapsed(offset: newValue.text.length - 1),
      );
    }
    return newValue;
  }
}
