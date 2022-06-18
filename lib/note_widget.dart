import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:noter/editionningpage.dart';

class ListBuilder extends StatefulWidget {
  const ListBuilder({Key? key}) : super(key: key);

  @override
  State<ListBuilder> createState() => _ListBuilderState();
}

class _ListBuilderState extends State<ListBuilder> {
   Color _iconColor = Colors.white;
  bool edit = false;
  bool isDone =false;
  bool isFavourite =false;
  DateTime createdTime=DateTime.now();
 
  @override
  Widget build(BuildContext context) {
    // var provider = Provider.of<UserNotifier>(context);
    // final noteList = provider.userList;

    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
        .collection('Noter')
        .where('email',
        isEqualTo: FirebaseAuth.instance.currentUser!.email)
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
            return ListView.builder(
              //  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              //   maxCrossAxisExtent: 200,
              //   crossAxisSpacing: 20,
              //   mainAxisSpacing: 20),
                // separatorBuilder: ((context, index) => Container(
                //       color: Colors.green,
                //       height: 1,
                //     )),
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
                             
                                onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditingPage(
                                    note: note,
                                  ))),
                              
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
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
                                            IconButton(
                                            color: _iconColor,
                                              onPressed:  (){
                                                setState(() { 
                                                   _iconColor = Colors.red;
                                                });
                                              FirebaseFirestore.instance
                                              .collection('Noter')
                                              .doc(note['id'])
                                              .update( {'isFavourite':  true,}  ); 
                                            const snackBar =  SnackBar(content:  Text('Added to Favourites'),);
                                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                            }, 
                                            icon:const Icon(Icons.favorite),
                                            ),
                                            const SizedBox(
                                              width: 1,
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                // provider.deleteUser(User('title', 'description', 'id', createdTime, isDone, isFavourite));
                                                FirebaseFirestore.instance
                                        .collection('Noter')
                                        .doc(note['id'])
                                         .delete();
                                          const snackBar =  SnackBar(content:  Text('Note Deleted'),);
                                           ScaffoldMessenger.of(context).showSnackBar(snackBar); 
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
                                        style: const TextStyle(fontSize: 15,
                                         
                                         ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )),
                        ),
                      ),
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