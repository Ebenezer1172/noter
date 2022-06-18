import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:noter/firebase_api.dart';
import 'package:noter/note_model.dart';
import 'package:provider/provider.dart';
import 'package:noter/note_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

// import 'package:noter/note_model.dart';

class Favourites extends StatelessWidget {
  const Favourites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   // ignore: unused_local_variable
   bool isFavourite=true;
 bool  isDone=false;
 String email='';
     final provider = Provider.of<UserNotifier>(context);
    // noteList is the list of notes
    // final noteList = provider.userListFavourites;
  return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection('Noter')
            .where('email',isEqualTo: FirebaseAuth.instance.currentUser!.email)
            .where('isFavourite',isEqualTo: true)
            .snapshots(),
        builder: (
          context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot,
        ) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {

            //
            return ListView.separated(
                separatorBuilder: ((context, index) => Container(
                      color: Colors.green,
                      height: 1,
                    )),
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                shrinkWrap: true,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, index) {
                  final note = snapshot.data!.docs[index].data();

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                       splashColor: Colors.green,
                               onTap: (){

                               },
                      child: Card(
                        color: Colors
                            .primaries[Random().nextInt(Colors.primaries.length)],
                        child: Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            IconButton(color: Colors.red,
                                               onPressed: () { 
                                                FirebaseFirestore.instance
                                            .collection('Noter')
                                            .doc(note['id'])
                                            .update( {'isFavourite':  false,}  ); 
                                             const snackBar =  SnackBar(content:  Text('Removed from Favourites'),);
                                          ScaffoldMessenger.of(context).showSnackBar(snackBar); 
                                             }, 
                                              icon: const Icon(
                                                  Icons.favorite),
                                            ), 
                                            const SizedBox(
                                              width: 1,
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                provider.deleteUser(Note('title', 'description', id, createdTime, isDone , isFavourite,email));
                                                const snackBar =  SnackBar(content:  Text('Note Deleted'),);
                                          ScaffoldMessenger.of(context).showSnackBar(snackBar); 
                                              },
                                              icon: const Icon(
                                                  Icons.delete_forever),
                                            ),
                                          ]),
                                      Text(
                                        note['title'] ??= "",
                                        softWrap: true,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 2,
                                      ),
                                      Text(
                                        note['description'] ??= "",
                                        style: const TextStyle(fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                });
                //
          }
          return const Center(
            child: Text(
              'No New Notes',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                  color: Colors.green),
            ),
          );
        });
  }
}
//     return noteList.isEmpty
//         ? const Center(
//             child: Text(
//             'No Favourite Notes',
//             style: TextStyle(
//                 fontWeight: FontWeight.bold, fontSize: 40, color: Colors.blue),
//           ))
//         : ListView.separated(
//             separatorBuilder: ((context, index) => Container(
//                   color: const Color.fromARGB(255, 255, 255, 255),
//                   height: 1,
//                 )),
//             physics: const BouncingScrollPhysics(
//               parent: AlwaysScrollableScrollPhysics(),
//             ),
//             shrinkWrap: true,
//             // itemCount is the length of the list of notes
//             itemCount: noteList.length,
//             itemBuilder: (BuildContext context, index) {
//               // to get each note in our note list, we say look in the index
//               final note = noteList[index];
//               return ClipRRect(
//                 borderRadius: BorderRadius.circular(20),
//                 child: Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                       // semanticContainer: false,
//                       color: Colors.blue,
//                       // elevation: 15,
//                       // shadowColor: Colors.red,
//                       child:
//                           //  InkWell(
//                           //    splashColor: Colors.black,
//                           //    onTap: (){
//                           //    },
//                           //    child:   Text(
//                           //               note.title ,
//                           //               style: const TextStyle(
//                           //                   color: Colors.white,
//                           //                   fontSize: 18,
//                           //                   fontWeight: FontWeight.bold),
//                           //             ),
//                           //  ),

//                           //

