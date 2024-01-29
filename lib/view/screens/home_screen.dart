import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utils/text_utils.dart';
import '../../utils/theme.dart';
import '../widgets/card_items.dart';
import '../widgets/search_form_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 180,
              decoration: const BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextUtils(
                      text: "Find Your",
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      textDecoration: TextDecoration.none,
                    ),
                    SizedBox(height: 5,),
                    TextUtils(
                      text: "INSPIRATION",
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      textDecoration: TextDecoration.none,
                    ),
                    SizedBox(height: 10,),
                    SearchTextForm(),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: TextUtils(
                  text: "Categories",
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  textDecoration: TextDecoration.none,
                ),
              ),
            ),
            SizedBox(height: 30,),
            CardItems(),
          ],
        ),
      ),
    );
  }
}
