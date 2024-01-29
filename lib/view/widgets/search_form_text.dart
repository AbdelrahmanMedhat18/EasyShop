import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../logic/controller/product_controller.dart';

class SearchTextForm extends StatelessWidget {
   SearchTextForm({super.key});

  ProductController controller = Get.put(ProductController());


  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
        builder: (_){

          return TextField(
            onChanged: (searchName){
              controller.addSearchToList(searchName);
            },
            controller: controller.textEditingController,
            cursorColor: Colors.black,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              fillColor: Colors.white,
              focusColor: Colors.red,
              prefixIcon: Icon(Icons.search),
              suffixIcon:controller.textEditingController.text.isNotEmpty?
              IconButton(
                onPressed: (){
                  controller.clearSearch();
                },
                icon: Icon(
                  Icons.close,
                  color: Colors.black,
                ),
              ):null,
              hintText: "Search Your Looking For",
              hintStyle: TextStyle(
                color: Colors.black45,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(15),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          );
        },

    );
  }
}
