import 'dart:io';
void task2Start() {
  print('''Выберите режим:
  1: из десятичной в двоичную
  2: из двоичной в десятичную''');
  String _usersChoice = stdin.readLineSync()!;
  switch (_usersChoice) {
    case '1' :
      _toBin();
      break;
    case '2':
      _toDec();
      break;
  }
}
bool _isBin(String line) {
  bool result = false;
  for (int i=0; i<line.length; i++) {
    if (line[i]=='0' || line[i]=='1') {
      result = true;
    }
    else {
      result = false;
      break;
    }
  }
  return result;
}

bool _isDec(String line) {
  try {
    int.parse(line);
    return true;
  }
  catch (e) {}
  return false;
}

void _toBin() {
  print('Введите число в десятичной системе:');
  String s = _convertLine(stdin.readLineSync()!);
  print(s);
  if (_isDec(s)) {
    String bin = "";
    for (int number = int.parse(s); number>0; number~/=2) {
      bin = (number%2).toString() + bin;
    }
    if (bin=="") bin = '0000';
    if (bin.length%4!=0) bin = '0'*(4-bin.length%4) + bin;
    print('Ответ: $bin');
  }
  else {
    print('Введенная строка не является числом!');
  }
}

void _toDec() {
  print('Введите число в двоичной системе:');
  String s = _convertLine(stdin.readLineSync()!);
  int dec = 0;
  if (_isBin(s)) {
    for (int i=0; i<s.length; i++) {
      int a = int.parse(s[i]);
      if (a!=0) dec = a*_pow(2, s.length-1-i) + dec;
    }
    print('Ответ: $dec');
  }
  else {
    print("Введенная строка не является двоичным числом!");
  }
}

int _pow(int number, int degree) {
  degree>0? number*=_pow(number, degree-1) : number = 1;
  return number;
}

String _convertLine(String line) {
  return line.replaceAll(RegExp(r' '), '');
}