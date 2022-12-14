 import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food/config/color.dart';
import 'package:food/models/review_cart_model.dart';
import 'package:food/providers/review_cart_provider.dart';
import 'package:provider/provider.dart';

import '../Widget/singleItem.dart';
  class ReviewCart extends StatelessWidget {
  // const ReviewCart({super.key});
  late ReviewCartProvider reviewCartProvider;
  
showAlertDialog(BuildContext context, ReviewCartModel delete ) {

  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text("No"),
    onPressed:  () {
       Navigator.of(context).pop();
    },
  );
  Widget continueButton = TextButton(
    child: Text("Yes"),
    onPressed:  () {
      //  print("del");
       reviewCartProvider.reviewCartDatadelete(delete.cartId);
       Navigator.of(context).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("cart product "),
    content: Text("Are you  want to delete cart Product?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

  @override
  Widget build(BuildContext context) {
     reviewCartProvider=Provider.of(context);
     reviewCartProvider.getReviewCartData();
    return Scaffold(
       bottomNavigationBar: ListTile(
        title: Text("Total Amount"),
         subtitle: Text("\$170.00",style: TextStyle(color: Colors.green[900]),),
         trailing:  Container(
          width: 160,
           child: MaterialButton(onPressed: () {
             
           },
            child: Text("Submit"),
            color: primaryColor,
             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
           ),
         ),
       ),
      appBar: AppBar(title: Text("Review Cart" ,style:  TextStyle(
        //  backgroundColor: primaryColor,
         color: textcolor,
      ),

      ),
      
      backgroundColor: primaryColor,),
       body:  reviewCartProvider.getReviewCartDataList.isEmpty ?Center( child:Text("NO DATA")):
       ListView.builder(
        itemCount: reviewCartProvider.getReviewCartDataList.length,
         
         itemBuilder: (context, index) {
           ReviewCartModel data = reviewCartProvider.getReviewCartDataList[index];
           return Column(
            children: [
               SizedBox(
                      height: 10,
                    ),

                     SingleItem (productImage: data.cartImage ,productName: data.cartName,productPrice: data.cartPrice,productId: data.cartId,productQuentity: data.cartQuentity, ondelete:(){showAlertDialog(context,data);},
                      
                      ),
            ],
           );
         },
                  // children: [
                  //   SizedBox(
                  //     height: 10,
                  //   ),

                  //    SingleItem (productImage: '' ,productName: '',productPrice: 0,),
              //  SingleItem (
              //   // isBool: false,
              //  ),
              //  SingleItem (),
              //  SingleItem (),
                    //  SizedBox(height: 10,),
                  // ],
       ),
    );
  }
}