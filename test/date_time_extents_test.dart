import 'package:flutter_test/flutter_test.dart';
import 'package:tdtxle_data_format/date_time_extents.dart';

void main() {
  
  test("asdsda", () {
    var expre = r"(DD|dd|D|d|Mmm|Mm|Y|y|H|h|MM|mm|S|s|M|m|{\w+})|.";
    var matches = RegExp(expre).allMatches('D {de} Mm {del} Y H:MM:S').map((e) => e[0]!).toList();
    
    print(matches);
    print(matches.length);

  });

  group('format', () {
    final fecha = DateTime(2023, 9, 15, 15, 24, 32);
    test('D Mm Y H:MM:S', () {
      expect(fecha.format('D {de} Mm {del} Y H:MM:S'), "15 de Sep del 2023 15:24:32");
    });
    test('d Mm Y H:MM:S', () {
      expect(fecha.format('d Mm Y H:MM:S'), "15 Sep 2023 15:24:32");
    });
    test('dd D Mm Y H:MM:S', () {
      expect(fecha.format('dd D Mm Y H:MM:S'), "Vie 15 Sep 2023 15:24:32");
    });
    test('DD D Mm Y H:MM:S', () {
      expect(fecha.format('DD D Mm Y H:MM:S'), "Viernes 15 Sep 2023 15:24:32");
    });
  });

  group('between', () {
    test("Prueba Forzada", () {
      final finaInicio = DateTime(2000, 1, 10);
      final finafinal = DateTime(2000, 1, 20);

      expect(DateTime(2000, 1, 1).between(finaInicio, finafinal), false);
      expect(DateTime(2000, 1, 2).between(finaInicio, finafinal), false);
      expect(DateTime(2000, 1, 3).between(finaInicio, finafinal), false);
      expect(DateTime(2000, 1, 4).between(finaInicio, finafinal), false);
      expect(DateTime(2000, 1, 5).between(finaInicio, finafinal), false);
      expect(DateTime(2000, 1, 6).between(finaInicio, finafinal), false);
      expect(DateTime(2000, 1, 7).between(finaInicio, finafinal), false);
      expect(DateTime(2000, 1, 8).between(finaInicio, finafinal), false);
      expect(DateTime(2000, 1, 9).between(finaInicio, finafinal), false);
      expect(DateTime(2000, 1, 10).between(finaInicio, finafinal), true);
      expect(DateTime(2000, 1, 11).between(finaInicio, finafinal), true);
      expect(DateTime(2000, 1, 12).between(finaInicio, finafinal), true);
      expect(DateTime(2000, 1, 13).between(finaInicio, finafinal), true);
      expect(DateTime(2000, 1, 14).between(finaInicio, finafinal), true);
      expect(DateTime(2000, 1, 15).between(finaInicio, finafinal), true);
      expect(DateTime(2000, 1, 16).between(finaInicio, finafinal), true);
      expect(DateTime(2000, 1, 17).between(finaInicio, finafinal), true);
      expect(DateTime(2000, 1, 18).between(finaInicio, finafinal), true);
      expect(DateTime(2000, 1, 19).between(finaInicio, finafinal), true);
      expect(DateTime(2000, 1, 20).between(finaInicio, finafinal), true);
      expect(DateTime(2000, 1, 21).between(finaInicio, finafinal), false);
      expect(DateTime(2000, 1, 22).between(finaInicio, finafinal), false);
      expect(DateTime(2000, 1, 23).between(finaInicio, finafinal), false);
      expect(DateTime(2000, 1, 24).between(finaInicio, finafinal), false);
      expect(DateTime(2000, 1, 25).between(finaInicio, finafinal), false);
      expect(DateTime(2000, 1, 26).between(finaInicio, finafinal), false);
      expect(DateTime(2000, 1, 27).between(finaInicio, finafinal), false);
      expect(DateTime(2000, 1, 28).between(finaInicio, finafinal), false);
      expect(DateTime(2000, 1, 29).between(finaInicio, finafinal), false);
      expect(DateTime(2000, 1, 30).between(finaInicio, finafinal), false);
      expect(DateTime(2000, 1, 31).between(finaInicio, finafinal), false);
    });

    test("between", () {
      final hoy = DateTime.now();
      final ayer = DateTime(hoy.year, hoy.month, hoy.day - 1);
      final manana = DateTime(hoy.year, hoy.month, hoy.day + 1);

      final isbetween = hoy.between(ayer, manana);

      expect(isbetween, true);
    });

    test("between inverso", () {
      final hoy = DateTime.now();
      final ayer = DateTime(hoy.year, hoy.month, hoy.day - 1);
      final manana = DateTime(hoy.year, hoy.month, hoy.day + 1);

      final isbetween = hoy.between(manana, ayer);

      expect(isbetween, false);
    });
    test("antes de rango", () {
      final hoy = DateTime.now();
      final ayer = DateTime(hoy.year, hoy.month, hoy.day - 1);
      final manana = DateTime(hoy.year, hoy.month, hoy.day + 1);

      final isbetween =
          hoy.subtract(const Duration(days: 2)).between(manana, ayer);

      expect(isbetween, false);
    });
    test("despues de rango", () {
      final hoy = DateTime.now();
      final ayer = DateTime(hoy.year, hoy.month, hoy.day - 1);
      final manana = DateTime(hoy.year, hoy.month, hoy.day + 1);

      final isbetween = hoy.add(const Duration(days: 2)).between(manana, ayer);

      expect(isbetween, false);
    });
  });
}
