import 'package:flutter/material.dart';
import 'package:loginpage/auth_controller.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController=TextEditingController();
    var passwordController=TextEditingController();
    double w=MediaQuery.of(context).size.width;
    double h=MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor:Colors.white,
      body: Column(
        children: [
          SizedBox(height: 100,),
          Container(
           /* width: w,
            height: h*0.5,
            decoration: BoxDecoration(
                image:DecorationImage(
                    image: AssetImage(
                        "img/f.PNG"
                    ),
                    fit: BoxFit.cover
                )

            ),*/
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
                /*Text(
                  "se connecter pour y accéder",
                  style: TextStyle(
                      fontSize: 20,
                    color: Colors.grey[500]
                  ),
                ),*/
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
                      hintText: "votre email",
                        prefixIcon: Icon(Icons.email,color: Colors.redAccent),
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
                        hintText: "password",
                        prefixIcon: Icon(Icons.password,color: Colors.redAccent),
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

              AuthController.instance.register(emailController.text.trim(), passwordController.text.trim());
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
                  "Valider",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
         // SizedBox(height:w*0.1),
          

        ],
      ),

    );
  }
}