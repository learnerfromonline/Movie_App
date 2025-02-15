import 'package:coffe_card/home.dart';
import 'package:coffe_card/pages/bottomnav.dart';
import 'package:coffe_card/pages/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:coffe_card/pages/home.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String mail="",password = "";
  TextEditingController mailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  sign() async{
    try{
      if(passwordController!=null && mailController!=null){
        
        await FirebaseAuth.instance.signInWithEmailAndPassword(email: mail, password: password);
        ScaffoldMessenger.of(context).showSnackBar(
      
          SnackBar(
            
            backgroundColor: Colors.blue,
            content: 
          Text("Login SuccesFul",
          style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.black),),
          )
        );
        return Navigator.push(context, MaterialPageRoute(builder: (context)=>Bottomnav()));

    }
    } on FirebaseException catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
      
          SnackBar(
            backgroundColor: Colors.blue,
            content: 
          Text("Invalid Mail Or Password",
          style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.black),),
          )
        );
    }
    
  }
  bool visible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: [
              Image.asset("assets/images/phlogin.jpg",height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,fit: BoxFit.cover,),
              Container(
                padding: EdgeInsets.only(top: 2,left: 31),
                margin: EdgeInsets.only(top: 200,left: 40,right: 40),
                decoration: BoxDecoration(color: const Color.fromARGB(68, 0, 0, 0) ,borderRadius: BorderRadius.circular(49)),
                height: 500,
                width: 400,
                
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Login",style: TextStyle(color: Colors.white,fontSize: 33,fontWeight: FontWeight.w700),),
                    SizedBox(height: 20,),
                     Text("Email",style: TextStyle(color: const Color.fromARGB(90, 255, 255, 255),fontSize: 23,fontWeight: FontWeight.w700),),
                     TextField(
                      controller: mailController,
                      obscureText: false,style: TextStyle(color: Colors.white),autofocus: false,decoration: InputDecoration(hintText: "Enter Email",hintStyle: TextStyle(color: const Color.fromARGB(220, 255, 255, 255),fontStyle: FontStyle.italic),labelText: "Enter Mail",suffixIcon: Icon(Icons.email,color: const Color.fromARGB(165, 255, 255, 255),),border: UnderlineInputBorder()),),
                     SizedBox(height: 20,),
                     Text("Password",style: TextStyle(color: const Color.fromARGB(90, 255, 255, 255),fontSize: 23,fontWeight: FontWeight.w700),),
                     TextField(
                      controller: passwordController,
                      obscureText: visible,style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic),decoration: InputDecoration(hintText: "Enter Password",hintStyle: TextStyle(color: const Color.fromARGB(133, 255, 255, 255)),suffixIcon: IconButton(icon: Icon(visible?Icons.visibility_off:Icons.visibility), onPressed: (){setState(() {
                       visible = !visible;
                     });}))),
                     SizedBox(height: 20,),
                     Container(
                      margin: EdgeInsets.only(left: 100),
                      child: Text("Forget Password ?",style: TextStyle(color: const Color.fromARGB(255, 62, 67, 125),fontSize: 23,fontWeight: FontWeight.w700),),
                     ),
                     SizedBox(height: 20,),
                     Container(
                      margin: EdgeInsets.only(top: 30),
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Signup()));
                            },
                            child: Container(
                              height: 50,
                              width: 120,
                              padding: EdgeInsets.only(left: 10,right: 10,),
                              // margin: EdgeInsets.all(33),
                              decoration: BoxDecoration(color: const Color.fromARGB(143, 209, 195, 195),border: Border.all(color: Colors.white,width: 3),borderRadius: BorderRadius.circular(40)),
                              child: Center(child: Text("SignUP",style: TextStyle(color: const Color.fromARGB(197, 3, 7, 10),fontSize: 22,fontWeight: FontWeight.bold),)),
                            ),
                          ),
                           GestureDetector(
                            onTap: (){
                              setState(() {
                                mail = mailController.text;
                                password = passwordController.text;
                              });
                              sign();
                            },
                             child: Container(
                              height: 50,
                              width: 120,
                              padding: EdgeInsets.only(left: 10,right: 10,),
                              // margin: EdgeInsets.all(33),
                              decoration: BoxDecoration(color: const Color.fromARGB(202, 125, 105, 164),border: Border.all(color: Colors.white,width: 3),borderRadius: BorderRadius.circular(40)),
                              child: Center(child: Text("Login",style: TextStyle(color: const Color.fromARGB(250, 4, 24, 7),fontSize: 22,fontWeight: FontWeight.bold),)),
                                                       ),
                           )
                        ],
                       ),
                     )
        
        
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}