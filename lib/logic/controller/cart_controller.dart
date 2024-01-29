import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:handling/routes/routes.dart';
import '../../model/product_models.dart';
import '../../utils/theme.dart';

class CartController extends GetxController{


  var productMap = {}.obs;

  void addProductToCart(ProductModels productModels){
    if(productMap.containsKey(productModels)){
      productMap[productModels]+=1;
    }else{
      productMap[productModels] =1;
    }
  }

  void removeProductsFromCart(ProductModels productModels){
    if(productMap.containsKey(productModels) && productMap[productModels]==1){

      productMap.removeWhere((key, value) => key == productModels);
    }else{
      productMap[productModels] -=1;
    }
    // Get.snackbar(
    //   "Error!",
    //   "$productMap[productModels]",
    //   snackPosition: SnackPosition.BOTTOM,
    //   backgroundColor: Colors.green,
    //   colorText: Colors.black,
    // );
  }

  void removeOneProduct(ProductModels productModels){
    productMap.removeWhere((key, value) => key == productModels);

  }

  void clearAllProducts(){


    Get.defaultDialog(

      title: "Clear Products",
      titleStyle: TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      middleText: "Are You Sure To Clear All Products",
      backgroundColor: Colors.grey,
      radius: 10,
      textCancel: " NO ",
      textConfirm: " YES ",
      onCancel: (){
        Get.toNamed(Routes.cartScreen);
      },
      onConfirm: (){
        productMap.clear();
        Get.back();
      },
      buttonColor: mainColor,
    );

  }

  get productSubTotal =>productMap.entries.map((e) => e.key.price * e.value).toList();


  get total =>  productMap.entries
      .map((e) => e.key.price * e.value)
      .toList()
      .reduce((value, element) => value +element)
      .toStringAsFixed(2);
  
  
  int quant(){
    if(productMap.isEmpty){
      return 0;
    }else{
      return productMap.entries
          .map((e) => e.value)
          .toList().
      reduce((value, element) => value+element);
    }

  }
}
