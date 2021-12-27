import 'dart:io';

void task8Start(){
  print("Выберите один из режимов:");
  var manager = UserManager();
  entryPoint: while (true) {
    print('1: отобразить аакаунты${" "*5}2: добавить новый${" "*5}3: удалить существующий${" "*5}4:выход');
    String choice = stdin.readLineSync()!;
    switch (choice) {
    case '1':
      String outputLine = 'Добавлены аккаунты: ${manager.getUsers()}';
      print(' ');
      print('-'*outputLine.length);
      print(outputLine);
      print('-'*outputLine.length);
      print(' ');
      continue entryPoint;
    case '2':
      print('Введите e-mail и тип аккаунта в формате "xxx@xxx.xx, admin/user"');
      var mailAndType = stdin.readLineSync()!.split(", ");
      if (mailAndType[1]=="admin") manager.add(AdminUser(mailAndType[0]));
      if (mailAndType[1]=="user") manager.add(GeneralUser(mailAndType[0]));
      continue entryPoint;
    case '3':
      print('Введите e-mail для удаления:');
      var mailToRemove = stdin.readLineSync()!;
      var iterator = manager.iterator;
      while(iterator.moveNext()) {
        if (iterator.current.getMail==mailToRemove) {
          manager.remove(iterator.current);
          break;
        }
      }
      continue entryPoint;
    case '4':
      break entryPoint;
    default:
      print(' ');
      print('-'*29);
      print('Данного режима не существует!');
      print('-'*29);
      print(' ');
      continue entryPoint;
  }
  }
}

abstract class User{
  final String _eMail;

  User(this._eMail);

  String get getMail=> _eMail;
}

class AdminUser extends User with MailSystem{
  AdminUser(String adminMail): super(adminMail);

}

class GeneralUser extends User {
  GeneralUser(String generalMail): super(generalMail);
}

mixin MailSystem on User {
  String getMailSystem() {
    String mail = getMail;
    int counter = 0;
    List<String> list = mail.split("");
    for (String a in list) {
      if (a=="@") counter++;
    }
    String mailSystem = "";
    try {
      if (counter==1 && mail.indexOf('@')!=mail.length-1 && mail.indexOf('@')!=0) {
        mailSystem = mail.substring(mail.indexOf("@")+1);
      }
      else {
        throw FormatException('e-mail "$mail" введен в неправильном формате');
      }
    }
    catch(e) {
      print('$e');
    }
    return mailSystem;
  }
}

class UserManager<T extends User>{
   var _users = <T>[];

  void add(T newUser) => _users.add(newUser);
  void remove(T userToRemove) => _users.remove(userToRemove);

  List<String> getUsers() {
    var forOutput = <String>[];
    for (T user in _users) {
      user is AdminUser? forOutput.add(user.getMailSystem()): forOutput.add(user.getMail);
    }
    return forOutput;
  }
  UserIterator get iterator{
    return UserIterator(_users);
  }
}

class UserIterator extends Iterator<User> {
  List<User> list = [];
  User? _current;
  int index = 0;

  UserIterator(this.list);

  @override
  bool moveNext() {
    if (index==list.length) {
      _current = null;
      return false;
    }
    else {
      _current = list[index++];
      return true;
    }
  }

  @override
  User get current=> _current as User;
}