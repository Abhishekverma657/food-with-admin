import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food/Screen/homescreen.dart';
import 'package:food/auth/signin.dart';
 import 'package:firebase_core/firebase_core.dart';
import 'package:food/providers/product_provider.dart';
import 'package:food/providers/review_cart_provider.dart';
import 'package:food/providers/user_provider.dart';
import 'package:food/providers/wish_list_provider.dart';
import 'package:provider/provider.dart';

   void main()  async{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
     runApp(MyApp());
 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(providers: [ChangeNotifierProvider<ProductProvider>(
       create: (context) => ProductProvider(),),
       ChangeNotifierProvider<UserProvider>(
       create: (context) =>UserProvider(),),
        ChangeNotifierProvider<ReviewCartProvider>(
       create: (context) =>ReviewCartProvider(),),
         ChangeNotifierProvider<WishListProvider>(
       create: (context) =>WishListProvider(),),

       ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          
          primarySwatch: Colors.blue,
        ),
        home:  SignIn(),
      ),
    );
  }
}