import 'package:flutter/material.dart';
import 'package:sip_spot/detailoffreserry.dart';
import 'package:sip_spot/checkoutscreen.dart';


class Plainjuices extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Juice Ordering App',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: JuiceOrderPage(),
    );
  }
}

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

class JuiceOrderPage extends StatefulWidget {
  @override
  _JuiceOrderPageState createState() => _JuiceOrderPageState();
}

class _JuiceOrderPageState extends State<JuiceOrderPage> {
  List<Product> allProducts = [
    Product(
      name: "Coconut Juice",
      imageUrl:
          "https://static.vecteezy.com/system/resources/previews/020/113/475/non_2x/fresh-coconut-drinking-juice-free-photo.jpg",
      price: 70,
    ),
    Product(
      name: "Carrot Juice",
      imageUrl:
          "https://cdn.cdnparenting.com/articles/2020/01/24151805/Carrot-Apple-Juice-Recipe.webp",
      price: 49,
    ),
    Product(
      name: "Guava Juice",
      imageUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfDkQe73uGqj8pr9rwYukFuFvIqOzU6dUZ8g&s",
      price: 69,
    ),

    Product(
      name: "Guava Juice",
      imageUrl:
          "https://images.pexels.com/photos/5945909/pexels-photo-5945909.jpeg",
      price: 69,
    ),
    Product(
      name: "Mango Smoothie",
      imageUrl:
          "https://images.pexels.com/photos/5945907/pexels-photo-5945907.jpeg",
      price: 89,
    ),
    Product(
      name: "Watermelon Juice",
      imageUrl:
          "https://images.pexels.com/photos/5945905/pexels-photo-5945905.jpeg",
      price: 59,
    ),
    Product(
      name: "Pineapple Juice",
      imageUrl:
          "https://images.pexels.com/photos/5945904/pexels-photo-5945904.jpeg",
      price: 65,
    ),
    Product(
      name: "Strawberry Delight",
      imageUrl:
          "https://images.pexels.com/photos/5945903/pexels-photo-5945903.jpeg",
      price: 99,
    ),
    Product(
      name: "Orange Juice",
      imageUrl:
          "https://images.pexels.com/photos/5945902/pexels-photo-5945902.jpeg",
      price: 70,
    ),
    Product(
      name: "Apple Juice",
      imageUrl:
          "https://images.pexels.com/photos/5945901/pexels-photo-5945901.jpeg",
      price: 75,
    ),
    Product(
      name: "Pomegranate Juice",
      imageUrl:
          "https://images.pexels.com/photos/5945900/pexels-photo-5945900.jpeg",
      price: 95,
    ),
    Product(
      name: "Kiwi Punch",
      imageUrl:
          "https://images.pexels.com/photos/5945899/pexels-photo-5945899.jpeg",
      price: 85,
    ),
    Product(
      name: "Lemon Mint Cooler",
      imageUrl:
          "https://images.pexels.com/photos/5945898/pexels-photo-5945898.jpeg",
      price: 60,
    ),
    Product(
      name: "Mixed Fruit Juice",
      imageUrl:
          "https://images.pexels.com/photos/5945897/pexels-photo-5945897.jpeg",
      price: 90,
    ),
    Product(
      name: "Banana Milkshake",
      imageUrl:
          "https://images.pexels.com/photos/5945896/pexels-photo-5945896.jpeg",
      price: 79,
    ),
    Product(
      name: "Chikoo Shake",
      imageUrl:
          "https://images.pexels.com/photos/5945895/pexels-photo-5945895.jpeg",
      price: 88,
    ),
    Product(
      name: "Blueberry Smoothie",
      imageUrl:
          "https://images.pexels.com/photos/5945894/pexels-photo-5945894.jpeg",
      price: 105,
    ),
    Product(
      name: "Tender Coconut Juice",
      imageUrl:
          "https://images.pexels.com/photos/5945893/pexels-photo-5945893.jpeg",
      price: 72,
    ),
  ];

  List<Product> cart = [];

  void addToCart(Product product) {
    setState(() {
      cart.add(
        Product(
          name: product.name,
          imageUrl: product.imageUrl,
          price: product.price,
          quantity: product.quantity,
          selectedSize: product.selectedSize,
        ),
      );
    });
      ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("${product.name} added to cart")));
  }

  void increaseQuantity(Product product) {
    setState(() {
      product.quantity++;
    });
  }

  void decreaseQuantity(Product product) {
    if (product.quantity > 1) {
      setState(() {
        product.quantity--;
      });
    }
  }

  void updateSize(Product product, String size) {
    setState(() {
      product.selectedSize = size;
    });
  }

  void removeFromCart(Product product) {
    setState(() {
      cart.remove(product);
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isDismissible: false,
                enableDrag: false,
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
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Detailoffreserry(),
                            ),
                          );
                        },
                        child: Image.network(
                          product.imageUrl,
                          height: 80,
                          width: 80,
                          fit: BoxFit.cover,
                        ),
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
      height: 500,
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context); // Close the cart
                },
              ),
              Spacer(),
              Text(
                "Cart",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Spacer(),
            ],
          ),
          Divider(),
          Expanded(
            child: cart.isEmpty
                ? Center(child: Text("Your cart is empty"))
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
          if (cart.isNotEmpty) ...[
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "₹${cart.fold(0, (sum, item) => sum + item.totalPrice)}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              icon: Icon(Icons.payment),
              label: Text("Proceed to Checkout"),
              onPressed: () {
                Navigator.pop(context); // Close the cart
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CheckoutScreen(cart: cart),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
            ),
          ],
        ],
      ),
    );
  }
}













//   Widget buildCartPage() {
//     return Container(
//       padding: EdgeInsets.all(16),
//       height: 400,
//       child: Column(
//         children: [
//           Row(
//             children: [
//                 IconButton(
//                 icon: Icon(Icons.close),
//                 onPressed: () {
//                   Navigator.pop(context); // Dismiss the bottom sheet
//                 },
//               ),        
//               ]
//           ),
//               Row(mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                 "Cart",
//                 style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//               ),
                
              
//             ],
//           ),

        

//           Expanded(
//             child: cart.isEmpty
//                 ? Center(child: Text("Cart is empty"))
//                 : ListView.builder(
//                     itemCount: cart.length,
//                     itemBuilder: (context, index) {
//                       final item = cart[index];
//                       return ListTile(
//                         leading: Image.network(
//                           item.imageUrl,
//                           width: 50,
//                           height: 50,
//                           fit: BoxFit.cover,
//                         ),
//                         title: Text(item.name),
//                         subtitle: Text(
//                           "${item.selectedSize}, Qty: ${item.quantity}\nTotal: ₹${item.totalPrice}",
//                         ),
//                         trailing: IconButton(
//                           icon: Icon(Icons.delete),
//                           onPressed: () => removeFromCart(item),
//                         ),
                        
//                       );
                      
//                     },
//                   ),
                  
//           ),
//         ],
//       ),
//     );
//   }
// }
