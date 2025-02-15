import 'package:carousel_slider/carousel_slider.dart';
import 'package:coffe_card/pages/booking.dart';
import 'package:coffe_card/pages/signup.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
   Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  final List<String> imageUrl = [
    "assets/images/Avengers1.jpg",
    "assets/images/blackpanter.jpg",
    "assets/images/ant2.jpg",
    "assets/images/dr1.jpg",
    "assets/images/gurd1.jpg",
    "assets/images/iron1.jpg",
    "assets/images/sp1.jpg",
  ];
  final List<String> name = [
    "AVENGERS",
    "BLACKPANTER","ANTMAN","Doctor-Strange","Guardians Of Galaxy","IronMan","SpyderMan",
  ];
  final List<String> desc = [
    "The Avengers unite to combat powerful and dangerous threats that no single hero can face alone. They combine their extraordinary skills to protect Earth from cosmic invaders, alien armies, and catastrophic events. Their story emphasizes the importance of collaboration, sacrifice, and strength in the face of overwhelming odds, showing that heroes can come together to protect the planet and its future.",
    "King T'Challa balances his duties as Wakanda's protector and its ruler. As Black Panther, he defends his nation against internal and external threats while balancing tradition with progress. His journey explores themes of leadership, heritage, and making difficult choices for the good of both his people and the world.",
    "Scott Lang’s journey as Ant-Man is a tale of redemption, sacrifice, and family. Using his shrinking suit, he proves that even the smallest hero can make a big difference. Scott’s adventures highlight the power of second chances, courage, and the importance of fighting for his daughter’s future.",
    "Dr. Stephen Strange transforms from an arrogant neurosurgeon to the Sorcerer Supreme, learning mystic arts and taking on the responsibility of defending Earth from magical threats. His journey emphasizes selflessness, humility, and using power for the greater good.",
    "A group of misfit heroes, the Guardians of the Galaxy form a family while protecting the cosmos from villains. Led by Peter Quill (Star-Lord), their shared experiences and victories teach themes of redemption, loyalty, and the importance of a chosen family in the face of adversity.",
    "Tony Stark’s transformation from a selfish billionaire to a selfless hero is driven by his desire for redemption and the consequences of his technological inventions. His journey explores innovation, the responsibility that comes with power, and the fight to overcome his past mistakes.",
    "Peter Parker’s journey as Spider-Man is a coming-of-age story where he learns to balance his superhero responsibilities with his personal life. Facing threats while dealing with the pressures of adolescence, Peter’s story teaches the importance of responsibility, sacrifice, and perseverance.",
  ]; 

List<String> images = [
  
  "assets/images/Avengers1.jpg",
  "assets/images/blackpanter.jpg",
  "assets/images/antman1.jpg",
  "assets/images/dr1.jpg",
  "assets/images/gurd1.jpg",
  "assets/images/iron1.jpg",
  "assets/images/sp1.jpg",
];
List<String> shortdesc = [
  "Action, Adventure, Sci-Fi",
  "Action, Adventure, Sci-Fi",
  "Action, Adventure, Sci-Fi",
  "Action, Adventure, Sci-Fi",
  "Action, Adventure, Sci-Fi",
  "Action, Adventure, Sci-Fi",
  "Action, Adventure, Sci-Fi",
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 40,left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            
            children: [
              Row(
          
              spacing: BorderSide.strokeAlignCenter,           
                children: [
                  
                  Image.asset("assets/images/hai.jpg",
                  width: 30, height: 30,),
                  SizedBox(width: 30,),
                  Text("Hello , Ram",style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                    fontSize: 17
                  ),),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: ClipRRect
                    (borderRadius: BorderRadius.circular(30),
                      child: Image.asset("assets/images/space2.png",
                      width: 50,height: 30,
                      fit: BoxFit.cover,),
                    ),
                  )
                   ],
              ),
              SizedBox(height: 10,),
              Text("Welcome To,",style: TextStyle(color: const Color.fromARGB(133, 177, 172, 172),fontSize: 20,fontStyle: FontStyle.italic),),
              Row(
                children: [
                  Text("Movie",style: TextStyle(color: Colors.greenAccent,
                  fontSize: 30,fontWeight: FontWeight.bold),),
                  Text("Dash",style: TextStyle(color: Colors.cyanAccent,fontSize: 32,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),)
                ],
        
              ),
              SizedBox(height: 10,),
            Center(
              child: CarouselSlider(items: imageUrl.map((url){
                return Container(
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(child: Image.asset(url),
                  borderRadius: BorderRadius.circular(600)),
                );
              }).toList(), options: CarouselOptions(
                height: 300,
                autoPlay: true,
                aspectRatio: 15/9,
                enlargeCenterPage: true,
                viewportFraction: 0.8
        
              )),
            ),
            SizedBox(height: 20,),
            Text("Trending Movies",style: TextStyle(color: Colors.white,fontSize: 21,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),
            Container(
              height: 260,
              
              
              child: ListView(
                scrollDirection: Axis.horizontal,
                
                children: [
                  for(int i =0;i<desc.length;i++)
                    
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Booking(
                          image: images[i], name: name[i], shortdesc: shortdesc[i], 
                          desc: desc[i])));
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 20,right: 3),
                        width: 200,
                        height: 300,
                        decoration: BoxDecoration(border: Border.all(color: Colors.white,),borderRadius: BorderRadius.circular(30),),
                        child: 
                          Stack(
                            children: [
                            
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image.asset(images[i],
                                  // height: 200,
                                  width: 199,
                                  fit: BoxFit.fill,
                                  ),
                                ),
                              
                              Container(
                                
                                margin: EdgeInsets.only(top: 198),
                                padding: EdgeInsets.only(left: 8),
                                decoration: BoxDecoration(color: const Color.fromARGB(175, 0, 0, 0),borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30))),
                                // alignment: Alignment.center,
                                width: 200,
                                child: Center(
                                  child: Column(
                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(name[i],style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold,),),
                                      Text(shortdesc[i],style: TextStyle(color: const Color.fromARGB(162, 255, 255, 255),fontSize: 13,fontWeight: FontWeight.bold,),),
                                    ],
                                  ),
                                ))
                            ],
                          ),
                          
                        
                      ),
                    ),
                    SizedBox(width: 20,),
                  
                ],
              ),
            ),  
            
            ],
          ),
        ),
      ),
    );
  }
}