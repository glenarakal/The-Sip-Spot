import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sip_spot/cart.dart';
import 'package:sip_spot/notification.dart';



class Product {
  final String name;
  final String imageUrl;
  final int price;
  int quantity;
  String selectedSize;
  String  orderid;
  String date;
  String status;

  Product({
    required this.name,
    required this.imageUrl,
    required this.price,
    this.quantity = 1,
    this.selectedSize = "200ml",
    required this.orderid,
    required this.date,
    required this.status,

  });

  int get totalPrice => quantity*price;
}

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  bool isSubscribed = false;

List<Product> products =[
  Product(name: "Mango Juice",
   imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSM19D4ys3BnojgW3K2bwW_UXPv6CGccEPcVw&s",
    price: 69,orderid: "Order ID \n123GDF",date: "Date \n25 JUNE 2025",status: "Status \nScheduled"),

      Product(name: "Cucumber Juice",
       imageUrl: "https://www.saltysidedish.com/wp-content/uploads/2024/07/cucumber-juice-recipe.jpg",
        price: 49,orderid: "Order ID\n345RGF",date: "Date \n26 june 2025", status: "status \nscheduled"),
    
     Product(name: "Orange Juice",
      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSayX_2LO37O_TH446RBHh_dDMQ7KqbvuFLWw&s",
       price: 69,orderid: "Order ID\n123GDF",date: "Date \n25 JUNE 2025",status: "Status \nSchedule"),

       Product(name: "Guava Juice",
        imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyQxQhHWAHqapNLoOUlv3yjaYgdiLCIxxzBw&s",
         price: 69,orderid: "Order ID\n123GDF",date: "Date \n25 JUNE 2025",status: "Status \nSchedule"),

         Product(name: "Avocado Juice",
          imageUrl:"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6-lYvtrF1VG6x8S8dfYmMaGQKorjCi6Z21g&s",
        price: 89,orderid: "Order ID:\n123GDF",date: "Date \n25 JUNE 2025",status: "Status \nSchedule") 
];


  void selectSize(Product product,String size){
    setState(() {
      product.selectedSize = size;
    });
  }

  @override
  
  Widget build(BuildContext context) {
     double screenWidth = MediaQuery.of(context).size.width;
   
    return Scaffold(
               appBar: AppBar(
          title: Text("ORDER",
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
              
            },
             icon: Icon(Icons.calendar_today,color: Colors.black87,),
             ),
             IconButton(onPressed: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>Notification1()));
             },
               icon: Icon(Icons.notifications,color: Colors.black87,),
               ),
               IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart()));
               } ,
                icon: Icon(Icons.shopping_bag_sharp), )
          ],
         
          ),
                                body: ListView.builder(
  padding: EdgeInsets.all(16),
  itemCount: products.length,
  itemBuilder: (context, index) {
    final product = products[index];
    return SizedBox(
      width: double.infinity,
      child: Card(
        color: const Color.fromARGB(255, 252, 251, 250),
        elevation: 3,
        margin: EdgeInsets.only(bottom: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              // Popup Menu Fix - Keep it aligned to the top right
              Align(
                alignment: Alignment.topRight,
                child: PopupMenuButton<String>(
                  onSelected: (value) {
                    if (value == "cancel") {
                      // Handle cancel action
                    } else if (value == "cancel all") {
                      // Handle cancel all action
                    }
                  },
                  itemBuilder: (BuildContext context) => [
                    PopupMenuItem(
                      value: "Cancel Order",
                      child: Row(
                        children: [
                          Icon(Icons.delete),
                          SizedBox(width: 5),
                          Text("Cancel Order"),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: "Order",
                      child: Row(
                        children: [
                          Icon(Icons.details_rounded),
                          SizedBox(width: 5),
                          Text("Order Details"),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              
              // Product Details
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Image
                  Image.network(
                    product.imageUrl,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 10),

                  // Product Information
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        
                        Text(
                          "${product.quantity} x ₹${product.price} = ₹${product.totalPrice}",
                          style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                        ),
                        SizedBox(height: 8),

                        // Size Selection and Subscription Toggle Fix
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 10, // Add spacing between elements
                          children: [
                            Text("Size: ", style: TextStyle(fontSize: 14)),
                            ChoiceChip(
                              label: Text("200ml"),
                              selected: product.selectedSize == "200ml",
                              onSelected: (selected) => selectSize(product, "200ml"),
                            ),

                            // FlutterSwitch and Subscribe Text Fix
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                FlutterSwitch(
                                  width: 50.0, // Reduce width slightly
                                  height: 25.0,
                                  toggleSize: 20.0,
                                  value: isSubscribed,
                                  borderRadius: 20.0,
                                  padding: 3.0,
                                  activeColor: Colors.green,
                                  inactiveColor: Colors.grey.shade300,
                                  onToggle: (val) {
                                    setState(() {
                                      isSubscribed = val;
                                    });
                                  },
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "Subscribe",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        SizedBox(height: 8),

                        // Order Details Row Fix
                        Wrap(
                          spacing: 10, // Add spacing between items
                          runSpacing: 4, // Allow wrapping if needed
                          children: [
                            Text('${product.orderid}', style: TextStyle(fontSize: 12)),
                            Text('${product.date}', style: TextStyle(fontSize: 12)),
                            Text('${product.status}', style: TextStyle(fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  },
)

    );
    
  }
}