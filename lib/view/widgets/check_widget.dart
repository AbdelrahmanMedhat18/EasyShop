import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../logic/controller/auth_controller.dart';
import '../../utils/text_utils.dart';

class CheckWidget extends StatelessWidget {
   CheckWidget({super.key});


   AuthController controller = Get.put(AuthController());
   @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (_){
        return Row(
          children: [
            InkWell(
              onTap: (){
                controller.checkBox();
              },
              child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child:controller.isCheckBox? Image.asset('assets/images/check.png'):Container(),
              ),
            ),
            SizedBox(width: 10,),
            Row(
              children: [
                TextUtils(
                  text: 'I Accept',
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                  textDecoration: TextDecoration.none,
                ),
                TextUtils(
                  text: 'Terms & Conditions',
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                  textDecoration: TextDecoration.underline,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
