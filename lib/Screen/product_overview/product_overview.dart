import 'package:flutter/material.dart';
import 'package:food/Screen/ReviewCart/review_cart.dart';
import 'package:food/config/color.dart';
import 'package:food/providers/wish_list_provider.dart';
import 'package:provider/provider.dart';

enum SigninCharector { fill, outline }

class ProductOverview extends StatefulWidget {
     final String? productname;
      final String  ? productimage  ;
       final String productPrice;
       final String ?productQuantity;
       final String ?productId;
   ProductOverview({super.key, required this.productimage, required this.productname,required this.productPrice,this.productQuantity,this.productId});

  @override
  State<ProductOverview> createState() => _ProductOverviewState();
}

class _ProductOverviewState extends State<ProductOverview> {
 
  SigninCharector _charector = SigninCharector.fill;
  @override
  Widget bottomNavigationBar(
      {Color? iconcolor,
      Color? backgroundColor,
      Color? color,
      String? title,
      IconData? icondata,
     Function()? onTap}) {
    return Expanded(
        child: InkWell(
           onTap: onTap,
          child: Container(
              padding: EdgeInsets.all(20),
              color: backgroundColor,
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(
            icondata,
            size: 17,
            color: iconcolor,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            title!,
            style: TextStyle(color: color),
          )
              ]),
            ),
        ));
  }
 bool  wishListBool=false;
  Widget build(BuildContext context) {
       WishListProvider wishListProvider=Provider.of(context);
    return Scaffold(
      bottomNavigationBar: Row(
        children: [
          bottomNavigationBar(
              backgroundColor: Colors.black,
              title: "Add to WishList",
              color: Colors.white,
              iconcolor: Colors.red,
              icondata:wishListBool==false? Icons.favorite_outline:Icons.favorite,
               onTap: () {
                 setState(() {
                   wishListBool=!wishListBool;
                 });
                  if(wishListBool==true){
                    WishListProvider. addwishListdata( widget.productId, widget.productimage.toString(),widget.productname.toString(), widget.productPrice,2
                     

                    );
                  }
               },
              ),
          bottomNavigationBar(
              backgroundColor: primaryColor,
              title: "Go to Cart",
              color: Colors.black87,
              iconcolor: Colors.white,
              icondata: Icons.shop_2_outlined,
               onTap: () {
                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ReviewCart()));
               },
               )
        ],
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: textcolor),
        backgroundColor: primaryColor,
        title: Text(
          "Product Overview",
          style: TextStyle(color: textcolor),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                child: Column(children: [
                  ListTile(
                    title: Text(widget.productname!),
                    subtitle: Text(widget.productPrice),
                  ),
                  Container(
                    height: 250,
                    padding: EdgeInsets.all(40),
                    child:  Image.network(widget.productimage!),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    child: Text(
                      "Avilable options",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: textcolor, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 3,
                          backgroundColor: Colors.green,
                        ),
                        Radio(
                          value: SigninCharector.fill,
                          groupValue: _charector,
                          activeColor: Colors.green,
                          onChanged: (value) {
                            setState(() {
                              _charector = value!;
                            });
                          },
                        ),
                        Text("\$50"),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(30)),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add,
                                  size: 20,
                                  color: primaryColor,
                                ),
                                Text(
                                  "ADD",
                                  style: TextStyle(color: primaryColor),
                                )
                              ]),
                        )
                      ],
                    ),
                  )
                ]),
              )),
          Expanded(
              child: Container(
            padding: EdgeInsets.all(20),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "About  this  product ",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "In marketing, a product is an object, or system, or service made available for consumer use as of the consumer demand; it is anything that can be offered to a market to satisfy the desire or need of a customer ",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: textcolor),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
