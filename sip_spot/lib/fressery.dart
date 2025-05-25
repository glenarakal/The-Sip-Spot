
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sip_spot/Vegetablejuices.dart';
import 'package:sip_spot/accountprofile.dart';
import 'package:sip_spot/cart.dart';
import 'package:sip_spot/mixjuices.dart';
import 'package:sip_spot/notification.dart';
import 'package:sip_spot/plainjuices.dart';

class Product {
  final String name;
  final String imageUrl;
  final int price;
  int quantity;
  String selectedSize;

  Product({
    required this.name,
    required this.imageUrl,
    required this.price,
    this.quantity = 1,
    this.selectedSize = "200ml",
  });

  int get totalPrice => price * quantity;
}
class Fressery extends StatefulWidget {
  const Fressery({super.key});

  @override
  State<Fressery> createState() => _FresseryState();
}

class _FresseryState extends State<Fressery> {
   List<Product> cart = [];

  void removeFromCart(Product product) {
    setState(() {
      cart.remove(product);
    });
  }
  int selectedtabindex = 0;


  List<dynamic> users = []; // List to hold fetched user data
  var getval = '';
  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    // API URL

    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      setState(() {
        getval = sharedPreferences.getString("key")!;
      });
      print("hhhhhhhhhhhhh---------------------❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️");
      print("get value is ------------- $getval");
      print("api function start  💕💕💕💕 $getval");
      print("ppppppppppppppp👍👍👍👍👍👍👍👍👍");
      Dio dio = Dio();
      FormData formData =FormData.fromMap({
         'token':getval
      });

      String apiUrl =
          'https://fressery.b4production.com/index.php?route=api/products';
      // Send GET request (no API key required here)
      Response response = await dio.post(apiUrl,data: formData );
      print("data is-------- $response");

      if (response.statusCode == 200) {
        setState(() {
          users = response.data; // Store the fetched data
          // Set loading to false
        
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: Drawer(child: Accountprofile()),
        appBar: AppBar(
          title: Text(
            "Fressery",
            style: GoogleFonts.lusitana(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.pinkAccent, Colors.deepOrange],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          // leading: IconButton(onPressed: (){
          //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Accountprofile()));
          // },
          //   icon: Icon(Icons.menu)
          //  ),
          actions: [
            IconButton(
              onPressed: () {
             
              },
              icon: Icon(Icons.calendar_today, color: Colors.black87),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Notification1()),
                );
              },
              icon: Icon(Icons.notifications, color: Colors.black87),
            ),
          
           
          ],
          bottom: TabBar(
            tabs: [Tab(text: "PLAINS"), Tab(text: "MIX"), Tab(text: "GREENS")],
          ),
        ),
        body: TabBarView(
          children: [Plainjuices(), Mixjuices(), Vegetablejuices()],
        ),
      ),
    );
  }
   Widget buildCartPage() {
    return Container(
      padding: EdgeInsets.all(16),
      height: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Cart",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          Expanded(
            child: cart.isEmpty
                ? Center(child: Text("Cart is empty"))
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      final item = cart[index];
                      return ListTile(
                        leading: Image.network(
                          item.imageUrl,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                        title: Text(item.name),
                        subtitle: Text(
                          "${item.selectedSize}, Qty: ${item.quantity}\nTotal: ₹${item.totalPrice}",
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => removeFromCart(item),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
