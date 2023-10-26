extension DateTimeExtension on DateTime {
  /// si el atrivuto [**format**] es nulo por defecto el formato es
  /// *D/M/Y* esto con respecto a las sigintes reglas de escritura
  ///
  /// | shorcut | formato | detalles               |
  /// |:--------|:--------|:-----------------------|
  /// | D       | 08      | formatos para dias     |
  /// | d       | 8       | formatos para dias     |
  /// | M       | 07      | formatos para meses    |
  /// | m       | 7       | formatos para meses    |
  /// | Mmm     | Juliuo  | formatos para meses    |
  /// | Mm      | Jul     | formatos para meses    |
  /// | Y       | 2022    | formatos para años     |
  /// | y       | 22      | formatos para años     |
  /// | H       | 02      | formatos para horas    |
  /// | h       | 2       | formatos para horas    |
  /// | MM      | 05      | formatos para minutos  |
  /// | mm      | 5       | formatos para minutos  |
  /// | S       | 07      | formatos para segundos |
  /// | s       | 7       | formatos para segundos |
  ///
  String format([String? format]) {
    final String dia = day.toString().padLeft(2, '0');
    final String mes = month.toString().padLeft(2, '0');
    final String horas = hour.toString().padLeft(2, '0');
    final String minutos = minute.toString().padLeft(2, '0');
    final String segundos = second.toString().padLeft(2, '0');
    final List<String> listaMese = [
      "Enero",
      "Febrero",
      "Marzo",
      "Abril",
      "Mayo",
      "Junio",
      "Julio",
      "Agosto",
      "Septiembre",
      "Octubre",
      "Noviembre",
      "Diciembre"
    ];
    final List<String> listDia = [
      "Lunes",
      "Martes",
      "Miercoles",
      "Jueves",
      "Viernes",
      "Sabado",
      "Domingo"
    ];

    if (format == null) return "$dia/$mes/$year";

    final coincidencias = {
      'D': dia,
      'd': day.toString(),
      'DD': listDia[weekday - 1],
      'dd': listDia[weekday - 1].substring(0, 3),
      'Mmm': listaMese[month - 1],
      'Mm': listaMese[month - 1].substring(0, 3),
      'M': mes,
      'm': month.toString(),
      'Y': year.toString(),
      'y': year.toString().substring(2),
      'H': horas,
      'h': hour.toString(),
      'MM': minutos,
      'mm': minute.toString(),
      'S': segundos,
      's': second.toString(),
    };

    var expre = r"(DD|dd|D|d|Mmm|Mm|Y|y|H|h|MM|mm|S|s|M|m)|.";
    var matches = RegExp(expre).allMatches(format).map((e) => e[0]!).toList();

    for (var i = 0; i < matches.length; i++) {
      final matche = matches[i];
      final value = coincidencias[matche];

      if (value != null) {
        matches[i] = value;
      }
    }

    format = matches.join("");

    return format;
  }

  bool between(DateTime after, DateTime before) {
    var bef = isBefore(before);
    var aft = isAfter(after);
    return bef && aft;
  }

  int get weekMonth {
    var auxday = 0;
    var auxsemana = 0;

    if (day <= 8) {
      auxday = 1;
      auxsemana = 1;
    } else if (day <= 15) {
      auxday = 8;
      auxsemana = 2;
    } else if (day <= 22) {
      auxday = 15;
      auxsemana = 3;
    } else if (day <= 29) {
      auxday = 22;
      auxsemana = 4;
    } else {
      auxday = 29;
      auxsemana = 5;
    }

    var week = DateTime(year, month, auxday).weekday;
    var se = day - auxday;
    return ((week + se) > 7) ? auxsemana + 1 : auxsemana;
  }
}
