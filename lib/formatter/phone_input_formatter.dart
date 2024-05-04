import 'package:flutter/services.dart';

class PhoneInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text.replaceAll("-", "");

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    if (newText.length > 10) {
      return oldValue;
    } else {
      newText = phonFormat(newText);
    }

    final endOffset = newValue.text.length - newValue.selection.end;
    final selectionEnd = newText.length - endOffset;

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: selectionEnd),
    );
  }

  String phonFormat(String telefono) {
    String aux = telefono;
    try {
      if (!RegExp(r"^(\d)*$").hasMatch(telefono))
        throw "No se reconoce el formato";
      if (telefono.length > 10) telefono = telefono.substring(0, 10);
      aux = aux.replaceRange(3, 4, "-");
      aux = aux.replaceRange(4, null, telefono.substring(3));

      aux = aux.replaceRange(7, 8, "-");
      aux = aux.replaceRange(8, null, telefono.substring(6));

      return aux;
    } catch (e) {
      if (e is RangeError) {
        return aux;
      }
      rethrow;
    }
    // String? val1 = RegExp(r'(\d{3})(?=\d{7})').firstMatch(telefono)![0];
    // String? val2 =
    //     RegExp(r'(?<=\d{3})(\d{3})(?=\d{4})').firstMatch(telefono)![0];
    // String? val3 = RegExp(r'(?<=\d{6})(\d{4})').firstMatch(telefono)![0];
    // return "$val1-$val2-$val3";
  }
}
