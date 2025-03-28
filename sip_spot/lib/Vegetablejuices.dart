import 'package:flutter/material.dart';
import 'package:sip_spot/cart.dart';
import 'package:sip_spot/detailoffreserry.dart';

class Product{
  final String name;
  final String imageUrl;
 final int price;
 int quantity;
 String selectedSize;
 
Product({
  required this.name,
  required this.imageUrl,
  required this.price,
  this.quantity =1,
  this.selectedSize = "200ml",
});

int get totalprice => quantity*price;
}

class Vegetablejuices extends StatefulWidget {
  const Vegetablejuices({super.key});

  @override
  State<Vegetablejuices> createState() => _VegetablejuicesState();
}

class _VegetablejuicesState extends State<Vegetablejuices> {

List<Product> products =[
  Product(name: "Carrot Juice",
   imageUrl: "https://cdn.cdnparenting.com/articles/2020/01/24151805/Carrot-Apple-Juice-Recipe.webp",
    price: 49),

      Product(name: "Cucumber Juice",
       imageUrl: "https://www.saltysidedish.com/wp-content/uploads/2024/07/cucumber-juice-recipe.jpg",
        price: 49),

        Product(name: "Broccoli Juice",
         imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTB2qPAMStstzHVsrDMdzX7R0cNaCL0x4TSbw&s",
          price: 59),
          
          Product(name: "Spinach", 
          imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdMkysXRlyefy2DdHK_AYGScTVkhVU7BepQw&s", price: 79)
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
  }}
  void selectSize(Product product, String size){
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
                              "${product.quantity} x ₹${product.price} = ₹${product.totalprice}",
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