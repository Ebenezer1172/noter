// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:noter/login_page.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
// final  TextEditingController _fulllegalname = TextEditingController();
//  final TextEditingController _fulllegalsurname = TextEditingController();
//  final TextEditingController _phonenumber = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // ignore: unused_field
  late bool _success;
  bool isLogin = true;
  // ignore: unused_field
  late String _userEmail;
  String? myName;
  String myname = "create your account";
  // bool value = false;
  final _formKey = GlobalKey<FormState>();
  bool isCheck=true;

    
  bool isEmpty = true;
   
// Future _register() async{
//   showDialog(
//     context: context, 
//   barrierDismissible: false,
//   builder: (context) => const  Center(child:
//     CircularProgressIndicator()));
// try{
//   await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailController.text.trim(), password: _passwordController.text.trim());
// }
// on FirebaseAuthException catch (e) {
//   print(e);
// }
// _formKey.currentState!.popUntil((route)=>route
// }
// }

  clear() {
    _emailController.clear();
    _passwordController.clear();
  }
  Future _register() async {
    final User? user = (
            // showDialog(
            //   context: context,
            //   barrierDismissible: false,
            // builder:(context)=> const Center(child:   CircularProgressIndicator(),),);
            // try{
            await _auth.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    )).user;
    if (user!= null) {
      setState(() {
        _success = true;
        _userEmail = user.email!;
      });
    } else {
      setState(() {
        _success = false;
      });
    }
  }

   @override
    void dispose(){
        _passwordController.dispose();
        _emailController.dispose();
        super.dispose();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(10)),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 32, bottom: 24, left: 33),
                  child: Text('Create your account',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF000000),
                      )),
                ),
                
                 
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 0, top: 19),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                          ],
                        ),
                        const SizedBox(
                          height: 0,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(left: 0),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        const SizedBox(height: 8),
                        const Padding(padding: EdgeInsets.only(right: 0)),
                        const Text("E-mail address"),
                        const SizedBox(
                          height: 0,
                        ),
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: ('E-mail address'),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7)),
                            contentPadding:
                                const EdgeInsets.only(left: 8, right: 0),
                          ),
                          validator: (value) {
                            if (value.toString().isEmpty
                                // .toString().isEmpty
                                ) {
                              return 'email cannot be empty' ;
                            }
                            return  null ;
                          },
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        const Text('Password'),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: ('Password'),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7)),
                              contentPadding:
                                  const EdgeInsets.only(left: 8, right: 0),
                            ),
                            
                            // validator: (value) {
                            //   if (value == null
                            //       // .toString().isEmpty
                            //       ) {
                            //     return "Password cannot be empty";
                            //   }
                            //   return null;
                            // }
                            ),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      //   Checkbox(
                      //   value: isCheck,
                      //   checkColor: Colors.black,
                      //   activeColor: Colors.green,
                      //   onChanged: (bool  value) {
                      //     setState(() {
                      //       isCheck = value;
                      //     });
                      //   },
                      // ),
                        Center(
                          child: SizedBox(
                            width: 1000,
                            height: 56,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<
                                          Color>(
                                      const Color.fromARGB(255, 14, 208, 17)),
                                ),
                                child: const Text(
                                  'Create your account',
                                  style: TextStyle(fontSize: 16),
                                ),
                                onPressed: ()
                                      async
                                    { if (_formKey.currentState!.validate()) {
                                       
                              _register();   const snackBar = SnackBar(
                                    content: Text('Account created'),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                      Navigator.pushNamed(context, '/logInPage');
                                  // Navigator.of(context).pushReplacement(
                                  //  MaterialPageRoute(
                                  //    builder: (context) => const LogInPage()));    
                            }
   else {
    return accountNotCreated();
    }
   
                                  // if (_formKey.currentState!.validate()) {
                                  //
                                  //   ),
                                  // );
                                }
                                ),
                          ),
                        ),
                        const SizedBox(
                          height: 38,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Already have an Account?'),
                            TextButton(
                                onPressed: () {
                                  // Navigator.of(context).pushReplacement(
                                  //   MaterialPageRoute(
                                  //     builder: (context) => const LogInPage(),
                                  //   ),
                                  // );
                                   Navigator.pushNamed(context, '/logInPage');
                                },
                                child: const Text('SignIn'))
                          ],
                        )
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
  }
  void accountNotCreated(){
     const snackBar = SnackBar(
                                    content: Text('Account not created'),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
  }
}
