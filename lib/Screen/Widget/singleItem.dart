import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:food/config/color.dart';
 class SingleItem extends StatelessWidget {
   String productImage;
   String productName;
    int productPrice;
     String ?productId;
      int ?productQuentity;
       Function ?ondelete;

   
   bool ?isBool =false;
    SingleItem({super.key,this.isBool, required this.productImage,required this.productName,required this.productPrice,this.productId,this.productQuentity,this.ondelete});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
             
            children: [
              Expanded(child: Container(height: 100,
               child: Center(child: Image.network(productImage)),
              )),
               Expanded(child: Container(height: 100,
                child: Column(
                   mainAxisAlignment:  isBool==false ?MainAxisAlignment.spaceAround:MainAxisAlignment.spaceEvenly,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                    Column(children: [
                      Text( productName,style: TextStyle(fontWeight: FontWeight.bold),),
                        Text(("$productPrice"),style: TextStyle(
                         color: Colors.grey),)
                    ],
                    ),
                     isBool==false? InkWell(
                       onTap: () {
                                            
                                         showModalBottomSheet(
    context: context,
    builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            // leading: new Icon(Icons.line_weight),
            title: new Text('50 Gram'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            // leading: new Icon(Icons.music_note),
            title: new Text('100 Gram'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            // leading: new Icon(Icons.videocam),
            title: new Text('500 Gram'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            // leading: new Icon(Icons.share),
            title: new Text('1 Kg'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      );
    }
                                         );
                         
                       },
                       child: Container(
                        margin: EdgeInsets.only(right: 15),
                         padding: EdgeInsets.symmetric(horizontal: 10),
                          height: 35,
                           
                          decoration: BoxDecoration(
                             border: Border.all(color: Colors.grey,
                              ),
                               borderRadius: BorderRadius.circular(30)
                     
                          ),
                           child: Row(children: [
                            Expanded(child:    
                          Text("50 Gram ",style: TextStyle(
                           color: Colors.grey),) 
                           ),
                            Center(
                              child: Icon(Icons.arrow_drop_down,size: 20),
                            )
                           ],
                           ),
                     
                                         ),
                     ):Text("50 Gram")
                   ],
                ),)),
                Expanded(child: Container(
                   padding:   isBool==false?EdgeInsets.symmetric(horizontal: 15,vertical: 15):EdgeInsets.only(left: 15,right: 15),
                    height: 50,
                     child:  isBool==false? Container(
                       height: 10,width: 25,
                        decoration: BoxDecoration(
                           border: Border.all(color: Colors.grey,
                            ),
                             borderRadius: BorderRadius.circular(30)

                        ),
                         child: Center(
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            Icon(Icons.add , color: primaryColor, size: 20,),
                              Text("Add ",style: TextStyle(
                         color: primaryColor),) 
                         
                           ],),
                         ),
                        
                     )
                      
                      :
                     Column(
                      
                       
                       children: [
                      InkWell(
                         onTap: () {
                           ondelete!();
                           
                         },
                        child: Icon(Icons.delete,size: 25,color: Color.fromARGB(255, 109, 106, 106),)),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                       height: 20,
                        decoration: BoxDecoration(
                           border: Border.all(color: Colors.grey,
                            ),
                             borderRadius: BorderRadius.circular(30)

                        ),
                         child: Center(
                            
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             
                            children: [
                              
                            Icon(Icons.add , color: primaryColor, size: 20,),
                              Text("Add ",style: TextStyle(
                         color: primaryColor),) 
                         
                           ],),
                         ),
                        
                     )
                    
                    
                     ],
                     ),
                    
                )
                ),
            ],
          ),
        
        ),
           isBool==false?Container():Divider(
                    height: 1,
                     color: Colors.black45,
                  )
      ],
    );
  }
}