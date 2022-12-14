 

import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'package:food/Screen/product_overview/product_overview.dart';
import 'package:food/Screen/search/search.dart';
import 'package:food/home/drawer.dart';
import 'package:food/providers/product_provider.dart';
import 'package:food/providers/user_provider.dart';
import 'package:provider/provider.dart';

import '../home/singleProduct.dart';
import 'ReviewCart/review_cart.dart';
 

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
       late ProductProvider productProvider;
  @override
   Widget listTile({IconData? icon , String ?title}){
     return ListTile(
       leading: Icon(icon,size: 32,),
       title: Text(title!, style: TextStyle(color: Colors.black45),),

     );
   }
    @override
  void initState() {
    // TODO: implement initState
     ProductProvider productProvider = Provider.of(context,listen: false);
     productProvider.fetcherProductsData();
      productProvider.fetchfroutProductsData();
       productProvider.fetchplantProductsData();
    super.initState();
  }
   
  Widget build(BuildContext context) {
     UserProvider userProvider=Provider.of(context);
      userProvider.getUserdata();
    productProvider = Provider.of(context);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 240, 240),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Home',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color(0xffd6b738),
        actions:  [
          CircleAvatar(
            radius: 12,
            backgroundColor: Color(0xffd4d181),
            child:   IconButton(onPressed:(){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Search(search: productProvider.getAllProductSearch,)));
            },
            icon: 
             Icon(
              Icons.search,
              size: 18,
              color: Colors.black,
            ),
            )
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: InkWell(
               onTap: () {
                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ReviewCart()));
               },
              child: CircleAvatar(
                radius: 12,
                backgroundColor: Color(0xffd4d181),
                child: Icon(
                  Icons.shop,
                  size: 18,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
       drawer: MyDrawer(userProvider: userProvider),
       
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 170,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDUsEunU0bDKy8-aGuPg14xXE4t_4iFgNUuRYtyu7vetbRjeDyL8ldzsZbXFgEFcl2hg&usqp=CAU'))),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                            child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 190),
                              child: Container(
                                height: 60,
                                width: 80,
                                decoration: const BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(40),
                                        bottomRight: Radius.circular(40))),
                                child: const Center(
                                    child: Text(
                                  "Vegi",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 237, 241, 192),
                                      fontSize: 28,
                                      shadows: [
                                        BoxShadow(
                                            color:
                                                Color.fromARGB(255, 3, 188, 10))
                                      ]),
                                )),
                              ),
                            ),
                            const Text(
                              "30% off",
                              style: TextStyle(
                                  fontSize: 40,
                                  color: Color.fromARGB(255, 180, 248, 182),
                                  fontWeight: FontWeight.bold),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 40, top: 1),
                              child: Text(
                                "On all  vegitables products",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 246, 249, 246),
                                ),
                              ),
                            )
                          ],
                        )),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:   [
                      Text(
                        'Herbs Seasonings ',
                        style: TextStyle(fontSize: 17),
                      ),
                      InkWell(
                         onTap: () {
                           Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Search(
                            search: 
                              productProvider.getProductsDataList,
                            
                           ))
                           );
                         },
                        child: Text(
                          'View all',
                          style: TextStyle(color: Colors.grey, fontSize: 17),
                        ),
                      )
                    ],
                  ),
                ),
                SingleChildScrollView(
                   scrollDirection: Axis.horizontal,
                  child: Row(
                     children: productProvider.getProductsDataList.map((data) {
                        
                       return 
                          SingleProduct( productImage:data.ProductImage  ,productName: data.productName , productPrice: data.productPrice,productId: data.productId,

  ); 
                      //  SingleProduct(  productImage: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4TnDFGvoke_P3tBabAj38cLsq2hn5vsXxtg&usqp=CAU', productName: "lala",  
                 
                  // );
                       
                     }).toList(),
                    // children: [
                    //    singleProducts(),
                    //      singleProducts(),
                    //        singleProducts(),
                    //          singleProducts(),
                    //            singleProducts(),
                  // SingleProduct(  productImage: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4TnDFGvoke_P3tBabAj38cLsq2hn5vsXxtg&usqp=CAU', productName: "lala",  
                 
                  // ),
  //                  SingleProduct( productImage: 'https://www.shutterstock.com/image-photo/basil-leaves-on-white-background-260nw-1916878625.jpg',productName: 'kd', 
                   

  // ),
  //                      SingleProduct(  productImage: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4TnDFGvoke_P3tBabAj38cLsq2hn5vsXxtg&usqp=CAU', productName: "lala",
  //    ),
  //                  SingleProduct( productImage: 'https://www.shutterstock.com/image-photo/basil-leaves-on-white-background-260nw-1916878625.jpg',productName: 'kd',
  //   ),
  //                      SingleProduct(  productImage: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4TnDFGvoke_P3tBabAj38cLsq2hn5vsXxtg&usqp=CAU', productName: "lala"
  //   ),
  //                  SingleProduct( productImage: 'https://www.shutterstock.com/image-photo/basil-leaves-on-white-background-260nw-1916878625.jpg',productName: 'kd', 
  //   ),
                     
                 

                    // ],
                     
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:   [
                      Text(
                        ' Fresh Fruits ',
                        style: TextStyle(fontSize: 17),
                      ),
                      InkWell(
                           onTap: () {
                           Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Search(
                            search: 
                              productProvider.getfroutproductDataList,
                            
                           ))
                           );
                         },
                        child: Text(
                          'View all',
                          style: TextStyle(color: Colors.grey, fontSize: 17),
                        ),
                      )
                    ],
                  ),
                ),
                     SingleChildScrollView(
                   scrollDirection: Axis.horizontal,
                  child: Row(

                    children: productProvider.  getfroutproductDataList.map((data) {
                        
                       return 
                          SingleProduct( productImage:data.ProductImage  ,productName: data.productName , productPrice: data.productPrice, productId: data.productId,

  ); 
                     
                       
                     }).toList(),
  //                   children: [
  // //                   //    singleProducts(),
  // //                   //      singleProducts(),
  // //                   //        singleProducts(),
  // //                   //          singleProducts(),
  // //                   //            singleProducts(),
                  // SingleProduct(productImage: 'https://img.freepik.com/free-photo/fresh-fruits-isolated-white-background_144627-10547.jpg', productName: 'Xyz'),
                  //  SingleProduct(productImage: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4K3_Zz9jM35tapEFza-157h60hysghN9SVu8tSmRe&s', productName: 'lily'),
  //                      SingleProduct(productImage: 'https://img.freepik.com/free-photo/fresh-fruits-isolated-white-background_144627-10547.jpg', productName: 'Xyz'),
  //                  SingleProduct(productImage: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4K3_Zz9jM35tapEFza-157h60hysghN9SVu8tSmRe&s', productName: 'lily'),
                      // SingleProduct(productImage: 'https://img.freepik.com/free-photo/fresh-fruits-isolated-white-background_144627-10547.jpg', productName: 'Xyz'),
  //                  SingleProduct(productImage: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4K3_Zz9jM35tapEFza-157h60hysghN9SVu8tSmRe&s', productName: 'lily')
                    
                    
  //                   ],

                  ),
                ),
                    Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:   [
                      Text(
                        ' plants ',
                        style: TextStyle(fontSize: 17),
                      ),
                      InkWell(
                           onTap: () {
                           Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Search(
                            search: 
                              productProvider.getplantproductDataList,
                            
                           ))
                           );
                         },
                        child: Text(
                          'View all',
                          style: TextStyle(color: Colors.grey, fontSize: 17),
                        ),
                      )
                    ],
                  ),
                ),
                 SingleChildScrollView(
                   scrollDirection: Axis.horizontal,
                  child: Row(
                        children: productProvider.   getplantproductDataList.map((data) {
                        
                       return 
                          SingleProduct( productImage:data.ProductImage  ,productName: data.productName , productPrice: data.productPrice,productId: data.productId,

  ); 
                     
                       
                     }).toList(),


                    // children: [
                    //    singleProducts(),
                    //      singleProducts(),
                    //        singleProducts(),
                    //          singleProducts(),
                    //            singleProducts(),
                    //  SingleProduct(productImage: 'https://thumbs.dreamstime.com/b/hand-holding-young-plant-isolate-white-background-hand-holding-young-plant-isolate-white-background-185725919.jpg', productName: 'Xyz'),
                  // SingleProduct(productImage: Image.network('https://img.freepik.com/free-photo/fresh-fruits-isolated-white-background_144627-10547.jpg'), productName: 'Xyz'),
                  //  SingleProduct(productImage: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4K3_Zz9jM35tapEFza-157h60hysghN9SVu8tSmRe&s'), productName: 'lily'),
                  //      SingleProduct(productImage: Image.network('https://img.freepik.com/free-photo/fresh-fruits-isolated-white-background_144627-10547.jpg'), productName: 'Xyz'),
                  //  SingleProduct(productImage: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4K3_Zz9jM35tapEFza-157h60hysghN9SVu8tSmRe&s'), productName: 'lily'),
                  //     SingleProduct(productImage: Image.network('https://img.freepik.com/free-photo/fresh-fruits-isolated-white-background_144627-10547.jpg'), productName: 'Xyz'),
                  //  SingleProduct(productImage: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4K3_Zz9jM35tapEFza-157h60hysghN9SVu8tSmRe&s'), productName: 'lily')
                    
                    
                    // ],

                  ),
                ),

                //   Padding(
                //   padding: const EdgeInsets.symmetric(vertical: 10),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children:  const [
                //       Text(
                //         'Herbs Seasonings ',
                //         style: TextStyle(fontSize: 17),
                //       ),
                //       Text(
                //         'View all',
                //         style: TextStyle(color: Colors.grey, fontSize: 17),
                //       )
                //     ],
                //   ),
                // ),
                    SingleChildScrollView(
                   scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                        
                  // SingleProduct(  productImage: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4TnDFGvoke_P3tBabAj38cLsq2hn5vsXxtg&usqp=CAU'), productName: "lala",),
                  //  SingleProduct( productImage: Image.network('https://www.shutterstock.com/image-photo/basil-leaves-on-white-background-260nw-1916878625.jpg'),productName: 'kd',),
                  //      SingleProduct(  productImage: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4TnDFGvoke_P3tBabAj38cLsq2hn5vsXxtg&usqp=CAU'), productName: "lala",),
                  //  SingleProduct( productImage: Image.network('https://www.shutterstock.com/image-photo/basil-leaves-on-white-background-260nw-1916878625.jpg'),productName: 'kd',),
                  //      SingleProduct(  productImage: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4TnDFGvoke_P3tBabAj38cLsq2hn5vsXxtg&usqp=CAU'), productName: "lala",),
                  //  SingleProduct( productImage: Image.network('https://www.shutterstock.com/image-photo/basil-leaves-on-white-background-260nw-1916878625.jpg'),productName: 'kd',),
                     
                  //    SingleProduct(productName: "sd",),

                    ],
                     
                  ),
                ),

                
              ],
            ),
          )
          ),
    );
  }
}

 