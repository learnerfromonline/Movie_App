
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:coffe_card/pages/home.dart';
import 'package:coffe_card/pages/booking.dart';
import 'package:coffe_card/pages/profile.dart';
class Bottomnav extends StatefulWidget {
  const Bottomnav({super.key});
  
  @override
  State<Bottomnav> createState() => _BottomnavState();
}

class _BottomnavState extends State<Bottomnav> {
  late List<Widget> pages;

  late Home HomePage;
  late Booking booking;
  late Profile profile;
  
  int currentIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    HomePage = Home();
    booking = Booking(image: 'assets/images/dr1.jpg',name: "Doctor Strange",desc: "Arrogant surgeon Stephen Strange loses his hands, then finds a new purpose and power as the mystical Sorcerer Supreme.  He defends Earth from otherworldly threats, grappling with the burdens and cosmic knowledge his magic brings.",shortdesc: "Fantasy, Adventure",);
    

    
    pages = [HomePage,booking];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.black,
        color: const Color.fromARGB(103, 255, 255, 255),
        animationDuration: Duration(milliseconds: 500),
        animationCurve: Curves.easeInCubic,
        onTap: (int index){
          setState(() {
            currentIndex = index;
          });
        } ,
        items: [
          Icon(Icons.home,color: Colors.black,size: 30,),
          Icon(Icons.book,color: Colors.black,size: 30,),
          // Icon(Icons.lock_person_outlined,color: Colors.black,size: 30,),
          
        ]),
        body: pages[currentIndex],
    );
  }
}