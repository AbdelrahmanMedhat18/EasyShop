import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:handling/model/product_models.dart';
import 'package:handling/utils/theme.dart';

import '../../logic/controller/cart_controller.dart';

class CartProductCard extends StatelessWidget {
   CartProductCard({super.key, required this.productModels, required this.index, required this.quant});

  final ProductModels productModels;
  final int index;
  final int quant;
  CartController controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 100,
      margin: EdgeInsets.only(left: 20,right: 20,top: 5),
      decoration: BoxDecoration(
        color: mainColor.withOpacity(0.4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 120,
            width: 100,
            margin: EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(
                  productModels.image,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(productModels.title),
                Text("\$${controller.productSubTotal[index].toStringAsFixed(2)}"),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: (){
                        controller.removeProductsFromCart(productModels);
                      },
                      icon: Icon(Icons.remove_circle),
                  ),
                  Text("$quant"),
                  IconButton(
                    onPressed: (){
                      controller.addProductToCart(productModels);
                    },
                    icon: Icon(Icons.add_circle),
                  ),
                ],
              ),
              IconButton(
                  onPressed: (){
                    controller.removeOneProduct(productModels);
                  },
                  icon: Icon(Icons.delete,color: Colors.red,),
              ),
            ],
          ),
        ],
      ),

    );
  }
}
