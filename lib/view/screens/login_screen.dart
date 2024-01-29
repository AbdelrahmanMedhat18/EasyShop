import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:handling/utils/my_string.dart';
import '../../logic/controller/auth_controller.dart';
import '../../routes/routes.dart';
import '../../utils/text_utils.dart';
import '../../utils/theme.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_form.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final formKey = GlobalKey<FormState>();
  // final TextEditingController nameController = TextEditingController();
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
                                text: "LOG",
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                color: mainColor,
                                textDecoration: TextDecoration.none,
                              ),
                              SizedBox(width: 4,),
                              TextUtils(
                                text: "IN",
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
                          Align(
                            alignment:Alignment.topRight,
                            child: TextButton(
                              onPressed: () {
                                Get.toNamed(Routes.forgetPasswordScreen);
                              },
                              child: Text(
                                  style:TextStyle(
                                    color: Colors.black,
                                  ),
                                  'Forget Password'
                              ),
                            ),
                          ),
                          SizedBox(height: 50,),
                          // CheckWidget(),
                          SizedBox(height: 50,),
                          GetBuilder<AuthController>(
                            builder: (_){
                              return AuthButton(
                                text: 'LOG IN',
                                onPressed:(){
                                  if(formKey.currentState!.validate()){
                                    String email = emailController.text.trim();
                                    String password = passwordController.text;
                                    controller.logInUsingFireBase(
                                      email: email,
                                      password: password,
                                    );
                                  }
                                },
                              );
                            },
                          ),
                          SizedBox(height: 20,),
                          TextUtils(
                            text: "OR",
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: mainColor,
                            textDecoration: TextDecoration.none,
                          ),
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: (){},
                                child: Image.asset(
                                    "assets/images/facebook.png"
                                ),
                              ),
                              SizedBox(width: 15,),
                              GetBuilder<AuthController>(
                                builder: (_){
                                  return InkWell(
                                    onTap: ()async{
                                      controller.googleSignUpApp();
                                    },
                                    child: Image.asset(
                                        "assets/images/google.png"
                                    ),
                                  );
                                },

                              ),

                            ],
                          ),
                          SizedBox(height: 80,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                  "Don't Have an Account?"
                              ),
                              TextButton(
                                onPressed: (){
                                  Get.toNamed(Routes.signUpScreen);
                                },
                                child: Text(
                                    style:TextStyle(
                                      color: mainColor,
                                    ),
                                    "SIGN UP"
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
