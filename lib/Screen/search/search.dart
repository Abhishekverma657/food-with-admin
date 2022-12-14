import 'dart:io';

import 'package:flutter/material.dart';
// import '../../../widget/single.dart';
import 'package:food/config/color.dart';
import 'package:food/models/product_model.dart';

import '../Widget/singleItem.dart';
 
 class Search extends StatefulWidget {
    List<ProductModel>search;
   Search({super.key, required this.search});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
   String query='';
searchItem( String query){
     List<ProductModel>searchfood=widget.search.where((element) {
      return element.productName.toLowerCase().contains(query);
     }).toList();
     return searchfood;

   }
  @override
  Widget build(BuildContext context) {
    List<ProductModel>_searchItem=searchItem(query);
    return Scaffold(
      
       appBar: AppBar(title: Text("Search"),
      
      backgroundColor: primaryColor,
       actions: [
        Icon(Icons.menu_rounded),

       ],
        
         ),
          body:  ListView(children: [
            ListTile(
              title: Text("Items"),
            ),
             Container(
               padding: EdgeInsets.symmetric(horizontal: 10),
              height: 52,
                child: TextField(
                   onChanged: (value) {
                     setState(() {
                       print(value);
                       query=value;
                     });
                     
                   },
                  decoration:InputDecoration(
                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(30),
                     borderSide: BorderSide.none),
                      fillColor: Color.fromARGB(255, 225, 223, 223),
                       filled: true,
                        hintText: "Search for Item in the store",
                         suffixIcon: Icon(Icons.search)
                  ),
                   
                ),
             ),
              SizedBox(
                height: 10,
              ),
               Column(
                children: _searchItem.map((data) {
                  return  SingleItem ( 
                 isBool: false,
                  productImage: data.ProductImage,
                  productName: data.productName,
                  productPrice: data.productPrice,
                  
               );
                }).toList(),
               ),
              //  SingleItem ( 
              //    isBool: false,
                  
              //  ),
              //  SingleItem (
              //     isBool: false,
              //  ),
              //  SingleItem (
              //     isBool: false,
              //  ),
              //  SingleItem (
              //     isBool: false,
              //  ),

          ],
          ),
    );
  }
}