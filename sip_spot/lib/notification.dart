import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sip_spot/cart.dart';

class Notification1 extends StatefulWidget {
  const Notification1({super.key});

  @override
  State<Notification1> createState() => _NotificationState();
}

class _NotificationState extends State<Notification1> {
  List<String> tablabels = ["ALERTS", "OFFERS"];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2,
      child: Scaffold(
         appBar: AppBar(
            title: Text("NOTIFICATION",
            style: GoogleFonts.lusitana(fontWeight: FontWeight.bold),),
            backgroundColor: Colors.transparent,
            elevation: 0,
            flexibleSpace: Stack(
              children: [ Container(
                
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.pinkAccent,Colors.deepOrange],
                 begin: Alignment.topLeft,
                 end: Alignment.bottomRight,
                  )
                ),
              ),
              ]
            ),
        
            leading: IconButton(onPressed: (){
            Navigator.pop(context);
            }, 
              icon: Icon(Icons.menu)
             ),
        
            actions: [
              IconButton(onPressed: (){
                
              },
               icon: Icon(Icons.calendar_today,color: Colors.black87,),
               ),
               IconButton(onPressed: (){
                
               },
                 icon: Icon(Icons.notifications,color: Colors.black87,),
                 ),
                 IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart()));
                 } ,
                  icon: Icon(Icons.shopping_bag_sharp), )
            ],
             bottom: TabBar(  
            tabs: [  
              Tab(text: "ALERTS",),  
              Tab(text: "OFFERS",),
             
            ],  
          ),  
            ),
            body: 
            Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                     Padding(
                        padding: const EdgeInsets.only(left: 720),
                        child: PopupMenuButton<String>(
                          onSelected: (value) {
                          if (value=="Delete Notification") {
                            
                          }
                         else if(value == "Delete All Notification"){}
                        },
                          itemBuilder: (BuildContext context)=>[
                            PopupMenuItem(value: "Delete Notification",
                            child: Text("Delete notification"),
                            ),
                            PopupMenuItem(value: "Delete",
                              child: Text("Delete all notification"))
                            ]
                            ),
                      ),
                    Text("Notification Header",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                
                    Text("17th june 2025      2:30pm",style: TextStyle(fontSize: 10),),
                    SizedBox(height: 4,),
                    Text("In Spanish, the word for juice varies by region.In many Spanish-speaking countries, fresh juice is often sold in markets and enjoyed as part of a healthy diet."),
                    Divider(),

                       Padding(
                        padding: const EdgeInsets.only(left: 720),
                        child: PopupMenuButton<String>(
                          onSelected: (value) {
                          if (value=="Delete Notification") {
                            
                          }
                         else if(value == "Delete All Notification"){}
                        },
                          itemBuilder: (BuildContext context)=>[
                            PopupMenuItem(value: "Delete Notification",
                            child: Text("Delete notification"),
                            ),
                            PopupMenuItem(value: "Delete",
                              child: Text("Delete all notification"))
                            ]
                            ),
                      ),

                    Text("Subscription End Tomorrow",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    Text("18th June 2025    1:26",style: TextStyle(fontSize: 10),),
                    SizedBox(height: 4,),
                    Text("In Spanish, the word for juice varies by region.In many Spanish-speaking countries, fresh juice is often sold in markets and enjoyed as part of a healthy diet."),
                    SizedBox(height: 10,),
                      Container(
                        height: 30,
                        width: 120,
                        decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.deepOrange,Colors.pinkAccent]
                        ),
                        borderRadius: BorderRadius.circular(50)
                        ),
                        child: TextButton(onPressed: (){},
                         child: Text('Re-Subscribe',
                         style: TextStyle(fontSize: 15, color: const Color.fromARGB(255, 237, 234, 234),),)),
                      ),
                      Divider(),

                       Padding(
                        padding: const EdgeInsets.only(left: 720),
                        child: PopupMenuButton<String>(
                          onSelected: (value) {
                          if (value=="Delete Notification") {
                            
                          }
                         else if(value == "Delete All Notification"){}
                        },
                          itemBuilder: (BuildContext context)=>[
                            PopupMenuItem(value: "Delete Notification",
                            child: Text("Delete notification"),
                            ),
                            PopupMenuItem(value: "Delete",
                              child: Text("Delete all notification"))
                            ]
                            ),
                      ),
                
                      Text('Notification Header',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                      Text("27th june 2025     2:29",style: TextStyle(fontSize: 10),),
                      Text("In Spanish, the word for juice varies by region.In many Spanish-speaking countries, fresh juice is often sold in markets and enjoyed as part of a healthy diet"),
              
                 Divider(),
                 Padding(
                        padding: const EdgeInsets.only(left: 720),
                        child: PopupMenuButton<String>(
                          onSelected: (value) {
                          if (value=="Delete Notification") {
                            
                          }
                         else if(value == "Delete All Notification"){}
                        },
                          itemBuilder: (BuildContext context)=>[
                            PopupMenuItem(value: "Delete Notification",
                            child: Text("Delete notification"),
                            ),
                            PopupMenuItem(value: "Delete",
                              child: Text("Delete all notification"))
                            ]
                            ),
                      ),
                      Text('Notification Header',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      Text("27th june 2025     2:29",style: TextStyle(fontSize: 10),),
                      Text("In Spanish, the word for juice varies by region.In many Spanish-speaking countries, fresh juice is often sold in markets and enjoyed as part of a healthy diet")
              
                  ],
                  
                  
                ),
              ),
            )
      ),
    );
  }
}