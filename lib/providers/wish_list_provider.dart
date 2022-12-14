import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class WishListProvider with ChangeNotifier{

   static void addwishListdata(String ?wishListID, String wishListImage, String wishListName,
      String wishListPrice, int wishListQuentity, ) async {
         FirebaseFirestore.instance.collection("WishList").doc(FirebaseAuth.instance.currentUser!.uid).collection("YourWishList").doc(wishListID).set({
            
       "wishListId":wishListID,
        " wishListName":wishListName,
        " wishListImage":wishListImage,
        "wishListPrice":wishListPrice,
        "wishListQuentity":wishListQuentity,
        "wishList":true,

      

         });
      }
}