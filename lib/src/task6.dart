import 'dart:io';
import 'dart:math';
void task6Start(){
  print('''Выберите режим из следующего списка:
  1: Создание точки в трехмерном пространстве, вывод ее координат на экран
  2: Расстояние между двумя точками в трехмерном пространстве
  3: Определение площади треугольника по трем точкам
  4: Является ли созданный треугольник правильным?''');
  switch(stdin.readLineSync()!) {
    case '1':
      print('Введите координаты точки по в формате: х, у, z');
      var single = singlePoint();
      print('Координаты созданной точки: '
          'x=${single._x}, '
          'y=${single._y}, '
          'z=${single._z}');
      break;
    case '2':
      print('Введите координаты первой точки по в формате: х, у, z');
      var first = singlePoint();
      print('Введите координаты второй точки по в формате: х, у, z');
      var second = singlePoint();
      print('Расстояние между задаными точками ${first.distanceTo(second).toStringAsFixed(2)}');
      break;
    case '3':
      print('Введите координаты первой вершины треугольника в формате: х, у, z');
      var apex1 = singlePoint();
      print('Введите координаты второй вершины треугольника в формате: х, у, z');
      var apex2 = singlePoint();
      print('Введите координаты третьей вершины треугольника в формате: х, у, z');
      var apex3 = singlePoint();
      double square = apex1.squareOfTriangle(apex2, apex3);
      print('Площадь заданного треугольника ${square.toStringAsFixed(2)}');
      break;
    case '4':
      print('Введите координаты первой вершины треугольника в формате: х, у, z');
      var point1 = singlePoint();
      print('Введите координаты второй вершины треугольника в формате: х, у, z');
      var point2 = singlePoint();
      print('Введите координаты третьей вершины треугольника в формате: х, у, z');
      var point3 = singlePoint();
      point1.isTriangleRight(point2, point3)? print('Ответ: заданный треугольник прямоугольный'):
      print('Ответ: треугольник не является прямоугольным');
      break;
    default:
      print('Нет такого режима!');
      break;
  }
}

Point singlePoint() {
  String coordinates = stdin.readLineSync()!;
  List<String> listXYZ = coordinates.split(", ");
  var single = Point(double.parse(listXYZ[0]), double.parse(listXYZ[1]), double.parse(listXYZ[2]));
  return single;
}

class Point {
  double _x;
  double _y;
  double _z;
  static Point _origin = Point(0,0,0);
  static Point _unitVector = Point(1,1,1);

  Point(this._x, this._y, this._z);

  double get getX => _x;
  double get getY => _y;
  double get getZ => _z;

  set setX(double value) => _x = value;
  set setY(double value) => _y = value;
  set setZ(double value) => _z = value;

  factory Point.origin() {
    if (_origin._x!=0 && _origin._y!=0 && _origin._z!=0) {
      _origin = Point(0, 0, 0);
    }
    return _origin;
  }

  factory Point.unitVector() {
    if (_unitVector._x!=1 && _unitVector._y!=1 && _unitVector._z!=1) {
      _unitVector = Point(1, 1, 1);
    }
    return _unitVector;
  }

  double distanceTo(Point another) {
    double distance = sqrt(pow(_x-another._x, 2)
        +pow(_y-another._y, 2)
        +pow(_z-another._z, 2));
    return distance;
  }
  double squareOfTriangle(Point second, Point third) {
    double a = distanceTo(second);
    double b = distanceTo(third);
    double c = second.distanceTo(third);
    double halfPerimeter = (a+b+c)/2;
    double square = sqrt(halfPerimeter*(halfPerimeter-a)*(halfPerimeter-b)*(halfPerimeter-c));
    return square;
  }

  bool isTriangleRight (Point second, Point third) {
    double a = distanceTo(second);
    double b = distanceTo(third);
    double c = second.distanceTo(third);
    bool result = false;
    if (a>b && a>c) {
      (a*a - b*b - c*c).round()==0? result = true: result = false;
    }
    else if (b>a && b>c) {
      (b*b - a*a - c*c).round()==0? result = true: result = false;
    }
    else {
      (c*c - a*a - b*b).round()==0? result = true: result = false;
    }
    return result;
  }
}