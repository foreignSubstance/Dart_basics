import 'dart:io';

void task3Start(){
  _readAndConvert();
}
void _readAndConvert() {
  print('Введите строку:');
  String line = stdin.readLineSync()!;
  List<String> arr = [];
  if(line.isNotEmpty) {
    arr = line.split(" ");
    arr.removeWhere((element) => !_isNumber(element));
    if (arr.isNotEmpty) {
      print(arr);
    } else {
      print('Введенная строка не соответствует требованиям!');
    }
  }
  else {
    print('Вы ввели пустую строку!');
  }
}

bool _isNumber(String s) {
  try {
    double.parse(s);
    return true;
  }
  catch (e) {}
  return false;
}
