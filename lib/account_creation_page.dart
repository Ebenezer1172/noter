import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:noter/login_page.dart';

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
  // ignore: unused_field
  late String _userEmail;
  String? myName;
  String myname = "create your account";
  bool value = false;
  final _formKey = GlobalKey<FormState>();

  void _register() async {
    final User? user = (
      // showDialog(
      //   context: context, 
      //   barrierDismissible: false,
      // builder:(context)=> const Center(child:   CircularProgressIndicator(),),);
      // try{
      await _auth.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    ))
        .user;
    if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.email!;
      });
    } else {
      setState(() {
        _success = false;
      });
      // navigatorkey.currentState!.popUntil(route)=> route.isFirst;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('create your account'),
      ),
      // resizeToAvoidBottomInset: false,

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
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF000000),
                      )),
                ),
                const Divider(
                  color: Colors.black,
                  height: 2,
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 0, top: 19),
                          // child: Text('Full legal first and middle name(s)')
                        ),
                        const SizedBox(
                          height: 8,
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            //  TextFormField(
                            //  controller: _fulllegalname,
                            //  decoration: InputDecoration(
                            //    hintText: ('Full legal first and middle name(s)'),
                            //     border: OutlineInputBorder(
                            //      borderRadius: BorderRadius.circular(7)
                            //      ),
                            //      contentPadding: const EdgeInsets.only(left: 8,right: 0),
                            //  ),
                            //  validator: (value){
                            //      if (value.toString().isEmpty) {
                            //   return  'mumu input something';
                            //      }
                            //     return null;
                            //    },
                            //  ),
                            //    SizedBox(height: 8,),
                            //            Text('As it appears on your valid hID')
                          ],
                        ),
                        const SizedBox(
                          height: 0,
                        ),
                        //                TextFormField(
                        //              controller: _fulllegalsurname,
                        //              decoration: InputDecoration(
                        //                hintText: ('Full legal surname'),
                        //  border: OutlineInputBorder(
                        //   borderRadius: BorderRadius.circular(7)
                        //   ),

                        //   contentPadding: const EdgeInsets.only(left: 8,right: 0),

                        //              ),
                        //                validator: (value){
                        //                if (value.toString().isEmpty)  {
                        //                return 'mumu input something';
                        //                }
                        //                return null;
                        //                },
                        //                ),
                        const SizedBox(
                          height: 8,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(left: 0),
                            ),
                            // Text('As it appears on your valid ID',),
                          ],
                        ),
// Column(
//   children: const [
//     ListTile(
//       title: Text('Laftette'),
//       leading: Radio<SingingCharacter?>(value: value, groupValue: groupValue, onChanged: onChanged),
//     )
//   ],
// ),
                        const SizedBox(
                          height: 24,
                        ),
                        //  const Text("Phone Number",),
                        const SizedBox(height: 8),
                        const Padding(padding: EdgeInsets.only(right: 0)),
                        //              TextFormField(
                        //            controller: _phonenumber,
                        //            decoration: InputDecoration(
                        //              hintText: ('Example:8180000000'), border: OutlineInputBorder(
                        // borderRadius: BorderRadius.circular(5)
                        // ),
                        // contentPadding: const EdgeInsets.only(left: 8,right: 0),
                        //            ),
                        //              validator: (value){
                        //              if (value.toString().isEmpty) {
                        //            return 'dont be silly,type something';
                        //              }
                        //              return null;
                        //              },
                        //              ),

                       // const SizedBox(height: 24),
                        // const Text("E-mail address"   ),
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
                            if (value.toString().isEmpty) {
                              return 'Your head is not correct';
                            }
                            return null;
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
                            validator: (value) {
                              if (value.toString().isEmpty) {
                                return 'dumb MF fill the form';
                              }
                              return null;
                            }),
                        const SizedBox(
                          height: 20,
                        ),
                        //                SizedBox(height: 56,width: 1000,
                        //            child:
                        // ElevatedButton(onPressed: (() {
                        //                Navigator.pushNamed(context, '/loginpage');
                        //               if (_formKey.currentState! .validate()) {
                        //  ScaffoldMessenger.of(context).showSnackBar(
                        //    const SnackBar(content: Text('processing Data'),));
                        //               }
                        //              }
                        //              ), child: const Text('create account')
                        //              ),
                        //                ),
                        //       Padding(
//                                  ),
                        //      ),
                        // Text('$ninjaLevel'),
                        const SizedBox(
                          height: 8,
                        ),
                        Center(
                          child: SizedBox(
                            width: 1000,
                            height: 56,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          const Color(0xFFDCDCDC)),
                                ),
                                child: const Text(
                                  'Create your account',
                                  style: TextStyle(fontSize: 16),
                                ),
                                onPressed: () async {
                                  // secondScreen();
                                 
                                  if (_formKey.currentState!.validate()) {
                               _register();
                            }
                             const snackBar =  SnackBar(content:  Text('Account created'),);
                                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                   Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) =>const LogInPage(),
              
            ),
          );
                                }),
                          ),
                        ),
                        const SizedBox(
                          height: 38,
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
  }
}
