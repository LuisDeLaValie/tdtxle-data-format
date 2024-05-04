import 'package:flutter/services.dart';

class NumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    if (num.tryParse(newText) == null) {
      return oldValue;
    }
    final endOffset = newValue.text.length - newValue.selection.end;
    final selectionEnd = newText.length - endOffset;

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: selectionEnd),
    );
  }
}
