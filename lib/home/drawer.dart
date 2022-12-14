 import 'package:flutter/material.dart';
import 'package:food/Screen/MyProfile/my_profile.dart';
import 'package:food/Screen/ReviewCart/review_cart.dart';
import 'package:food/Screen/complain.dart';
import 'package:food/Screen/homescreen.dart';
import 'package:food/faq.dart';
// import 'package:food/Screen/rating_review.dart';
import 'package:food/providers/user_provider.dart';

import '../Screen/notification.dart';
import '../rating_review.dart';
  class MyDrawer extends StatefulWidget {
     UserProvider userProvider;
   MyDrawer({super.key , required this.userProvider});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
    Widget listTile({IconData? icon , String ?title,Function() ?onTap }){
     return ListTile(
      onTap: onTap,
       leading: Icon(icon,size: 32,),
       title: Text(title!, style: const TextStyle(color: Colors.black45),),

     );
   }

  Widget build(BuildContext context) {
     var userData=widget.userProvider.currentdata;
    return Drawer(
      child: Container(
             color:  const Color.fromARGB(255, 235, 208, 103),
             child: ListView(
               children: [
                 DrawerHeader(child: Row(children:  [
                  const CircleAvatar(backgroundColor: Colors.white54,
                   radius: 45,
                    child: CircleAvatar ( radius: 40,
                       backgroundImage:  NetworkImage('https://img.freepik.com/free-photo/set-fruits-seeds-leaves_23-2148145087.jpg?size=626&ext=jpg&ga=GA1.2.617182311.1669882858'),
                 child: Text("Vegi",style: TextStyle( fontWeight: FontWeight.bold, fontSize: 30, color: Color.fromARGB(255, 197, 234, 197),shadows: [
                BoxShadow(
                   color: Color.fromARGB(255, 20, 141, 24),
                       blurRadius:15,
                )
                 ])
                 ,), 
                      
                    ),
                    ),
                 
                     const SizedBox(width: 20,),
                      Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           const Text("Welcome Guest"),
                            const SizedBox(height: 7,),
                             SizedBox(height: 30,
                            
                            
                              child: OutlinedButton(child: const Text("Log In"),
                               
                              
                              
                               onPressed: (() {
                                
                              }
                               
                              ),
                              
                            ),
                            
                             )
                        ],
                      )
                 ],
                 )
                
                 ),
                 listTile(icon: Icons.home,    title: "Home", onTap: () {
                   Navigator.of(context).push(MaterialPageRoute(builder: ((context) => HomeScreen()))) ; 
                   
                 },),
                  listTile(icon: Icons.shop_2_outlined,title: "Review Cart",
                   onTap: () {
                          
                    Navigator.of(context).push(MaterialPageRoute(builder: ((context) => ReviewCart()))) ;     
                 },),
                   listTile(icon: Icons.person_outline,title: "My Profile",
                   onTap: () {
                          
                    Navigator.of(context).push(MaterialPageRoute(builder: ((context) => const MyProfile()))) ;     
                 },),
                    listTile(icon: Icons.notification_add_outlined,title: "Notification",
                    onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: ((context) => notification()))) ; 
                    },),
                     listTile(icon: Icons.star_outline,title: "Rating& Review",
                     onTap: () {
                       Navigator.of(context).push(MaterialPageRoute(builder: ((context) => Rating()))) ;
                       
                     },),
                      listTile(icon: Icons.favorite_outline,title: "WishList"),
                       listTile(icon: Icons.handshake_outlined, title: "Raise a complain",
                        onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: ((context) => RaiseComplain()))) ;
                          
                        },),
                        listTile(icon: Icons.question_answer_outlined,title: "FAQs",
                         onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: ((context) => FAQ()))) ;
                         },
                        ),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 20),
                   child: SizedBox(
                    height: 350,
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       const Text("Contact Support"),
                        const SizedBox(height: 10,),
                         SingleChildScrollView(
                           scrollDirection: Axis.horizontal,
                           child: Row(
                    
                            children: const [
                               Text("Call Us"),
                                SizedBox(width: 10,),
                                Text("9792799722")
                            ],
                           ),
                         ),
                          const SizedBox(height: 5,),
                            SingleChildScrollView(
                               scrollDirection: Axis.horizontal,
                              child: Row(
                              
                                                  children: const [
                               Text("Mail Us"),
                                SizedBox(width: 10,),
                                Text("abhs@gmail.com")
                                                  ],
                                                 ),
                            )
                     ],)
            ,
                   ),
                 )
               ],
             ),
           ),
    );
  }
}