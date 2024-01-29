import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:handling/utils/theme.dart';

import '../../routes/routes.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
              Icons.shopping_cart,
            size: 150,
            color: Colors.black,
          ),
          SizedBox(height: 40,),
          RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Your Cart is ",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,

                    ),
                  ),
                  TextSpan(
                    text: "Empty",
                    style: TextStyle(
                      color: mainColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,

                    ),
                  ),
                ],
              ),
          ),
          SizedBox(height: 10,),
          Text("Add Item to Get Start"),
          SizedBox(height: 50,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 0,
              primary: mainColor,
            ),
              onPressed: (){
                Get.toNamed(Routes.mainScreen);
              },
              child: Text(
                "Go To Home",
              ),
          ),
        ],
      ),
    );
  }
}
