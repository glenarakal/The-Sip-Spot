import 'package:flutter/material.dart';
import 'package:sip_spot/checkoutscreen.dart';

class Products {
  final String name;
  final String imageUrl;
  final int price;
  int quantity;
  String selectedSize;

  Products({
    required this.name,
    required this.imageUrl,
    required this.price,
    this.quantity = 1,
    this.selectedSize = "200ml",
  });

  int get totalPrice => price * quantity;
}

class Mixjuices extends StatefulWidget {
  @override
  _JuiceOrderPageState createState() => _JuiceOrderPageState();
}

class _JuiceOrderPageState extends State<Mixjuices> {
  List<Products> allProducts = [
    Products(
      name: "Mango juice",
      imageUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSM19D4ys3BnojgW3K2bwW_UXPv6CGccEPcVw&s",
      price: 70,
    ),
    Products(
      name: "Orange Juice",
      imageUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSayX_2LO37O_TH446RBHh_dDMQ7KqbvuFLWw&s",
      price: 49,
    ),
    Products(
      name: "Guava Juice",
      imageUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyQxQhHWAHqapNLoOUlv3yjaYgdiLCIxxzBw&s",
      price: 69,
    ),

    Products(
      name: "Avocado Juice",
      imageUrl:
          "https://californiaavocado.com/wp-content/uploads/2020/08/Avocado-Milkshake-1-1.jpg",
      price: 89,
    ),
  ];

  List<Products> cart1 = [];

  void addToCart(Products product) {
    setState(() {
      
      cart1.add(
        Products(
          name: product.name,
          imageUrl: product.imageUrl,
          price: product.price,
          quantity: product.quantity,
          selectedSize: product.selectedSize,
        ),
      );
    });
  }

  void increaseQuantity(Products product) {
    setState(() {
      product.quantity=1;
    });
  }

  void decreaseQuantity(Products product) {
    if (product.quantity > 1) {
      setState(() {
        product.quantity--;
      });
    }
  }

  void updateSize(Products product, String size) {
    setState(() {
      product.selectedSize = size;
    });
  }

  void removeFromCart(Products product) {
    setState(() {
      cart1.remove(product);
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
          final product = allProducts[index];
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
                        product.imageUrl,
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
                              product.name,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text("₹${product.price}"),
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
                        selected: product.selectedSize == "200ml",
                        onSelected: (_) => updateSize(product, "200ml"),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      SizedBox(width: 8),
                      ChoiceChip(
                        label: Text("500ml", style: TextStyle(fontSize: 12)),
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        selected: product.selectedSize == "500ml",
                        onSelected: (_) => updateSize(product, "500ml"),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () => decreaseQuantity(product),
                      ),
                      Text(
                        '${product.quantity}',
                        style: TextStyle(fontSize: 16),
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () => increaseQuantity(product),
                      ),
                      Spacer(),
                      ElevatedButton(
                        onPressed: () => addToCart(product),
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
            child: cart1.isEmpty
                ? Center(child: Text("Cart is empty"))
                : ListView.builder(
                    itemCount: cart1.length,
                    itemBuilder: (context, index) {
                      final item = cart1[index];
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
