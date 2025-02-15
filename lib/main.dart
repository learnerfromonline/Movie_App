
import 'package:coffe_card/pages/booking.dart';
import 'package:coffe_card/pages/bottomnav.dart';
import 'package:coffe_card/pages/login.dart';
import 'package:coffe_card/pages/signup.dart';
import 'package:coffe_card/pages/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    
    debugShowCheckedModeBanner: false,
    
      home:Signup(),
      
    ) 
  );
}

class Sandbox extends StatelessWidget {
  const Sandbox({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}