import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:food/models/user_model.dart';

class UserProvider with ChangeNotifier {
  void addUserdata(User currentuser, String userName, String userImage,
      String useremail) async {
    await FirebaseFirestore.instance
        .collection("UsersData")
        .doc(currentuser.uid)
        .set({
      "userName": userName,
      "useremail": useremail,
      "userImage": userImage,
      "userID": currentuser.uid
    });
  }
UserModel ?currentdata;
  void getUserdata() async {
     UserModel userModel;
    var value = await FirebaseFirestore.instance
        .collection("UsersData")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
         if(value.exists){
           userModel=UserModel(
            userEmail: value.get("userEmail"),
             userImage: value.get("userImage"),
             userName: value.get("userName"),
             userUid: value.get("userUid")
           
           );
            currentdata=userModel;
            notifyListeners();

         }
  }
  
    UserModel get currentuserData{
       return currentdata!;

     
   }
}
