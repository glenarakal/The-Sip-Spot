import 'package:flutter/material.dart';
import 'package:sip_spot/cart.dart';
import 'package:sip_spot/detailoffreserry.dart';
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

  int get totalPrice => quantity*price;
}
class Mixjuices extends StatefulWidget {
  const Mixjuices({super.key});

  @override
  State<Mixjuices> createState() => _MixjuicesState();
}

class _MixjuicesState extends State<Mixjuices> {
List<Product> products =[
  Product(name: "Mango Juice",
   imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSM19D4ys3BnojgW3K2bwW_UXPv6CGccEPcVw&s",
    price: 69),
    

     Product(name: "Orange Juice",
      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSayX_2LO37O_TH446RBHh_dDMQ7KqbvuFLWw&s",
       price: 69),

       Product(name: "Guava Juice",
        imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyQxQhHWAHqapNLoOUlv3yjaYgdiLCIxxzBw&s",
         price: 69),

         Product(name: "Avocado Juice",
          imageUrl:"https://californiaavocado.com/wp-content/uploads/2020/08/Avocado-Milkshake-1-1.jpg",
        price: 89) 
];

void increaseQuantity(Product product){
  setState(() {
    product.quantity++;
  });
}
void decreaseQuantity(Product product){
  if(product.quantity>1){
    setState(() {
      product.quantity--;
    });
  }
}
  void selectSize(Product product,String size){
    setState(() {
      product.selectedSize = size;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            elevation: 3,
            margin: EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Detailoffreserry()));
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            product.imageUrl,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "${product.quantity} x ₹${product.price} = ₹${product.totalPrice}",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey[700]),
                            ),
                            SizedBox(height: 8),
                            Row(mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("Size: ", style: TextStyle(fontSize: 14)),
                                SizedBox(width: 4),
                                ChoiceChip(
                                  label: Text("200ml"),
                                  selected: product.selectedSize == "200ml",
                                  onSelected: (selected) =>
                                      selectSize(product, "200ml"),
                                ),
                                
                                ChoiceChip(
                                  label: Text("500ml"),
                                  selected: product.selectedSize == "500ml",
                                  onSelected: (selected) =>
                                      selectSize(product, "500ml"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove, color: Colors.black),
                            onPressed: () => decreaseQuantity(product),
                          ),
                          Text(
                            '${product.quantity}',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            icon: Icon(Icons.add, color: Colors.black),
                            onPressed: () => increaseQuantity(product),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Cart()));
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          backgroundColor: Colors.redAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child:
                            Text("ADD TO CART", style: TextStyle(color: Colors.white)),
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
}