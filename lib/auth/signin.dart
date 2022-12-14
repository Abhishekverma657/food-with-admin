import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
 import 'package:firebase_core/firebase_core.dart';
import 'package:food/providers/user_provider.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import '../Screen/homescreen.dart';
import '../providers/user_provider.dart';
  
 class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late UserProvider userProvider ;

  Future<User?> _googleSignUp() async {
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: ['email'],
      );
      final FirebaseAuth _auth = FirebaseAuth.instance;

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final User? user = (await _auth.signInWithCredential(credential)).user;
      // print("signed in " + user.displayName);
        userProvider.addUserdata(user!, user.displayName!, user.photoURL!, user.email!);

      return user;
    } catch (e) {
    }
  }

  @override
  Widget build(BuildContext context) {
   userProvider=Provider.of<UserProvider>(context);
    return Scaffold(
       body: Container(
         decoration: BoxDecoration(
           
           image: DecorationImage(
             fit: BoxFit.cover,
            image: AssetImage('assets/bgLogin.jpg'))
         ),
          child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        

            children: [
              Container(
                height: 500,
                width: double.infinity,
                 decoration: const  BoxDecoration(
                    color: Colors.transparent
                 ),
                  child: Column(
                  children:  [
                       Text("Sign In to Continue", style: TextStyle( fontSize: 30),),
                       SizedBox(height: 20,),
                        Text("Vegi",style: TextStyle( fontSize: 70,color: Colors.white,shadows: [
                        BoxShadow(
                          blurRadius: 10,
                          color: Color.fromARGB(255, 8, 136, 12),
                          offset: Offset(3,3)
                        )
                      ]),),
                    
 
                       Padding(
                         padding: const EdgeInsets.all(60),
                         child: Column(
                           children: [
                             SignInButton(
                                  Buttons.Google,
                                text: "Sign  in with Google",
                                    onPressed: () {
                                       print("sdf");
                                      _googleSignUp().then((value) => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomeScreen())));
                                    },
                             ),
                              SizedBox(
                                 height: 40,
                              ),

                               SignInButton(
                              Buttons.Apple,
                            text: "Sign in with Apple",
                                onPressed: () {
                                  //  print('dfg');
                                },
                         )

                           ],
                         ),
                       ),
                        
                  ],
                  ),
              )
            ],
          ),
       ),
      
    );
  }
}