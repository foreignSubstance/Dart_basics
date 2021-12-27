import 'dart:io';

void task4Start(){
  _readAndCreate();
}

String _lineToProc = "";
String _separator = "";
Map<String,int> _result = {};
String _testString = '''Sed/*-+ vulputate/*-+ quam/*-+ non/*-+ tortor/*-+ accumsan/*-+ aliquet/*-+
Sed/*-+ vulputate/*-+ vulputate/*-+ non/*-+ non/*-+ non/*-+ non''';

void _readAndCreate() {
  print('''Выберите режим:
  1: ручной ввод строки
  2: использовние тестовой строки''');
  switch (stdin.readLineSync()!) {
    case '1':
      print('Введите строку');
      _lineToProc = stdin.readLineSync()!;
      break;
    case '2': _lineToProc = ""+_testString;
      break;
    default:
      print('Введенное значение не соответствует ни одному из режимов');
      break;
  }
  if (_lineToProc.isNotEmpty) {
    print ('''На основе введенной строки будет создана коллекция.
  Введите разделяющий символ:''');
    _separator = stdin.readLineSync()!;
    _countUnique();
  }
  else {
    print('Вы ввели пустую строку! Результат не будет отображен.');
  }
}

void _countUnique() {
    List<String> listItems = _lineToProc.split(_separator);
    Set<String> uniqueItems = listItems.toSet();
    for (String setLine in uniqueItems) {
      int count = 0;
      for (String listLine in listItems) {
        if (setLine==listLine) count++;
      }
      _result.addAll({setLine : count});
    }
    print(_result);
}