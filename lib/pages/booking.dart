import 'package:coffe_card/pages/bottomnav.dart';
import 'package:coffe_card/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Booking extends StatefulWidget {
  String image,name,shortdesc,desc;
  Booking({required this.image, required this.name, required this.shortdesc, required this.desc});

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  List<String> getDate(){
    final now = DateTime.now();
    final formatter = DateFormat('EEE M-d');
    return List.generate( 7, (index){
      final date = now.add(Duration(days: index));
      return formatter.format(date
        
      );
    });
  }
   int time=-1;
    int track=0;
    int add = 0;
    void adds(){
      setState(() {
        add = add+1;
      });
    }
    void rmvs(){
      setState(() {
        
      add = add-1;
      });
    }
    int get add50 => add * 50;
  @override
  Widget build(BuildContext context) {
    final dates = getDate();
   
   

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Material(
            elevation: 2.0,
            
            
            child: Stack(
              children: [
                Image.asset(widget.image,fit: BoxFit.fill,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Bottomnav()));
                  },
                  child: Container(
                    
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: const Color.fromARGB(57, 0, 0, 0)),
                    margin: EdgeInsets.only(top: 60,left: 10),
                    child: Icon(Icons.back_hand_outlined,size: 40,color: Colors.white,)),
                ),
                  Container(
                    padding: EdgeInsets.only(left: 26,top: 20),
                    decoration: BoxDecoration(color: const Color.fromARGB(255, 14, 1, 1),borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(60))),
                    height: 500,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/2.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      
                      children: [
                        Text(widget.name,style: TextStyle(color: const Color.fromARGB(233, 231, 222, 222),fontSize: 30),),
                        Text(widget.shortdesc,style: TextStyle(color: const Color.fromARGB(106, 255, 255, 255),fontSize: 20),),
                        Text(widget.desc,style: TextStyle(color: const Color.fromARGB(194, 255, 255, 255),fontSize: 15),),
                        SizedBox(height: 10,),
                         Text("Dates Avaliable:",style: TextStyle(color: const Color.fromARGB(255, 237, 234, 234),fontStyle: FontStyle.italic,fontSize: 15,fontWeight: FontWeight.bold),),
                         SizedBox(height: 6,),
                        Container(
                          height: 30,
                          
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: dates.length,
                            itemBuilder: (context,index){
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                  track = index;
                                    // track=index;
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 10,right: 10),
                                  padding: EdgeInsets.only(left: 10,right: 10),
                                  
                                  decoration: BoxDecoration(color: Colors.amberAccent,borderRadius: BorderRadius.circular(9),border: Border.all(color: track==index ? Colors.white :Colors.green,width: 3.6,)),
                                  child: Center(child: Text(dates[index],style: TextStyle(color: const Color.fromARGB(255, 10, 2, 2),fontSize: 20,fontWeight: FontWeight.bold,),)),
                                ),
                              );
                            }),
                        ),
                        SizedBox(height: 10,),
                        Text("Time Slots:",style: TextStyle(color: const Color.fromARGB(255, 237, 234, 234),fontStyle: FontStyle.italic,fontSize: 15,fontWeight: FontWeight.bold),),
                        SizedBox(height: 3,),
                        Container(
                          height: 30,
                          child: Row(
                            
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                
                                behavior:HitTestBehavior.deferToChild,
                                onTap: () {
                                  setState(() {
                                  time=8;
                                    
                                  });
                                },
                                child: Container(
                                  // margin: EdgeInsets.only(left: 15,right: 15),
                                      padding: EdgeInsets.only(left: 13,right: 13),
                                      
                                      decoration: BoxDecoration(color: time == 8 ?  const Color.fromARGB(255, 134, 182, 66):const Color.fromARGB(255, 8, 224, 15),borderRadius: BorderRadius.circular(9),border: Border.all(color:const Color.fromARGB(255, 224, 38, 38),),),
                                      child: Center(child: Text("8:00",style: TextStyle(color: const Color.fromARGB(255, 10, 2, 2),fontSize: 19,fontWeight: FontWeight.bold,),)),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  
                                  setState(() {
                                    time = 10;
                                  });
                                },
                                
                                child: Container(
                                  margin: EdgeInsets.only(left: 10,right: 10),
                                      padding: EdgeInsets.only(left: 10,right: 10),
                                      
                                      decoration: BoxDecoration(color: time ==10 ? const Color.fromARGB(255, 134, 182, 66):const Color.fromARGB(255, 8, 224, 15),borderRadius: BorderRadius.circular(9),border: Border.all(color:const Color.fromARGB(255, 79, 33, 231),),),
                                      child: Center(child: Text("10:00",style: TextStyle(color: const Color.fromARGB(255, 10, 2, 2),fontSize: 19,fontWeight: FontWeight.bold,),)),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  
                                  setState(() {
                                  time ==1;
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 10,right: 10),
                                      padding: EdgeInsets.only(left: 10,right: 10),
                                      
                                      decoration: BoxDecoration(color: time ==1 ?const Color.fromARGB(255, 134, 182, 66):const Color.fromARGB(255, 8, 224, 15),borderRadius: BorderRadius.circular(9),border: Border.all(color:const Color.fromARGB(255, 233, 36, 36),),),
                                      child: Center(child: Text("1:00",style: TextStyle(color: const Color.fromARGB(255, 10, 2, 2),fontSize: 19,fontWeight: FontWeight.bold,),)),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            Container(
                              
                            
                              width: 153,
                              height: 40,
                              decoration: BoxDecoration(gradient:LinearGradient(colors: [Colors.lightGreenAccent,Colors.redAccent],),border: Border.all(color: Colors.white,width: 3,),borderRadius: BorderRadius.circular(30)),
                            
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                    // Icon(Icons.add,size: 22,color: Colors.black,),
                                    IconButton(onPressed: adds, icon: Icon(Icons.add),color: Colors.black,),
                                    Text("$add",style: TextStyle(color: Colors.black,fontSize: 22),),
                                    // Icon(Icons.remove,size: 22,color: Colors.black,),
                                     IconButton(onPressed: rmvs, icon: Icon(Icons.remove),color: Colors.black,),
                            
                                ],
                              ),
                              
                            ),
                            // SizedBox(width: 40,),
                            Spacer(),
                            Container(
                              height: 55,
                              width: 150,
                              margin: EdgeInsets.only(right: 5),
                              decoration: BoxDecoration(color: const Color.fromARGB(142, 25, 8, 8),borderRadius: BorderRadius.circular(20),border: Border.all(color: Colors.white,width: 3)),
                              child: Column(
                                children: [
                                  Text("Book Now",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                                  Text("Total : '\$ $add50 ",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold),),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
              ],
            ),
          ),
          
        ),
      ),
    );
  }
}