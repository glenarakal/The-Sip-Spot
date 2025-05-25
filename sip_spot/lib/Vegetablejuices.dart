import 'package:flutter/material.dart';
import 'package:sip_spot/checkoutscreen.dart';

class Product2 {
  final String name;
  final String imageUrl;
  final int price;
  int quantity;
  String selectedSize;

  Product2({
    required this.name,
    required this.imageUrl,
    required this.price,
    this.quantity = 1,
    this.selectedSize = "200ml",
  });

  int get totalPrice => price * quantity;
}

class Vegetablejuices extends StatefulWidget {
  @override
  _JuiceOrderPageState createState() => _JuiceOrderPageState();
}

class _JuiceOrderPageState extends State<Vegetablejuices> {
  List<Product2> allProducts = [
    Product2(
      name: "Carrot Juice",
      imageUrl:
          "https://cdn.cdnparenting.com/articles/2020/01/24151805/Carrot-Apple-Juice-Recipe.webp",
      price: 49,
    ),
    Product2(
      name: "Cucumber Juice",
      imageUrl:
          "https://www.saltysidedish.com/wp-content/uploads/2024/07/cucumber-juice-recipe.jpg",
      price: 49,
    ),

    Product2(
      name: "Broccoli Juice",
      imageUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTB2qPAMStstzHVsrDMdzX7R0cNaCL0x4TSbw&s",
      price: 59,
    ),

    Product2(
      name: "Spinach",
      imageUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdMkysXRlyefy2DdHK_AYGScTVkhVU7BepQw&s",
      price: 79,
    ),
  ];

  List<Product2> carts = [];

  void addToCart(Product2 producter) {
    setState(() {
      carts.add(
        Product2(
          name: producter.name,
          imageUrl: producter.imageUrl,
          price: producter.price,
          quantity: producter.quantity,
          selectedSize: producter.selectedSize,
        ),
      );
    });
  }

  void increaseQuantity(Product2 producter) {
    setState(() {
      producter.quantity++;
    });
  }

  void decreaseQuantity(Product2 producter) {
    if (producter.quantity > 1) {
      setState(() {
        producter.quantity--;
      });
    }
  }

  void updateSize(Product2 producter, String size) {
    setState(() {
      producter.selectedSize = size;
    });
  }

  void removeFromCart(Product2 producter) {
    setState(() {
      carts.remove(producter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (_) => buildCartPage(),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: allProducts.length,
        padding: EdgeInsets.all(10),
        itemBuilder: (context, index) {
          final producter = allProducts[index];
          return Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.network(
                        producter.imageUrl,
                        height: 80,
                        width: 80,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              producter.name,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text("₹${producter.price}"),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text("Size: "),
                      SizedBox(width: 5),
                      ChoiceChip(
                        label: Text("200ml", style: TextStyle(fontSize: 12)),
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        selected: producter.selectedSize == "200ml",
                        onSelected: (_) => updateSize(producter, "200ml"),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      SizedBox(width: 8),
                      ChoiceChip(
                        label: Text("500ml", style: TextStyle(fontSize: 12)),
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        selected: producter.selectedSize == "500ml",
                        onSelected: (_) => updateSize(producter, "500ml"),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () => decreaseQuantity(producter),
                      ),
                      Text(
                        '${producter.quantity}',
                        style: TextStyle(fontSize: 16),
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () => increaseQuantity(producter),
                      ),
                      Spacer(),
                      ElevatedButton(
                        onPressed: () => addToCart(producter),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text("Add to Cart"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
  Widget buildCartPage() {
    return Container(
      padding: EdgeInsets.all(16),
      height: 400,
      child: Column(
        children: [
          Row(
            children: [
                IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context); // Dismiss the bottom sheet
                },
              ),        
              ]
          ),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                "Cart",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
                
              
            ],
          ),

        

          Expanded(
            child: carts.isEmpty
                ? Center(child: Text("Cart is empty"))
                : ListView.builder(
                    itemCount: carts.length,
                    itemBuilder: (context, index) {
                      final item = carts[index];
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