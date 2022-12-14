import 'package:flutter/material.dart';
import 'package:food/config/color.dart';
import 'package:food/home/drawer.dart';
 class MyProfile extends StatelessWidget {
  const MyProfile({super.key});
   Widget listTile({IconData ?icon ,String? title}){
    return Column(
       children: [
        Divider(
          height: 1,
        ),
          ListTile(
             leading: Icon(icon),
              title: Text(title!),
               trailing: Icon(Icons.arrow_forward_ios),
          )
       ],
    );
   }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       backgroundColor: primaryColor,
       appBar: AppBar(title: Text("Profile" ,style: TextStyle(color: textcolor),),
        backgroundColor: primaryColor,
        ),
      // drawer: MyDrawer(),
       body: Stack(children: [
         Column(
          children: [
            Container(
              height: 100,
               color: primaryColor,
            ),
             Container(
              height: 555,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
               decoration: BoxDecoration(
                 color:ScaffoldBackgroundColor,
                  borderRadius: BorderRadius.only(topLeft:Radius.circular(50),topRight: Radius.circular(50))
               ),
                child: ListView(children: [
                  Row(
                     mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 250,height: 80,
                         padding: EdgeInsets.only(left: 20),
                         child: Expanded(
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                   Text("Abhishek  verma " ,style: TextStyle(color: textcolor,fontWeight: FontWeight.bold, fontSize: 15),
                                   ),
                                    SizedBox(height: 10,),
                                     Text("vermabhishek657@gmail.com")
                         
                                ],
                              ),
                               CircleAvatar(
                                radius: 15,
                                backgroundColor: primaryColor,
                                 child: CircleAvatar(
                                  radius: 12,
                                  backgroundColor: ScaffoldBackgroundColor,
                                   child: Icon(Icons.edit , color: primaryColor,),
                                 ),
                               )
                            ],
                           ),
                         ),
                      )
                    ],
                  ),
                  listTile(icon: Icons.shop_2_outlined ,title: "My Orders"),
                   listTile(icon: Icons.location_on_outlined,title: "  Delevery Adress"),
                    listTile(icon: Icons. person_outline ,title: "Refer A Friend"),
                     listTile(icon: Icons.copy_outlined,title: "Terms & condition"),
                      listTile(icon: Icons.policy_outlined,title: "Privacy & policy"),
                       listTile(icon: Icons.add_chart_outlined ,title: "About"),
                        listTile(icon: Icons.logout_outlined,title: "Log Out" ,),
                   
                ]),
             )
          ],
         ),
          Padding(
            padding: const EdgeInsets.only(top: 40,left: 40),
            child: CircleAvatar(radius: 45,
            backgroundColor:Colors.green,
             child: CircleAvatar(backgroundColor:ScaffoldBackgroundColor,radius: 40,
              backgroundImage: NetworkImage('https://img.freepik.com/free-photo/set-fruits-seeds-leaves_23-2148145087.jpg?size=626&ext=jpg&ga=GA1.2.617182311.1669882858'),
                child: Text("Vegi",style: TextStyle( fontWeight: FontWeight.bold, fontSize: 30, color: Color.fromARGB(255, 197, 234, 197),shadows: [
                  BoxShadow(
                     color: Color.fromARGB(255, 20, 141, 24),
                         blurRadius:15,
                  )
                   ])
                   ,), 
            
             ),),
          )
       ]),
       
    );
  }
}