// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:food/config/color.dart';
 class RaiseComplain extends StatefulWidget {
  const RaiseComplain({super.key});

  @override
  State<RaiseComplain> createState() => _RaiseComplainState();
}

class _RaiseComplainState extends State<RaiseComplain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: Text("Complaints!"
        ),
         backgroundColor: primaryColor, 
       ),
        body: SingleChildScrollView(
          child: Column( 
             mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 20),
                 child: Expanded(
                   child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                       mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                     Image.network('https://www.salesnayak.com/Design2021/assets/Salesnayak/AMC_Complaint.png',
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Raise  your Complain!',
                           fillColor: primaryColor,
                            // focusedBorder: InputBorder(borderSide: )
                         
                        ),
                         
                 
                         
                 
                      ),
                         SizedBox(
                          height: 20,
                         ),
                     
                       ElevatedButton(onPressed: (() {
                         
                       }), child: Text("Submit"), ),
                     
                      ],
                   ),
                 ),
               )
               
             ],
          ),
        ),
    );
  }
}