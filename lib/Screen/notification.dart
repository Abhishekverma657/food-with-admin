import 'package:flutter/material.dart';
import 'package:food/config/color.dart';
import 'package:overlay_support/overlay_support.dart';
 class notification extends StatelessWidget {
  const notification({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(title: Text("Notification",),backgroundColor: primaryColor,
        actions: [
         Padding(
           padding: const EdgeInsets.all(16.0),
           child: Icon(Icons.notification_add),
         )
        ],),
         body: Card(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        child: SafeArea(
          child: ListTile(
            leading: SizedBox.fromSize(
                size: const Size(40, 40),
                child: ClipOval(
                   
                    child: Container(
                      //  child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqNQ7sGooq1cHym4maTbq9xNscjNIslvOh2A&usqp=CAU'),
                     
                      //  decoration: BoxDecoration(
                      
                      //  ), 
                  color: Color.fromARGB(255, 199, 83, 83),
                ))),
            title: Text('New Notification',style: TextStyle(color: Colors.green),),
            subtitle: Text(' You have new Notification'),
            trailing: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  // OverlaySupportEntry.of(context)!.dismiss();
                }),
          ),
        ),
      ),
      );
  
  }
}