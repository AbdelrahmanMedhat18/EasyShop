import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/routes.dart';
import '../../utils/text_utils.dart';
import '../../utils/theme.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset('assets/images/back.jpg',fit: BoxFit.fitHeight,),
            ),
            Container(
              color: Colors.black.withOpacity(0.2),
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 100,),

                  Container(
                    height:60,
                    width: 190,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: TextUtils(
                        color: Colors.white,
                        text: 'Welcome',
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        textDecoration: TextDecoration.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: 60,
                    width: 230,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextUtils(
                          color: mainColor,
                          text: 'Easy',
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          textDecoration: TextDecoration.none,
                        ),
                        SizedBox(width: 7,),
                        TextUtils(
                          color: Colors.white,
                          text: 'Shop',
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          textDecoration: TextDecoration.none,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 250,),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 40,vertical: 12),
                    ),
                    onPressed: (){
                      Get.offNamed(Routes.loginScreen);
                    },
                    child: TextUtils(
                      text: 'Get Start',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      textDecoration: TextDecoration.none,
                    ),
                  ),

                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextUtils(
                        text: "Don't Have an Account?",
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                        textDecoration: TextDecoration.none,
                      ),
                      TextButton(
                        onPressed: (){
                          Get.offNamed(Routes.signUpScreen);
                        },
                        child: TextUtils(
                          text: 'Sign Up',
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                          textDecoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
