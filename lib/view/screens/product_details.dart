import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handling/view/widgets/product_slider.dart';

import '../../model/product_models.dart';
import '../widgets/add_cart_details.dart';
import '../widgets/clothes_info.dart';
import '../widgets/size_list.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.productModels});

  final ProductModels productModels;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductSlider(
                imageUrl: productModels.image,
                productModels: null,
              ),
            ClothesInfo(
              titlel: productModels.title,
              productId: productModels.id,
              rate: productModels.rating.rate,
              descreption: productModels.description,
            ),
              SizeList(),
              AddCart(
                price: productModels.price,
                productModels: productModels,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

