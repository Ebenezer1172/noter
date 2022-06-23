// import 'package:google_fonts/google_fonts.dart';

// import 'package:noter/google_authen.dart';
// import 'package:provider/provider.dart';

// ignore_for_file: non_constant_identifier_names

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:noter/account_creation_page.dart';
// import 'package:noter/home_page.dart';
// import 'package:noter/home_page.dart';

//  Future signIn(
//     BuildContext context)  async {
//     showDialog(
//         context: (context),
//         barrierDismissible: false,
//         builder: (context) => const Center(
//               child: CircularProgressIndicator(color: Colors.blue,),
//              ));
// //      try  {
//       // ignore: prefer_typing_uninitialized_variables
//    var passwordController;
//       // ignore: prefer_typing_uninitialized_variables
//       var emailController;
//       await FirebaseAuth.instance.signInWithEmailAndPassword(
//           email: emailController.text.trim(),
//           password: passwordController.text.trim());
//  //  } on FirebaseAuthException
// //     catch (e) {
//             // ignore: avoid_print
// //            print(e);
//       // return  (e);
//      }
//      // ignore: prefer_typing_uninitialized_variables
//      //var navigatorKey;
//      // ignore: prefer_typing_uninitialized_variables
//      //var route;
//   //   Navigator.of(context).pop(const CircularProgressIndicator());

//  //    }

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);





  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // get route => null;
  @override
  Widget build(BuildContext context) {
    @override
    // ignore: unused_element
    void dispose(){
        _passwordController.dispose();
        _emailController.dispose();
        super.dispose();
    }

    // TextEditingController emailController;

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                        TextFormField(
                            textInputAction: TextInputAction.next,
                            controller: _emailController,
                            decoration: InputDecoration(
                              hintText: ('E-mail'),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7)),
                              contentPadding:
                                  const EdgeInsets.only(left: 8, right: 0),
                            ),
                            onSaved: (value) {},
                            validator: (value) {
                              if (value.toString().isEmpty) {
                                return "Field cannot be empty";
                              } else {
                                return null;
                              }
                            }
                            // validator:
                            //     // (value){
                            //     // if (value == null || value.isEmpty) {
                            //     //       return "Enter your Email address";
                            //     //     } else if (value) {
                            //     //       return "Enter a valid Email";
                            //     //     } else {
                            //     //       return null;
                            //     //     }
                            //     // }

                            //     (value) {
                            //   if (value == null) {
                            //     return 'E-mail cannot be empty';
                            //   }
                            //   return null;
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
                          controller: _passwordController,
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
                  Center(
                    child: Column(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 60,
                              width: double.infinity,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: ElevatedButton(
                                  child: const Text('Log in'),
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      signIn();
                                    }
                                    {
                                      // InvalidCredentials();
                                    }
                                    // context.read<AuthenticationService>().signIn(
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Dont have an Account?'),
                            TextButton(
                                child: const Text('Create an Account '),
                                onPressed: 
                                  () {
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) => const MyHomePage(),
                                      ),
                                    );
                                    // Navigator.pushNamed(context, '/myhomepage');
                                  },
                                )
                          ],
                        )
                      ],
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

//   Future<void> login(BuildContext context) async {
//     showDialog(context: context,
//         builder: (context) =>const  Center(child: SizedBox(height:30, width: 30,
//             child: CircularProgressIndicator())), barrierDismissible: false);
//     // a fake login call using Future.delayed
//     bool loginOK = await Future.delayed ( const Duration(seconds: 3), () => true)
//         .timeout(const Duration(seconds: 5), onTimeout: () => false);
//     // dispose the dialog modal barrier (pop it from route stack)
//     Navigator.of(context).pop(loginOK);
//     // do something with login result
//     // ignore: avoid_print
//     print('Login OK? $loginOK');
//   }

  Future signIn() async {
    showDialog(
        context: context,
        builder: (context) => const Center(
            child: SizedBox(
                height: 30, width: 30, child: CircularProgressIndicator())),
        barrierDismissible: true);
   // try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
      Navigator.pop(context);
    // } on FirebaseAuthException catch (e) {
    //   // ignore: avoid_print
    //   print(e);
    // }

// navigatorKey.currentState!.popUntil((route)=>route.isFirst);
// void InvalidCredentials(){
//    const snackBar =  SnackBar(content:  Text('Invalid credentials'),);
//                                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
// }
// void loggedIn(){
//    const snackBar = SnackBar(
//                                     content: Text('Logged In'),
//                                   );
//                                   ScaffoldMessenger.of(context)
//                                       .showSnackBar(snackBar);
  }
}
