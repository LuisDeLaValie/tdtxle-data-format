
## Format

money
--
```dart
TextFormField(
    inputFormatters: [MoneyFormatter()],
    keyboardType: TextInputType.number,    
),
```
Phone
--
```dart
TextFormField(
    inputFormatters: [PhoneInputFormatter()],
    keyboardType: TextInputType.phone,    
),
```
nomber
--
```dart
TextFormField(
    inputFormatters: [NumberFormatter()],
    keyboardType: TextInputType.number,    
),
```

## Estenciones
Date
--
```dart
    final fecha = DateTime(2023, 9, 15, 15, 24, 32);
    
    fecha.format('D {de} Mm {del} Y H:MM:S') // 15 de Sep del 2023 15:24:32

    fecha.format('d Mm Y H:MM:S') // "15 Sep 2023 15:24:32"
    
    fecha.format('dd D Mm Y H:MM:S') // "Vie 15 Sep 2023 15:24:32"
    
    fecha.format('DD D Mm Y H:MM:S') // "Viernes 15 Sep 2023 15:24:32"
```

 si el atrivuto [**format**] es nulo por defecto el formato es
 *D/M/Y* esto con respecto a las sigintes reglas de escritura

 | shorcut | formato | detalles               |
 |:--------|:--------|:-----------------------|
 | D       | 08      | formatos para dias     |
 | d       | 8       | formatos para dias     |
 | M       | 07      | formatos para meses    |
 | m       | 7       | formatos para meses    |
 | Mmm     | Juliuo  | formatos para meses    |
 | Mm      | Jul     | formatos para meses    |
 | Y       | 2022    | formatos para años     |
 | y       | 22      | formatos para años     |
 | H       | 02      | formatos para horas    |
 | h       | 2       | formatos para horas    |
 | MM      | 05      | formatos para minutos  |
 | mm      | 5       | formatos para minutos  |
 | S       | 07      | formatos para segundos |
 | s       | 7       | formatos para segundos |

nombre
--

```dard
 1500.toMOney() // $1500.00

 15.24566.parsevalor(2) // 15.24

```