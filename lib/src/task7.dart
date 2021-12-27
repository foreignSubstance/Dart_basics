import 'dart:io';

void task7Start(){
  print('Введите число');
  double number = double.parse(stdin.readLineSync()!);
  print('Введите показатель степени:');
  int exponent = int.parse(stdin.readLineSync()!);
  print('Введите точность:');
  double accuracy = double.parse(stdin.readLineSync()!);
  print('Корень $exponent-й степени числа "$number" = ${number.compute(exponent, accuracy)}');
}

extension Root on num{
  double compute(int exponent, double accuracy) {
    double result = 0;
    try {
      if (this<0) throw ArgumentError('Введенное число меньше 0!');
      if (accuracy>1) throw ArgumentError('Введенное значение точности недопустимо!');
      if (exponent<2) throw ArgumentError('Показатель степени должен быть больше 2!');
      result = toDouble();
      while ((this+accuracy)<_pow(result, exponent)) {
        result = ((exponent-1)*result + this/_pow(result, exponent-1))/exponent;
        print('Stage: $result');
      }
      return result;
    }
    catch (e) {
      print('Ошибка: $e');
    }
    return result;
  }
}

double _pow(double number, int degree) {
  degree>0? number*=_pow(number, degree-1) : number = 1;
  return number;
}