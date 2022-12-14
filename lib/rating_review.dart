import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food/config/color.dart';
 class Rating extends StatefulWidget {
  const Rating({super.key});

  @override
  State<Rating> createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar:  AppBar(
       title: Text("Review & Rating ")
        ,
         backgroundColor: primaryColor,
    ),
     body:  Column(
       mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
       children: [ 
       Padding(
         padding: const EdgeInsets .symmetric(horizontal: 32),
         child: Container(
           height: 290,
            width: double.infinity,
             decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: primaryColor,
               
           
         ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                 
                children: [
                  Text("Review & Rating", style: TextStyle(
                     
                     color: Color.fromARGB(255, 32, 32, 32), fontWeight: FontWeight.bold, fontSize: 35
                  ),),
                   SizedBox( height: 60,),

                RatingBar.builder(
                initialRating: 2,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                Icons.star,
                  color: Color.fromARGB(255, 2, 90, 23),
            
                ),

                          


                onRatingUpdate: (rating) {
                   

               }, 
),
             
                     
                ],
                 
              ),
            ),
          ),)
       )
     ]),
    );
  }
}