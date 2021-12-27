import 'dart:io';
import 'package:dart_basics/my_lib.dart' as lib;
void main(List<String> arguments) {
  print('''Введите ключ соответствующий заданию из следующего списка:
  1: НОК, НОД, простые множители
  2: Целые числа: из десятичной в двоичную и обратно
  3: Коллекция из чисел присутствующих в строке
  4: Количество вхождений слова в коллекцию
  5: Цифры без повторений в строке
  6: Точка в трехмерном пространстве
  7: Корень заданной степени из числа
  8: Наследование, дженерики, использование миксинов
  ${'-'*13}
  Введите ключ:''');
  switch (stdin.readLineSync()!) {
    case '1':
      lib.task1Start();
      break;
    case '2':
      lib.task2Start();
      break;
    case '3':
      lib.task3Start();
      break;
    case '4':
      lib.task4Start();
      break;
    case '5':
      lib.task5Start();
      break;
    case '6':
      lib.task6Start();
      break;
    case '7':
      lib.task7Start();
      break;
    case '8':
      lib.task8Start();
      break;
    default:
      print('Введенный ключ не соответствует ни одному из заданий');
      break;
  }
}