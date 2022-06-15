
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:youtube/listview.dart';
import 'package:noter/home_page.dart';
import 'package:noter/note_provider.dart';
import 'package:noter/note_model.dart';
 


class EditionScreen extends StatefulWidget {
  const EditionScreen({Key? key}) : super(key: key);

  @override
  State<EditionScreen> createState() => _EditionScreenState();
}

class _EditionScreenState extends State<EditionScreen> {
  bool edit = false;
  // final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String title = '';
  String note = '';
  String description='';
  String id ='';
  DateTime createdTime=DateTime.now();
  bool isDone =false;
  bool isFavourite=false;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserNotifier>(context);
    return Scaffold(
      floatingActionButton: edit
          ? FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.save),
            )
          : null,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                edit = !edit;
              });
            },
            icon: const Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/home');
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Home()));
              Navigator.pushNamed(context, '/home');
              // if (!_formkey.currentState!.validate()) {
              //   return;
              // }
              // _formkey.currentState!.save();
              provider.addUser(User(title, description, id, createdTime, isDone,isFavourite));
              provider.clear();
            },
            icon: const Icon(Icons.add),
          )
        ],
        title: const Text('Edit note'),
        centerTitle: true,
      ),
      body:  
          StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection('Noter').snapshots(),
        builder: (
          context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot,
        ) {
          if (snapshot.connectionState == ConnectionState.waiting) {
         
        builder: (context,  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.amber,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            TextFormField(
                              
                              controller: provider.titlee,
                              //  initialValue:   
                              //  FirebaseFirestore.instance
                              //  .collection('Noter')
                              //  .doc(id)
                              //  .toString(title);
                              // onChanged: (_val) {
                              //   title = _val;
                              // },
                              maxLines: 2,
                              autocorrect: true,
                              
                              decoration: const InputDecoration.collapsed( 
                                hintText: ('Title'),
                              ),
                              style: const TextStyle(
                                fontSize: 32,
                              ),
                              // validator: (value) {
                              //   if (value.toString().isEmpty) {
                              //     return 'Chey your brain dinnor tell you that you should fill it ni?';
                              //   }
                              //   return null;
                              // },
                            ),
                            //  const SizedBox(height: 1,),
                            TextFormField(
                              controller: provider.note,
                              // initialValue: context.read<UserNotifier>().note.text,
                              onChanged: (_val) {
                                note = _val;
                              },
                              maxLines: 50,
                              autocorrect: true, 
                              decoration: const InputDecoration.collapsed(
                                hintText: ('Notes'),
                              ),
                              style: const TextStyle(
                                fontSize: 25,
                              ), 
                            ),  
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        };
      }
  })
    );
  }
}