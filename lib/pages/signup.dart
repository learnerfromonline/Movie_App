import 'package:coffe_card/pages/bottomnav.dart';
import 'package:coffe_card/pages/home.dart';
import 'package:coffe_card/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String name = "",password="",mail="";
  TextEditingController nameController = new TextEditingController();
  TextEditingController mailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  registration() async{
    if(passwordController.text!=null && nameController.text!="" && mailController.text!=""){
      try{
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: mail, password: password);
        ScaffoldMessenger.of(context).showSnackBar(
      
          SnackBar(
            backgroundColor: Colors.blue,
            content: 
          Text("User Registered SuccesFully",
          style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.black),),
          ),

        );
        return Navigator.push(context, MaterialPageRoute(builder: (context)=>Bottomnav()));
      } on FirebaseException catch(e){
        if (e.code == "weak-password"){
          ScaffoldMessenger.of(context).showSnackBar(
      
          SnackBar(
            backgroundColor: Colors.blue,
            content: 
          Text("Weak Password",
          style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.black),),
          )
        );
        } else if (e.code == "email-already-in-use"){
             ScaffoldMessenger.of(context).showSnackBar(
      
          SnackBar(
            backgroundColor: Colors.blue,
            content: 
          Text("OOPS The Mail You Provided is already in Use",
          style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.black),),
          )
        );
        }
      }
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
              Image.asset("assets/images/signphto.jpg",height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,fit: BoxFit.cover,),
              Container(
                padding: EdgeInsets.only(top: 2,left: 31,right: 31),
                margin: EdgeInsets.only(top: 190,left: 40,right: 40),
                decoration: BoxDecoration(color: const Color.fromARGB(130, 0, 0, 0) ,borderRadius: BorderRadius.circular(49)),
                height: 600,
                width: 400,
                
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("SignUp",style: TextStyle(color: Colors.white,fontSize: 33,fontWeight: FontWeight.w700),),
                    SizedBox(height: 20,),
                    Text("Name",style: TextStyle(color: const Color.fromARGB(90, 255, 255, 255),fontSize: 23,fontWeight: FontWeight.w700),),
                     TextField(
                      controller: nameController,
                      obscureText: false,style: TextStyle(color: Colors.white),autofocus: true,decoration: InputDecoration(hintText: "Enter Your Name",hintStyle: TextStyle(color: const Color.fromARGB(220, 255, 255, 255),fontStyle: FontStyle.italic),labelText: "Name",suffixIcon: Icon(Icons.person,color: const Color.fromARGB(165, 255, 255, 255),),border: UnderlineInputBorder()),),
                     SizedBox(height: 20,),
                     Text("Email",style: TextStyle(color: const Color.fromARGB(90, 255, 255, 255),fontSize: 23,fontWeight: FontWeight.w700),),
                     TextField(
                      controller: mailController,
                      obscureText: false,style: TextStyle(color: Colors.white),autofocus: true,decoration: InputDecoration(hintText: "Enter Email",hintStyle: TextStyle(color: const Color.fromARGB(220, 255, 255, 255),fontStyle: FontStyle.italic),labelText: "Enter Mail",suffixIcon: Icon(Icons.email,color: const Color.fromARGB(165, 255, 255, 255),),border: UnderlineInputBorder()),),
                     SizedBox(height: 20,),
                     Text("Password",style: TextStyle(color: const Color.fromARGB(90, 255, 255, 255),fontSize: 23,fontWeight: FontWeight.w700),),
                     TextField(
                      controller: passwordController,
                      obscureText: visible,style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic),decoration: InputDecoration(hintText: "Enter Password",hintStyle: TextStyle(color: const Color.fromARGB(133, 255, 255, 255)),suffixIcon: IconButton(icon: Icon(visible?Icons.visibility_off:Icons.visibility), onPressed: (){setState(() {
                       visible = !visible;
                     });}))),
                     SizedBox(height: 20,),
                     

                     
                    
                    //  SizedBox(height: ,),
                     Column(
                       children: [
                         Container(
                          margin: EdgeInsets.only(top: 30),
                           child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            
                            children: [
                              GestureDetector(
                                onTap: (){
                                  name = nameController.text;
                                  mail = mailController.text;
                                  password = passwordController.text;
                                  registration();
                                },
                                child: Container(
                                  height: 50,
                                  width: 120,
                                  padding: EdgeInsets.only(left: 10,right: 10,),
                                  // margin: EdgeInsets.all(33),
                                  decoration: BoxDecoration(color: const Color.fromARGB(251, 17, 14, 14),border: Border.all(color: const Color.fromARGB(255, 221, 215, 215),width: 3),borderRadius: BorderRadius.circular(40)),
                                  child: Center(child: Text("SignUP",style: TextStyle(color: const Color.fromARGB(208, 208, 215, 222),fontSize: 22,fontWeight: FontWeight.bold),)),
                                ),
                              ),
                               
                            ],
                           ),
                         ),
                         SizedBox(height: 6,),
                         GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                          },
                          child: Text("Already Have An Account ?",style: TextStyle(color: const Color.fromARGB(255, 201, 204, 210),fontSize: 15),)),
                         
                       ],
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