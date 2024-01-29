import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:handling/utils/text_utils.dart';

import '../../logic/controller/cart_controller.dart';
import '../../logic/controller/payment_controller.dart';
import '../../utils/theme.dart';
import '../widgets/delivery_widget.dart';
import '../widgets/payment_method.dart';

class PayMentScreen extends StatelessWidget {
   PayMentScreen({super.key});


  CartController cartController = Get.put(CartController());
  PayMentController payMentController = Get.put(PayMentController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      appBar: AppBar(
      backgroundColor: mainColor,
      centerTitle: true,
      elevation: 0,
      title: Text("Payment"),
    ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextUtils(
                    text: "Shipping To",
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    textDecoration: TextDecoration.none,
                ),
                SizedBox(height: 20,),
                DeliveryContinerWidget(),
                SizedBox(height: 20,),
                TextUtils(
                  text: "Payment Method",
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  textDecoration: TextDecoration.none,
                ),
                SizedBox(height: 20,),
                PaymentMethodWidget(),
                SizedBox(height: 30,),
                Center(
                  child: TextUtils(
                    text: "Total: ${cartController.total}\$",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      textDecoration: TextDecoration.none,
                  ),
                ),
                SizedBox(height: 20,),
                Center(
                  child: SizedBox(
                    height: 50,
                    width: 150,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 0,
                        primary: mainColor,
                      ),
                      onPressed: (){},
                      child: Text(
                        "Buy Now",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
    ),
    );
  }
}
