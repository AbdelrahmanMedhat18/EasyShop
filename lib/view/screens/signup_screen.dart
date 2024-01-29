import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../logic/controller/auth_controller.dart';
import '../../routes/routes.dart';
import '../../utils/my_string.dart';
import '../../utils/text_utils.dart';
import '../../utils/theme.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_form.dart';
import '../widgets/check_widget.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  AuthController controller = Get.put(AuthController());


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                // height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: EdgeInsets.only(left: 25,right: 25,top: 40),
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              TextUtils(
                                text: "SIGN",
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                color: mainColor,
                                textDecoration: TextDecoration.none,
                              ),
                              SizedBox(width: 4,),
                              TextUtils(
                                text: "UP",
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                textDecoration: TextDecoration.none,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          AuthFormField(
                            controller: nameController,
                            obscureText: false,
                            keyboardType: TextInputType.text,
                            validator: (value){
                              if(value.toString().length <= 2 || !RegExp(validationName).hasMatch(value)){
                                return "Enter Valid Name";
                              }else{
                                return null;
                              }
                            },
                            prefixIcon: Image.asset('assets/images/user.png'),
                            hintText: "User Name",
                            suffixIcon: PrimaryScrollController.none(child: Text(""),),

                          ),
                          SizedBox(height: 20,),
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
                          SizedBox(height: 20,),
                          GetBuilder<AuthController>(
                            builder:(_){
                              return AuthFormField(
                                controller: passwordController,
                                obscureText: controller.isVisibility? false:true,
                                keyboardType: TextInputType.visiblePassword,
                                validator: (value){
                                  if(value.toString().length<= 6){
                                    return " Password Should be Longer Than 6";
                                  }else{
                                    return null;
                                  }
                                },
                                prefixIcon: Image.asset('assets/images/lock.png'),
                                hintText: "Password",
                                suffixIcon: IconButton(
                                  onPressed: (){
                                    controller.visibility();
                                  },
                                  icon: controller.isVisibility
                                      ?Icon(
                                      Icons.visibility_off
                                  )
                                      :Icon(Icons.visibility,),
                                ),

                              );
                            },
                          ),
                          SizedBox(height: 50,),
                          CheckWidget(),
                          SizedBox(height: 50,),
                          GetBuilder<AuthController>(
                            builder: (_){
                              return AuthButton(
                                text: 'SIGN UP',
                                onPressed:()  {
                                  if(controller.isCheckBox == false){
                                    Get.snackbar(
                                      "Check Box",
                                      "Please Click on Check Box",
                                      snackPosition: SnackPosition.BOTTOM,
                                    );
                                  }
                                  else if(formKey.currentState!.validate()){
                                    String name = nameController.text.trim();
                                    String email = emailController.text.trim();
                                    String password = passwordController.text;
                                    controller.signUpUsingFireBase(
                                      name: name,
                                      email: email,
                                      password: password,
                                    );
                                    controller.isCheckBox = true;
                                  }
                                },
                              );
                            },
                          ),
                          SizedBox(height: 80,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                  'Already Have an Account?'
                              ),
                              TextButton(
                                onPressed: (){
                                  Get.toNamed(Routes.loginScreen);
                                },
                                child: Text(
                                    style:TextStyle(
                                      color: mainColor,
                                    ),
                                    "LOGIN"
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
