// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:noter/note_widget.dart';
import 'package:noter/favourite_notes.dart';
// import 'package:note/user.dart';
// import 'package:note/user_notifier.dart';
// import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  String title = '';
  String note = '';
  @override
  Widget build(BuildContext context) {
    final tabs = [

      const ListBuilder(),
      const Favourites(),
    ];
    return Scaffold(
      backgroundColor: Colors.lightGreen[200],
      floatingActionButton: FloatingActionButton(
          hoverElevation: 150,
          elevation: 100,
          child: const Icon(Icons.add),
          foregroundColor: Colors.green,
          backgroundColor: Colors.white,
          onPressed: () {
            Navigator.pushNamed(context, '/viewscreen');
          }),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white.withOpacity(0.7),
        selectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() {
          _selectedIndex = index;
        }),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.note_add),
            label: 'Notes',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              label: 'Favourites'),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text('Notes'),
      ),
      body: 
      
      // StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      //     stream: FirebaseFirestore.instance.collection('Note').snapshots(),
      //     builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
      //       if (snapshot.connectionState == ConnectionState.waiting) {
      //         return const Center(
      //           child: CircularProgressIndicator(),
      //         );
      //       }
      //       if (snapshot.hasData){
      //                     return 
                          tabs[_selectedIndex],
          //   }
          //   return const Text('data');
          // }),
    );
  }
}