//                           InkWell(
//                         splashColor: const Color.fromARGB(255, 26, 26, 26),
//                         onTap: () {
//                           // Navigator.pushNamed(context, '/viewscreen');
//                         },
//                         child: Padding(
//                           padding: const EdgeInsets.all(16),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Expanded(
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Row(
//                                       children: [
//                                         Form(
//                                           child: Column(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.start,
//                                             children: const [
//                                               //  TextFormField(

//                                               //                       autocorrect: true,
//                                               //                       controller: _note
//                                               //                       //  provider.titlee
//                                               //                        ,
//                                               //                       decoration: const InputDecoration.collapsed(
//                                               //                         hintText: ('Title'),
//                                               //                       ),
//                                               //                       style: const TextStyle(
//                                               //                       ),
//                                               //                     ),
//                                               // TextFormField(
//                                               //   autocorrect: true,
//                                               //   // controller: provider.note.text,
//                                               //   decoration: const InputDecoration.collapsed(
//                                               //     hintText: ('Notes'),
//                                               //   ),
//                                               //   style: const TextStyle(
//                                               //   ),
//                                               // ),
//                                             ],
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     const SizedBox(
//                                       height: 20,
//                                     ),
//                                     Text(
//                                       'Title: ' + note.title,
//                                       softWrap: true,

//                                       // note.title ,
//                                       // gives us the title for the respective note
//                                       style: const TextStyle(
//                                           color: Colors.white,
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                     const SizedBox(
//                                       height: 20,
//                                     ),
//                                     Text(
//                                       'Note: ' + note.description,

//                                       // context.read<UserNotifier>().note.text,
//                                       style: const TextStyle(fontSize: 15),
//                                     ),
//                                     const SizedBox(
//                                       height: 12,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Column(children: [
//                                 IconButton(
//                                     onPressed: () {
//                                       Navigator.pushNamed(
//                                           context, '/editionscreen');
//                                     },
//                                     icon: const Icon(
//                                       Icons.edit,
//                                       color: Colors.green,
//                                     )),
//                                 // Checkbox(value: user.isDone, onChanged:
//                                 // (){})
//                                 IconButton(
//                                   onPressed: () {
//                                     // // context.watch<UserNotifier>().isDone;
//                                     // Provider.of<UserNotifier>(context,listen: false);
//                                     // final isDone = provider.toggleUserStatus(note);
//                                   },
//                                   icon: const Icon(
//                                     Icons.favorite,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   width: 1,
//                                 ),
//                                 IconButton(
//                                   onPressed: () {
//                                     provider.deleteUser(index);
//                                   },
//                                   icon: const Icon(Icons.delete_forever),
//                                 ),
//                               ]),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             });
//   }
// }

// import 'dart:math';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:noter/note_provider.dart';

// class Favourites extends StatelessWidget {
//   const Favourites({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var provider = Provider.of<UserNotifier>(context);
//     // final noteList = provider.userListFavourites;
//     bool isDone = false;

 

















  

//     return noteList.isEmpty
//         ? const Center(
//             child: Text(
//               'No Favourite Notes',
//               style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 45,
//                   color: Colors.green),
//             ),
//           )
//         : ListView.separated(
//             separatorBuilder: ((context, index) => Container(
//                   color: Colors.green,
//                   height: 1,
//                 )),
//             physics: const BouncingScrollPhysics(
//               parent: AlwaysScrollableScrollPhysics(),
//             ),
//             // shrinkWrap: true,
//             itemCount: noteList.length,
//             itemBuilder: (BuildContext context, index) {
//               final note = noteList[index];

//               return Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Card(
//                   color: Colors
//                       .primaries[Random().nextInt(Colors.primaries.length)],
//                   child: Expanded(
//                       child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Expanded(
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Checkbox(
//                                         value: note.isDone,
//                                         onChanged: (_) {
//                                           provider = Provider.of<UserNotifier>(
//                                               context,
//                                               listen: false);
//                                           //  var isDone =
//                                           provider.toggleUserStatus(note);
//                                         }),
//                                     const SizedBox(
//                                       width: 1,
//                                     ),
//                                     IconButton(
//                                       onPressed: () {
//                                         provider.deleteUser(index);
//                                       },
//                                       icon: const Icon(Icons.delete_forever),
//                                     ),
//                                   ]),
//                               Text(
//                                 note.title,
//                                 softWrap: true,
//                                 style: const TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                               const SizedBox(
//                                 height: 2,
//                               ),
//                               Text(
//                                 note.description,
//                                 style: const TextStyle(fontSize: 15),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   )),
//                 ),
//               );
//             });
//   }
// }
