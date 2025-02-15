import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int price = 1;

  void buri(){
    setState((){
      price = price < 10 ? price + 1 : 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Welcome"),
      backgroundColor: Colors.limeAccent,
      centerTitle: true,
      ),
      body:Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      
        children: [
          Container(
            color: Colors.black45,
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(10),
            child: Text("Welcome To Coffe Shop!!",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),
            ),
          ),
               Container(
                color: Colors.yellowAccent,
                padding: EdgeInsets.all(3),
                margin: EdgeInsets.all(20),
                 child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  
                             children: [
                 
                               Text("Bubble Tea"),
                               for(int i =0;i<price;i++)
                                Image.asset('assets/images/latest.png',
                                width: 20,
                                height: 53,
                                fit: BoxFit.fitWidth,
                                colorBlendMode: BlendMode.difference,),
                               SizedBox(width: 30,),
                               Text("$price"),
                 
                             ],
                            ),
               ),
               Container(
                color: const Color.fromARGB(255, 136, 128, 104),
                padding: EdgeInsets.all(30),
                margin: EdgeInsets.all(30),
                
                 child: Image.asset('assets/images/space2.png',
                 colorBlendMode: BlendMode.multiply,                 
                 
                 ),
               ),
               Container(
                color: Colors.grey,
                margin: EdgeInsets.all(20),
                width: 20,
                height: 120,
                 child: TextButton(
                  onPressed: buri,
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black,
                    
                  ),
                   child: Expanded(
                     child: Image.asset('assets/images/latest.png',
                     colorBlendMode: BlendMode.multiply,
                     width: 200,
                     height: 200,
                     fit: BoxFit.fitHeight,
                     ),
                   )
                   ),
               )
          
          
        ]
      ),
    );
    
  }
}

