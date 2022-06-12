// import 'package:note/utils.dart';
// import 'package:note/utils.dart';

class User {
  String title;
  String description;
  String id;
  DateTime createdTime;
  bool isDone
  //  = false
   ;
  User(this.title, this.description, this.id, this.createdTime, this.isDone);

  User fromJson(Map<String, dynamic> json) => User(
        json['title'],
        json['description'],
        json['id'],
        json['createdTime'],
        json['isDone'],
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'id': id,
        'createdTime': createdTime,
        'isDone': isDone,
      };
}





























// class Note {
//   String title;
//   String description;
//   String id;
//   DateTime createdTime;
//   bool isDone = false;
//   Note(this.title, this.description, this.id, this.createdTime, this.isDone);

//   Note fromJson(Map<String, dynamic> json) => Note(
//         json['title'],
//         json['description'],
//         json['id'],
//         json['createdTime'],
//         json['isDone'],
//       );

//   Map<String, dynamic> toJson() => {
//         'title': title,
//         'description': description,
//         'id': id,
//         'createdTime': createdTime,
//         'isDone': isDone,
//       };
// }
