import 'dart:io';
void task1Start() {
  print('''Выберите режим:
  1: НОД
  2: НОК
  3: Разбиение числа на простые множители''');
  String _usersChoice = stdin.readLineSync()!;
  int result;
  switch (_usersChoice) {
    case '1' :
      result = _gcd();
      if (result!=0) print('Ответ: $result');
      break;
    case '2':
      _lcm();
      break;
    case '3':
      _compositeNumber();
      break;
    default:
      print('Введден неправильный ключ');
      break;
  }
}

List<int> _innerList =[];

void _readLine() {
  try{
    int number = int.parse(stdin.readLineSync()!);
    if (number==0) throw Exception('Введенное число должно быть отличное от 0!');
    _innerList.add(number);
  } on FormatException catch(e) {
    print('Ошибка! Введенная строка не является целым числом!');}
  catch(e) {
    print(e.toString());
  }
}

void _swap(List<int> list) {
  int temp;
  if (list[0]<list[1]) {
    temp = list[0];
    list[0] = list[1];
    list[1] = temp;
  }
}

int _gcd() {
  print('Введите число 1:');
  _readLine();
  if (_innerList.isNotEmpty) {
    print('Введите число 2:');
    _readLine();
    if (_innerList.length!=1) {
      var newList = List<int>.from(_innerList).toList();
      _swap(newList);
      while (newList[1]!=0) {
        newList[0]%=newList[1];
        _swap(newList);
      }
      return newList[0];
    }
    else {
      return 0;
    }
  }
  else {
    return 0;
  }
}

void _lcm () {
  int divisor = _gcd();
  if (divisor!=0) {
    var newList = List<int>.from(_innerList).toList();
    _swap(newList);
    int result = (newList[0]/divisor*newList[1]).toInt();
    print('Ответ: $result');
  }
}

void _compositeNumber() {
  print('Введите число:');
  _readLine();
  if (_innerList.isNotEmpty) {
    int a = _innerList[0];
    List<String> listToDisplay = [];
    if (a==0) {}
    else if (a==1) {
      print('Ответ: 1');
    }
    else {
      for (int i=2; i<=a.abs();) {
        if (a%i==0) {
          listToDisplay.add(i.toString());
          a = a~/i;
          i = 2;
        }
        else {
          i++;
        }
      }
      print('Ответ: ${listToDisplay.join("*")}');
    }
  }
}