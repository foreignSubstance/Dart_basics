import 'dart:io';

void task5Start(){
  _createCollect();
}
void _createCollect() {
  print('Введите строку, на основе которой будет создана коллекция:');
  String s = _convertLine(stdin.readLineSync()!);
  if (s.isNotEmpty) {
    print('Введите разделяющий символ:');
    String separator = stdin.readLineSync()!;
    List<String> collection = s.toLowerCase().split(separator);
    Set<int> result = _lineToNumberCol(collection);
    result.isNotEmpty? print('Строка содержит числа: $result') : print('Введенная строка не содержит чисел!');
  }
  else {
    print('Была введена пустая строка, невозможно создать коллекцию!');
  }
}

Set<int> _lineToNumberCol(List<String> list) {
  Set<int> result = {};
  Map<String, int> map = {"zero" : 0, "one" : 1, "two" : 2, "three" : 3,
    "four" : 4, "five" : 5, "six" : 6,
    "seven" : 7, "eight": 8 , "nine" : 9};
  for (var entry in map.entries) {
    for (var element in list) {
      if (element == entry.key) result.add(entry.value);
    }}
  return result;
}

String _convertLine(String line) {
  return line.replaceAll(RegExp(r' '), '');
}