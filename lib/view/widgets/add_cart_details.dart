import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:handling/model/product_models.dart';
import 'package:handling/utils/text_utils.dart';

import '../../logic/controller/cart_controller.dart';
import '../../utils/theme.dart';

class AddCart extends StatelessWidget {
   AddCart({super.key, required this.price, required this.productModels});

  final double price;
  final ProductModels productModels;

  CartController controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
           Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               TextUtils(
                   text: "Price",
                   fontSize: 16,
                   fontWeight: FontWeight.bold,
                   color: Colors.grey,
                   textDecoration: TextDecoration.none,
               ),
               Text(
                 "$price",
                 style: TextStyle(
                   color: Colors.black,
                   fontSize: 20,
                   fontWeight: FontWeight.bold,
                   // height: 1.5,
                 ),
               ),
             ],
           ),
          SizedBox(width: 10,),
          Expanded(
            child: SizedBox(
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                  ),
                  elevation: 0,
                  primary: mainColor,
                ),
                onPressed: (){
                  controller.addProductToCart(productModels);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Add To Cart",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Icon(Icons.shopping_cart,color: Colors.white,),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
