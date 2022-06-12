import 'package:flutter/cupertino.dart';
import 'package:noter/firebase_api.dart';
import 'package:noter/note_model.dart'; 


class UserNotifier extends ChangeNotifier {
  final TextEditingController _note = TextEditingController();
  final TextEditingController _titlee = TextEditingController();
  final TextEditingController _name = TextEditingController();

  DateTime dateTime = DateTime.now();
  DateTime get createdTime => dateTime;
  // static Object createdTime;
  TextEditingController get titlee => _titlee;
  TextEditingController get note => _note;
  TextEditingController get name => _name;
  bool isDone = false;
  List<User> _userlist = [];
  List<User> get userList => _userlist;

  List<User> get users =>
      _userlist.where((userList) => userList.isDone == false).toList();

  List<User> get userListFavourites =>
      _userlist.where((userList) => userList.isDone == true).toList();

  final String _names = '';
  String get names => _names;

  

  bool toggleUserStatus(User user) {
    user.isDone = !user.isDone;
 FirebaseApi.updateUser(user);
     notifyListeners();

    return user.isDone;
  }

  addUser(User user) => FirebaseApi.createUser(user);
  //  addUser(User user) {
  //   _userlist.add(user);
  //   notifyListeners();
  // }

  clear() {
    _note.clear();
    _titlee.clear();
  }

// addUser(User user)=> FirebaseApi.createNote(user);

// void deleteUser(User user) {
//   _userlist.remove(user);
// }

  deleteUser(index) {
    _userlist.removeWhere((_user) => 
        _user.title ==
        userList[index].title); 
        // change it from _user.note to _user.title
    // notifyListeners();
    FirebaseApi.deleteUser(index);
  }

  // deleteUser(index) =>FirebaseApi.deleteUser(index);

  void setNotes(List<User> user) => _userlist = userList;

  void setNotess(List<User> userList) =>
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        _userlist = userList;
// @override
        notifyListeners();
      });

  favouriteNote(User user) {
    _userlist.add(user);
    notifyListeners();
  }

  void updateUser(User user, String title, String description) {
    user.title = title;
    user.description = description;

    FirebaseApi.updateUser(user);
    notifyListeners();
  }
}
