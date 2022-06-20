// import 'package:google_fonts/google_fonts.dart';

// import 'package:noter/google_authen.dart';
// import 'package:provider/provider.dart'; 

// ignore_for_file: non_constant_identifier_names

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:noter/account_creation_page.dart';
// import 'package:noter/home_page.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
final _formKey = GlobalKey<FormState>();

   
  // get route => null;
  @override
  Widget build(BuildContext context) {
    // @override
    // void dispose(){
    //     passwordController.dispose();
    //     emailController.dispose();
    //     super.dispose();
    // }

    // TextEditingController emailController;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        // title: const Text('Log-in'),
        actions:  [ 
          Row(
            children: [const Text('signUp'),
              IconButton(onPressed:  () {
                  Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) =>const MyHomePage(),
                  
                ),
              );
                  // Navigator.pushNamed(context, '/myhomepage');
                },   icon:const Icon(Icons.logout),),
            ],
          ), 
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 19, bottom: 0, left: 20),
                    child: Text('Sign-in',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF000000),
                        )),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text('E-mail'),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextField(
                          textInputAction: TextInputAction.next,
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: ('Username'),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7)),
                            contentPadding:
                                const EdgeInsets.only(left: 8, right: 0),
                          ),
                          // validator: (value) {
                          //   if (value == null) {
                          //     return null;
                          //   }
                          //   return 'Field cannot be empty';
                          // },
                        ),
                        const SizedBox(
                          height: 28,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text('Password'),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          textInputAction: TextInputAction.done,
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: ('Password'),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7)),
                            contentPadding:
                                const EdgeInsets.only(left: 8, right: 0),
                          ),
                          
                          validator: ((value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter password to create an account";
                                } else if (value.length < 6) {
                                  return "Password must be more than 8 characters";
                                } else {
                                  return null;
                                }
                              }),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Center(
                      child: SizedBox(
                        height: 56,
                        width: 700,
                        child: ElevatedButton(
                          child: const Text('Log in'),
                          onPressed:  
                         
                            () { if (_formKey.currentState!.validate()) {
                                signIn();}
                          // context.read<AuthenticationService>().signIn(
                          //   email: emailController.text,
                          //   password: passwordController.text
                          // );
                          // Navigator.pushNamed(context, '/cardpage');
          
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future signIn() async {
    showDialog(
      context: (context),
      barrierDismissible:true,
      builder: (context)=> const Center(
        child: CircularProgressIndicator(),)
    );
  //  // try {
  //   await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: emailController.text.trim(),
  //       password: passwordController.text.trim());
  // // } on FirebaseAuthException 
  //  //catch (e) {
  //         // ignore: avoid_print
  //    //     print(e);
  //   // return  (e);
  //  }
  //  // ignore: prefer_typing_uninitialized_variables
  //  //var navigatorKey;
   
  //  // ignore: prefer_typing_uninitialized_variables
  //  //var route;
  // // navigatorKey.currentState!.popUntil((( )=>route.isFirst()));
  // }
}}