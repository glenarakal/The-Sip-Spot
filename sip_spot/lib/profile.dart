import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:sip_spot/accountprofile.dart';
import 'package:sip_spot/cart.dart';
import 'package:sip_spot/changepassword.dart';
import 'package:sip_spot/notification.dart';
import 'package:sip_spot/wallet.dart';


class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
//  final String name;
//  final bool isDefault;
//  AddressTile({required this.name,required this.isDefault});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Fressery",
          style: GoogleFonts.lusitana(fontWeight: FontWeight.bold),),
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.pinkAccent,Colors.deepOrange],
             begin: Alignment.topLeft,
             end: Alignment.bottomRight,
              )
            ),
          ),
      
          leading: IconButton(onPressed: (){
              Navigator.pop(context);
          }, 
            icon: Icon(Icons.menu)
           ),
      
          actions: [
            IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart()));
            },
             icon: Icon(Icons.calendar_today,color: Colors.black87,),
             ),
             IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Notification1()));
             },
               icon: Icon(Icons.notifications,color: Colors.black87,),
               ),
               IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Accountprofile()));
               } ,
                icon: Icon(Icons.shopping_bag_sharp), )
          ]
          ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Row(mainAxisAlignment: MainAxisAlignment.end,
             children: [
               IconButton(onPressed: (){}, 
                icon: Icon(Icons.edit,
                color: const Color.fromARGB(255, 243, 3, 3),),
                    iconSize: 30, 
                    ),
                   ],
             ),
              Row(
                children: [
                  CircleAvatar(
                    radius: 70 ,
                    backgroundColor: Colors.transparent,
                    child: ClipOval(
                      child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOn0Sb56dFRThzFygT9vO0mpANLcOfuiNXbA&s",fit: BoxFit.cover,),
                    ),
                     ), 
                     
                   
                     
                      Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      children: [
                        Text("Glen Arakal",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
                        Row(
                          children: [
                            Text("Wallet Balance : 340cr",textScaleFactor: 0.8,
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)
                          ],
                        ),
                        SizedBox(height: 10,),
                        Column(
                          children: [
                            ElevatedButton(onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Wallet()));
                            },
                             child: Text("Recharge Wallet",
                            style: TextStyle(color: Colors.black,fontSize: 11,fontWeight: FontWeight.w400),
                             ),
                             style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                            
                              elevation: 12,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)
                              ),
                              side: BorderSide(color: const Color.fromARGB(255, 234, 3, 23))
                             )
                             ),
                           
                          ],
                        ),
          
                      ],
                    ),
                    
                  )                              
                    ],
                  ), 
                  Divider(),
                  Text("Email",style: TextStyle(fontSize: 18,
                                       fontWeight: FontWeight.bold),textAlign: TextAlign.start,),
                                       Text("glen.arakal0007@gmail.com",style: TextStyle(),),
                                       Divider(),
                                       Text("Phone",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                                       Text("+91-9539690658"),
                                       Divider(),
                                      TextButton(onPressed: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Changepassword()));
                                      }, 
                                      child: Text("Change Password",style: TextStyle(fontSize:18 ),)),
                                       Divider(),
                                       Text("Address",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                                       Text(" Arakal House,\nChethy P.O,\nAlappuzha,\nKerala,\n688530"),
                                       Divider(),
                                       Text("Address",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                                       Text("Anchuthaikal House,\nChellanam P.O,\ncochin,688520"),
                 
                     Center(
                       child: ElevatedButton(onPressed: (){},
                        child: Text("Add New Address",style: TextStyle(color: Colors.purpleAccent),),
                        style: ElevatedButton.styleFrom(
                          side: BorderSide(color: Colors.cyanAccent)
                        )
                     ),           
             )   ],
          ),
        ),
       
      ),
      
    );
  }
}