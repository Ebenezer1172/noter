import 'dart:math'; 
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:noter/note_provider.dart';
 
class Favourites extends StatelessWidget { 
  const  Favourites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UserNotifier>(context);
    // final noteList = provider.userListFavourites;
 bool isDone =false;
 
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection('Noter').where('isDone').snapshots(),
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
                                        IconButton(onPressed:  (){}, icon:const Icon(Icons.favorite_outline),),
                                       Checkbox(
                                        value:
                                        //  isDone
                                            note['isDone'] ??=false  
                                        ,
                                        onChanged: (_) {
                                          provider = Provider.of<UserNotifier>(
                                              context,
                                              listen: false);
                                           isDone =
                                          provider.toggleUserStatus( 
                                             note['isDone'] ??=false  ,
                                            );
                                        }),
                                        const SizedBox(
                                          width: 1,
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            provider.deleteUser(index);
                                          },
                                          icon:
                                              const Icon(Icons.delete_forever),
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
                      )),
                    ),
                  );
                });
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
