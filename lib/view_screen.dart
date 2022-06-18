import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:noter/home_page.dart';
import 'package:noter/note_provider.dart';
import 'package:noter/note_model.dart';

class ViewScreen extends StatefulWidget {
  const ViewScreen({Key? key}) : super(key: key);

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  bool edit = false;
  // final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String title = '';
  String description = '';
  String id = '';
  DateTime createdTime = DateTime.now();
  bool isDone = true;
  bool isFavourite=false;
  String email= FirebaseAuth.instance.currentUser!.email!;
 
  


  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserNotifier>(context);
    return Scaffold(
      // floatingActionButton: edit
      //     ? FloatingActionButton(
      //         onPressed: () {},
      //         child: const Icon(Icons.save),
      //       )
      //     : null,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          // IconButton(
          //   onPressed: () {
          //     setState(() {
          //       edit = !edit;
          //     });
          //   },
          //   icon: const Icon(Icons.edit),
          // ),
          IconButton(
            onPressed: () {
              // Navigator.pushNamed(context, '/home');
              // Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Home()));
              provider.addUser(Note(title, description, id, createdTime, isDone,isFavourite,email));
              provider.clear();
              // Navigator.pushNamed(context, '/home');
              // if (!_formkey.currentState!.validate()) {
              //   return;
              // }
              // _formkey.currentState!.save();
            },
            icon: const Icon(Icons.add),
          ),
        ],
        title: const Text('Create a new note'),
        centerTitle: true,
      ),
      body: SafeArea(
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
                          onChanged: (_val) {
                            title = _val;
                            setState(() {
                              title=_val;
                            });
                          },
                          maxLines: 2,
                          autocorrect: true,
                          controller: provider.titlee,
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
                          onChanged: (_val) {
                            description = _val;
                            setState(() {
                              description=_val;
                            });
                          },
                          maxLines: 50,
                          autocorrect: true,
                          controller: provider.note,
                          decoration: const InputDecoration.collapsed(
                            hintText: ('Notes'),
                          ),
                          style: const TextStyle(
                            fontSize: 25,
                          ),
                          // validator: (value) {
                          //   if (value.toString().isEmpty) {
                          //     return 'Chey your brain dinnor tell you that you should fill it ni?';
                          //   }
                          //   return null;
                          // },
                        ),
                        // Row(
                        //   children: const [],
                        // )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
