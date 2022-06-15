import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:noter/note_model.dart';
import '../../Models/Note.dart';
import '../../Widgets/utils_snackbar.dart';


class NoteEditingPage extends StatefulWidget {
  final Map note;
  const NoteEditingPage({Key? key, required this.note}) : super(key: key);

  @override
  State<NoteEditingPage> createState() => _NoteEditingPageState();
}

class _NoteEditingPageState extends State<NoteEditingPage> {
  final reference = FirebaseFirestore.instance.collection("notes").doc();
  String title = '';
  String description = '';
  bool isFavourite = false;
  bool isDone = false;
  DateTime createdTime =DateTime.now();
  String id ='';
  final TextEditingController controllerBody = TextEditingController();
  final TextEditingController controllerTitle = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool starFavorite = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    title = widget.note['title'];
    description = widget.note['description'];
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: TextFormField(
            // validator: ,
            // controller: controllerTitle,
            initialValue: title,
            onChanged: (value) {
              setState(() {
                title = value;
              });
            },
            onSaved: (value) {
              setState(() {
                title = value!;
              });
            },
            validator: (value) {
              if (value!.isEmpty) {
                return "can't be empty";
              } else {
                return null;
              }
            },
            style:const TextStyle(fontSize: 27, ),
            decoration: const InputDecoration(
              hintText: "Title...",
              border: InputBorder.none,
              hintStyle: TextStyle(
                fontSize: 27,
              ),
            ),
            // onSaved: (value) {},
          ),
          
          elevation: 2,
          toolbarHeight: 50,
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  updateNote(
                      update: User(title, description, id, createdTime, isDone, isFavourite)
                  Navigator.pop(context);
                } else {
                  return;
                }
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
              )),

          actions: [
            IconButton(
                icon: const Icon(
                  Icons.save_as_outlined,
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    updateNote(
                        update: User(title, description, id, createdTime, isDone, isFavourite)
                    Navigator.pop(context);
                  } else {
                    return;
                  }
                }),
            const SizedBox(
              width: 21,
            ),
          ],
          //Font to use, SemiBold, regular,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextFormField(
                style:const TextStyle(fontSize: 20,),
                maxLines: null,
                // validator: ,
                // controller: controllerBody,
                initialValue: description,
                onChanged: (value) {
                  setState(() {
                    description = value;
                  });
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "can't be empty";
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  setState(() {
                    description = value!;
                  });
                },
                expands: false,
                decoration: const InputDecoration(
                  hintStyle: TextStyle(
                    fontSize: 20,
                  ),
                  border: InputBorder.none,
                  hintText: "Type something...",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future updateNote({
    required User update,
  }) async {
    final docNote =
        FirebaseFirestore.instance.collection('notes').doc(widget.note['id']);

    await docNote.update(update.toJson());
  }

  //Add to Favorites Method
  Future addToFavorites() async {
    final docNote = FirebaseFirestore.instance
        .collection('notes')
        .doc(FirebaseAuth.instance.currentUser!.email);
    final favDocNote =
        docNote.collection('favorite notes').doc(widget.note['id']);
    final favNote = Note(
        isFavorite: false,
        timeAdded: DateTime.now().toString(),
        body: description,
        title: title,
        id: docNote.id,);

    final json = favNote.toJson();
    await favDocNote.set(json);
  }
}