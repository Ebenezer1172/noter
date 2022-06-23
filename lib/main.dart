import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:noter/account_creation_page.dart';
import 'package:noter/firebase_options.dart';
import 'package:noter/google_authen.dart';
import 'package:noter/login_page.dart';
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
        Provider<AuthenticationService>(create:(_) => AuthenticationService(FirebaseAuth.instance),
        ),
         StreamProvider<User?>(create: (context)=> context.read<AuthenticationService>().authStateChanges , 
         initialData:  null
         ),
        ChangeNotifierProvider(
          create: (context) => UserNotifier(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final navigatorKey =GlobalKey<NavigatorState>();
    return MaterialApp(
      theme: ThemeData(
         primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white
      ),
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      initialRoute: '/',
      routes: {
        // '/listscreen': (BuildContext context) => const NoteList(),
        // '/firstpage':  (BuildContext context) => const WelcomeScreen(),
        '/home': (BuildContext context) => const Home(),
        '/viewscreen': (BuildContext context) => const ViewScreen(),
        '/myhomepage': (BuildContext context) => const  MyHomePage(),
        '/logInPage': (BuildContext context) => const LogInPage(),
      },
      
       home:const Qwerty()
//        StreamBuilder<User?>(
//           stream: FirebaseAuth.instance.authStateChanges(),
//           builder: (context, snapshot) {
//             if(snapshot.connectionState == ConnectionState.waiting){
//              return const Center(child:CircularProgressIndicator());
//             }
//             // else if (snapshot.hasData){
//             //   return const Home();
//             // }else{
//             //   return const LogInPage();
//             // }
//             if(snapshot.hasData) {
// return const Home();
//             }
//             else{
//               return const LogInPage();
//             }
//             // if (snapshot.connectionState == ConnectionState.waiting) {
//             //   return const Center(
//             //     child: CircularProgressIndicator(),
//             //   );
//             // } else if (
//             //   snapshot.hasError
//             //   ) {

//             //   return const Center(
//             //     child: Text(
//             //         "Network error"),
//             //   );
//             // } else if (snapshot.hasData) {
//             //   return const Home();
//             // }
//             //  else {
//             //   return const LogInPage();
//             // }
//           },
//         ),
      ); 
  }
}         

class Qwerty extends StatelessWidget {
  const Qwerty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const Home();
          } else {
            return const LogInPage();
          }
        },
      ),
    );
  }
}