import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';

class Changepassword extends StatefulWidget {
  const Changepassword({super.key});

  @override
  State<Changepassword> createState() => _ChangepasswordState();
}

class _ChangepasswordState extends State<Changepassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(onPressed: (){
          Navigator.pop(context);
          }, 
          icon: Icon(Icons.close,color: const Color.fromARGB(226, 4, 14, 16),size: 45,))
            ],
          ),
       Column(
                 children: [
           Padding(
             padding: const EdgeInsets.all(16.0),
             child: Row(mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 Text("Change Password",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.start,),   
               ],              
             ),       
                   
           ),  
         ], 
       ),
       Column(
                 children: [
           Padding(
             padding: const EdgeInsets.all(16.0),
             child: Row(mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 Text("Re-enter Password",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),textAlign: TextAlign.start,),   
               ],              
             ),       
                   
           ),  
         ], 
       ),
         Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: PasswordField(
                  color: Colors.blue,
                  passwordConstraint: r'.*[@$#.*].*',
                  passwordDecoration: PasswordDecoration(),
                  // hintText: 'must have special characters',
                  border: PasswordBorder(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color.fromARGB(255, 104, 11, 211),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color.fromARGB(255, 10, 39, 205),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          BorderSide(width: 2, color: const Color.fromARGB(255, 239, 154, 164)),
                    ),
                  ),
                  errorMessage:
                      'must contain special character either . * @ # \$',
                ),
              ),  SizedBox(height: 10,),

          Column(
                 children: [
           Padding(
             padding: const EdgeInsets.all(16.0),
             child: Row(mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 Text("Re-enter Password",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),textAlign: TextAlign.start,),   
               ],              
             ),       
                   
           ),  
         ], 
       ),
              //  Row(
              //    children: [
              //      Text("Change Password",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),textAlign: TextAlign.start,),
              //    ],
              //  ),   

               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: PasswordField(
                  color: Colors.blue,
                  passwordConstraint: r'.*[@$#.*].*',
                  passwordDecoration: PasswordDecoration(),
                  // hintText: 'must have special characters',
                  border: 
                  PasswordBorder(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color.fromARGB(255, 9, 1, 239),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color.fromARGB(255, 46, 7, 241),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          BorderSide(width: 2, color: const Color.fromARGB(255, 231, 8, 8)),
                    ),
                  ),
                  
                  errorMessage:
                      'must contain special character either . * @ # \$',
                ),
              ),

              SizedBox(height: 20,),
              
                  ElevatedButton(
                    onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(color: Colors.pinkAccent )),
                   child: Text("     Update     "),
                   ),
                   SizedBox(height: 10,),
                  
                     ElevatedButton(
                    onPressed: (){},
                  style: ElevatedButton.styleFrom(side: BorderSide(color: Colors.pinkAccent )),
                   child: Text("     Cancel     "),
                   ),
             
        ],
      ),
    );
  }
}