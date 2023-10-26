import 'package:flutter_test/flutter_test.dart';
import 'package:tdtxle_data_format/date_time_extents.dart';

void main() {
  group('format', () {
    final fecha = DateTime(2023, 9, 15, 15, 24, 32);
    test('D Mm Y H:MM:S', () {
      expect(fecha.format('D Mm Y H:MM:S'), "15 Sep 2023 15:24:32");
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

      final isbetween = hoy.subtract(const Duration(days: 2)).between(manana, ayer);

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
