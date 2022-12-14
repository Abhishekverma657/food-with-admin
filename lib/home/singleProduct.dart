 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food/Screen/ReviewCart/review_cart.dart';
import 'package:food/Screen/Widget/count.dart';
import 'package:food/Screen/product_overview/product_overview.dart';
import 'package:food/providers/review_cart_provider.dart';
import 'package:provider/provider.dart';
  class SingleProduct extends StatefulWidget {
      String  productImage= '';
          String productName='';
       int ? productPrice;
        String ? productId;
         int ?productQuentity;
    SingleProduct({super.key,required this.productImage,required this.productName, this.productPrice,this.productId,this.productQuentity});

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  int count =0;
    getaddAndQuantity(){
      //  FirebaseFirestore.instance.collection("reviewCarrt").doc(FirebaseAuth.instance.currentUser!.uid).get().then((value)=> {

      //  }
      //  );

    }
  @override
  Widget build(BuildContext context) {
    // print('jj');
    //  print(widget.productId);
    getaddAndQuantity();
     ReviewCartProvider reviewCartProvider=Provider.of<ReviewCartProvider>(context);
    return   Container(
       margin: const EdgeInsets.symmetric(horizontal: 7),
                    height: 230,
                    width: 160,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         
                         
                         
                            
                          InkWell(onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: ((context) => ProductOverview(productimage: widget.productImage, productname: widget.productName,productPrice: widget.productPrice.toString(),))));
                          },
                            child: Expanded(
                                flex: 2,
                                child:   Image.network(widget.productImage.toString()) ),
                          ),
                        
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                            child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                              //  mainAxisAlignment: MainAxisAlignment.center,
                              children:   [
                                 Text(
                                  widget.productName,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                  Text( "${widget.productPrice}"
                                             "\$/50 Gram",
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                                 Row(
                                  
                                 children: [
                                   Expanded(child: 
                                   Padding(
                                     padding: const EdgeInsets.only(left:1),
                                     child: InkWell(
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
                                         height: 24,
                                          width:  50,
                                          //  color: Colors.red,
                                            decoration: BoxDecoration(
                                                
                                                borderRadius: BorderRadius.circular(8),
                                                   border: Border.all(
                                                    color: Colors.grey
                                                   ),
                                                  
                                            ),
                                             child: Row(children: [
                                               Expanded(child: Text("50 Gram" ,style: const TextStyle(fontSize: 8),)),
                                                const Expanded(
                                                  child: Icon(Icons.arrow_drop_down,
                                                   ),
                                        ) ]),
                                     
                                       ),
                                     ),
                                   ),),
                                    const SizedBox(width: 5,),
                                       
                                         
                                    //  Expanded(child: Count()),
                                    Expanded(child: 
                                     
                                   Container(
                                     height: 24,
                                      width:  50,
                                      //  color: Colors.black,
                                         decoration: BoxDecoration(
                                            
                                            borderRadius: BorderRadius.circular(8),
                                             border: Border.all(
                                               color: Colors.grey
                                             ),
                                        ),
                                         child: Row(
                                          //  crossAxisAlignment: CrossAxisAlignment.start,
                                           mainAxisAlignment: MainAxisAlignment.center,
                                           children: [
                                           InkWell(onTap: (){
                                            count--;
                                             
                                             if(count>=0){
                                            setState(() {
                                              
                                            });}
                                           },
                                            child: Icon(Icons.remove , color: Colors.yellow[500],)),
                                            Text(count.toString(),style: TextStyle(fontWeight: FontWeight.bold),),
                                             InkWell(onTap: (){
                                              count++;
                                                  
                                                
                                              setState(() {
                                                
                                              });
                                             ReviewCartProvider. addReviewCartdata (
                                          widget.productId,widget.productImage,widget.productName,widget.productPrice!,count,true
                                             );
                                             },
                                              child: Icon(Icons.add,size: 20,color: Colors.yellow[500],))
                                         ]),
                                   ),
                                   ),
                                 ],
                                 )
                                 
                                
                                 ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
  }
}