import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loginpage/auth_controller.dart';
import 'package:loginpage/signup_page.dart';
import 'package:loginpage/welcome_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    double w=MediaQuery.of(context).size.width;
    double h=MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor:Colors.white ,
      body: Column(
        children: [
          Container(
            width: w,
            height: h*0.4,
            decoration: BoxDecoration(
              image:DecorationImage(
            image: AssetImage(
        "img/n.png"
                  ),
                fit: BoxFit.cover
              )

            ),
          ),
          Container(
            child: Column(
              children: [
                Text(
                  "Temp Solutions",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),
                ),

                SizedBox(height: 50,),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow:[
                      BoxShadow(
                        blurRadius: 10,
                        spreadRadius: 7,
                        offset: Offset(1,1),
                        color: Colors.grey.withOpacity(0.2)
                      )
                    ]
                  ),
                  child: TextField(
                    controller:emailController ,
                    decoration: InputDecoration(
                        hintText: "Email",
                        prefixIcon: Icon(Icons.email,color: Colors.cyan),
                      focusedBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1.0
                        )
                      ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),

                            borderSide: BorderSide(
                                color: Colors.white,
                                width: 1.0
                            )
                        ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)
                      )
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow:[
                        BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 7,
                            offset: Offset(1,1),
                            color: Colors.grey.withOpacity(0.2)
                        )
                      ]
                  ),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: Icon(Icons.password,color: Colors.cyan),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                                color: Colors.white,
                                width: 1.0
                            )
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),

                            borderSide: BorderSide(
                                color: Colors.white,
                                width: 1.0
                            )
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)
                        )
                    ),
                  ),
                ),
                SizedBox(height: 20,),/*
                Row(
                  children: [
                    Expanded(child:Container(),),
                    Text(
                      "mot de passe oublié",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey[500]
                      ),
                    )
                  ],
                ),*/

              ],
            ),
          ),
          SizedBox(height: 70,),
          GestureDetector(
            onTap: (){
              AuthController.instance.login(emailController.text.trim() , passwordController.text.trim());
            },
            child: Container(
              width: w*0.5,
              height: h*0.08,
              decoration: BoxDecoration(
                borderRadius:BorderRadius.circular(30 ),
                  image:DecorationImage(
                      image: AssetImage(
                          "img/téléchargement (2).jpg"
                      ),
                      fit: BoxFit.cover
                  )

              ),
              child:    Center(
                child: Text(
                  "Sign in",
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    color: Colors.white,

                  ),

                ),

              ),

            ),
          ),
          SizedBox(height:w*0.1),
          RichText(text: TextSpan(
            text: "Vous n\'avez pas un compte?",
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 20
            ),
            children: [
              TextSpan(
              text: "Créer",
              style: TextStyle(
                  color: Colors.black ,
                  fontSize: 20,
                fontWeight: FontWeight.bold
              ),
                recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>SignUpPage())
              )
            ]
          ))
        ],
      ),

    );
  }
}
