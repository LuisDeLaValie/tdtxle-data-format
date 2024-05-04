import 'package:flutter/services.dart';

class MoneyFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text.replaceAll("\$ ", "");

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    if (double.tryParse(newText) == null) {
      return oldValue;
    } else {
      newText = newText.replaceFirst("0.", "");
      newText = newText.replaceAll(".", "");

      if (newText.length > 2) {
        var v1 = newText.substring(0, newText.length - 2);
        var v2 = newText.substring(newText.length - 2);
        newText = "\$ $v1.$v2";
      } else {
        newText = "\$ 0.$newText";
      }
    }

    final endOffset = newValue.text.length - newValue.selection.end;
    final selectionEnd = newText.length - endOffset;

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: selectionEnd),
    );
  }
}
