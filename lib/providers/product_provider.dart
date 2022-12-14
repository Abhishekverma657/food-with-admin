import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:food/models/product_model.dart';
 

class ProductProvider with ChangeNotifier{
 




    late ProductModel productModel;
     List<ProductModel>search=[];

     productModels(QueryDocumentSnapshot element){
       productModel=ProductModel(
         ProductImage: element.get("productImage"),
         productName: element.get("productName"),
         productPrice: element.get("productPrice"),
         productId: element.get("productId")

       );
        search.add(productModel);

     }
 /////////////////first row////////////

       List <ProductModel> ProductList=[];
  fetcherProductsData() async{
    List <ProductModel> newList=[];
     
 
    QuerySnapshot value =   await FirebaseFirestore.instance.collection("ProductsData").get();
      value.docs.forEach((element) {
          // print(element.data());
          //  productModel=ProductModel(ProductImage: element.get("productImage"), productName: element.get("productName"), productPrice: element.get("productPrice"));
          productModels(element);
           newList.add(productModel);
      });
      ProductList=newList;
      notifyListeners();
       
  }
    List<ProductModel>get getProductsDataList{
    return ProductList;
   }

 /////////////sec row//////////
  List <ProductModel> froutproduct=[];
    fetchfroutProductsData() async{
    List <ProductModel> newList=[];
     
 
    QuerySnapshot value =   await FirebaseFirestore.instance.collection("froutsproduct").get();
      value.docs.forEach((element) {
          // print(element.data());
          //  productModel=ProductModel(ProductImage: element.get("productImage"), productName: element.get("productName"), productPrice: element.get("productPrice"));
          productModels(element);
           newList.add(productModel);
      });
       froutproduct=newList;
      notifyListeners();
       
  }
    List<ProductModel>get getfroutproductDataList{
    return  froutproduct;

   }
///////////////third row////////
   
  List <ProductModel> plantproduct=[];
    fetchplantProductsData() async{
    List <ProductModel> newList=[];
     
 
    QuerySnapshot value =   await FirebaseFirestore.instance.collection("plantProduct").get();
      value.docs.forEach((element) {
          // print(element.data());
          //  productModel=ProductModel(ProductImage: element.get("productImage"), productName: element.get("productName"), productPrice: element.get("productPrice"));
          productModels(element);
           newList.add(productModel);
      });
     plantproduct =newList;
      notifyListeners();
       
  }
    List<ProductModel>get getplantproductDataList{
    return   plantproduct;
   }


//////////////search return 
  List<ProductModel>get getAllProductSearch{
    return   search;
   
    
   }
 


}