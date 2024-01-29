import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../logic/controller/auth_controller.dart';
import '../../../utils/my_string.dart';
import '../../utils/theme.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_form.dart';

class ForgetPassword extends StatelessWidget {
   ForgetPassword({super.key});

  final formKey = GlobalKey<FormState>();
   AuthController controller = Get.put(AuthController());
   final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            style:TextStyle(
              color: mainColor,
            ),
              'Forget Password'
          ),
        ),
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [

                  Text(
                      "If You Want to Recover Your Account , Please Provide Your Email Below..",
                    textAlign: TextAlign.center,
                    style:  TextStyle(
                      color: Colors.black,
                    ),

                  ),
                  SizedBox(height: 50,),
                  Image.asset("assets/images/forgetpass copy.png",width: 300,),
                  SizedBox(height: 15,),
                  AuthFormField(
                    controller: emailController,
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value){
                      if(!RegExp(validationEmail).hasMatch(value)){
                        return "Invalid Email";
                      }else{
                        return null;
                      }
                    },
                    prefixIcon: Image.asset('assets/images/email.png'),
                    hintText: "Email", suffixIcon: PrimaryScrollController.none(child: Text(""),),

                  ),
                  SizedBox(height: 50,),
                  GetBuilder<AuthController>(
                      builder: (_){
                        return AuthButton(
                          text: "SEND",
                          onPressed: (){
                            if(formKey.currentState!.validate()){
                              String email = emailController.text.trim();
                              controller.resetPassword(email);
                            }
                          },
                        );
                      },

                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
