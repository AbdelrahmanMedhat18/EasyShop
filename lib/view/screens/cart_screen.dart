import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:handling/logic/controller/cart_controller.dart';
import 'package:handling/logic/controller/product_controller.dart';
import 'package:handling/utils/theme.dart';
import 'package:handling/view/widgets/empty_cart.dart';

import '../widgets/cart_product.dart';
import '../widgets/cart_total.dart';

class CartScreen extends StatelessWidget {
   CartScreen({super.key});

  ProductController controller = Get.put(ProductController());
   CartController controller2 = Get.put(CartController());


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: mainColor,
            centerTitle: true,
            elevation: 0,
            title: Text("Cart Items"),
            actions: [
              IconButton(
                  onPressed: (){
                    controller2.clearAllProducts();
                  },
                  icon: Icon(Icons.backspace),
              ),
            ],
          ),

          body: Obx(() {
            if(controller2.productMap.isEmpty){
              return EmptyCart();
            }else{
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 680,
                      child: ListView.separated(
                        itemBuilder: (context,index){
                          return CartProductCard(
                            index: index,
                            quant: controller2.productMap.values.toList()[index],
                            productModels: controller2.productMap.keys.toList()[index],
                          );
                        },
                        separatorBuilder: (context,index)=>SizedBox(height: 20,),
                        itemCount: controller2.productMap.length,
                      ),
                    ),
                    CartTotal(),
                  ],
                ),
              );
            }
          }
        ),
        ),
    );
  }
}
