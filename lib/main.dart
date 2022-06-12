import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart'; 
import 'package:noter/firebase_options.dart';
import 'package:noter/view_screen.dart'; 
import 'package:provider/provider.dart';
import 'package:noter/home_page.dart';
import 'package:noter/note_provider.dart';
 

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp( 
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserNotifier(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
         primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        // '/listscreen': (BuildContext context) => const NoteList(),
        // '/firstpage':  (BuildContext context) => const WelcomeScreen(),
        '/home': (BuildContext context) => const Home(),
        '/viewscreen': (BuildContext context) => const ViewScreen(),
        //  '/editionscreen': (BuildContext context) => const  EditionScreen(),
      },
      home: const Home(),
    );
  }
}                                                                                                                                                                                                                                                                  