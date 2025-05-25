import 'package:audioplayers/audioplayers.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sip_spot/cart.dart';

class Product {
  final String name;
  var details;
  final String imageUrl;
  final int price;
  int quantity;

  Product({
    required this.name,
    required this.details,
    required this.imageUrl,
    required this.price,
    this.quantity = 1,
  });

  int get totalPrice => quantity * price;
}

class Detailoffreserry extends StatefulWidget {
  const Detailoffreserry({super.key});

  @override
  State<Detailoffreserry> createState() => _DetailoffreserryState();
}

class _DetailoffreserryState extends State<Detailoffreserry> {
  int quantity = 1;
  final int price = 79;

  void increment() {
    setState(() {
      quantity++;
    });
  }

  void decrement() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  int get total => quantity * price;
  final player = AudioPlayer();

  final List<Map<String, dynamic>> nutrition = [
    {"name": "Serving Size", "value": "200 mL"},
    {"name": "Calories", "value": "80g"},
    {"name": "Fat", "value": "0.5g", "percentage": "1%"},
    {"name": "Cholesterol", "value": "0mg"},
    {"name": "Sodium", "value": "0mg"},
    {"name": "Carbohydrate", "value": "18g", "percentage": "6%"},
    {"name": "Fiber", "value": "2g"},
    {"name": "Sugars", "value": "2g"},
    {"name": "Protein", "value": "3g"},
    {"name": "Vitamin A", "percentage": "2%"},
    {"name": "Calcium", "percentage": "0%"},
    {"name": "Vitamin C", "percentage": "10%"},
  ];


  final urlImages = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQViXL8q1LVy1uKr7XlNLt8dx8LSRK6ImHFlA&s",
    "https://vaya.in/recipes/wp-content/uploads/2018/05/Coconut-Juice.jpg",
    "https://www.fruits365.shop/cdn/shop/products/coconut-water-feat-1_grande.jpg?v=1636213299",
    "https://cdn2.stylecraze.com/wp-content/uploads/2013/09/Disadvantages-Of-Coconut-Water.jpg.webp",
  ];

  String selectedSize = "200ml";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider.builder(
              itemCount: urlImages.length,
              itemBuilder: (context, index, realindex) {
                final urlimage = urlImages[index];
                return Image.network(urlimage, fit: BoxFit.cover);
              },
              options: CarouselOptions(height: 100),
            ),
            Column(
              children: [
                Center(
                  child: Text("Coconut Juice", style: TextStyle(fontSize: 25)),
                ),
                SizedBox(height: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "size",
                      style: GoogleFonts.roboto(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ChoiceChip(
                          label: Text("200ml", style: TextStyle(fontSize: 10)),
                          selected: selectedSize == "200ml",
                          selectedColor: Colors.blueGrey,
                          shape: StadiumBorder(
                            side: BorderSide(
                              color: selectedSize == "200ml"
                                  ? Colors.blue
                                  : Colors.cyanAccent,
                            ),
                          ),

                          onSelected: (selected) {
                            setState(() {
                              selectedSize = "200ml";
                            });
                          },
                        ),
                        SizedBox(width: 20),

                        ChoiceChip(
                          label: Text("500ml", style: TextStyle(fontSize: 10)),
                          selected: selectedSize == "500ml",

                          selectedColor: Colors.orange,
                          shape: StadiumBorder(
                            side: BorderSide(
                              color: selectedSize == "500ml"
                                  ? Colors.deepPurpleAccent
                                  : Colors.pinkAccent,
                            ),
                          ),
                          onSelected: (selected) {
                            setState(() {
                              selectedSize = "500ml";
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 10),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(),
                          child: Text(
                            "Description\n",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                       
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Text(
                            '''
Grape juice is obtained from crushing and blending grapes into a liquid.
In the wine industry, grape juice that contains 7–23 percent of pulp, skins, stems and seeds is often referred.
The sugars in grape juice allow it to be used as a sweetener, and fermented and made into wine, brandy, or vinegar.
''',
                            textScaleFactor: 0.9,
                            textAlign: TextAlign.justify,
                            softWrap: true,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ],
                    ),

                    //  NUTRITION FACTS
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Nutrition Facts",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Divider(thickness: 1),
                              ListView.separated(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: nutrition.length,
                                separatorBuilder: (context, index) =>
                                    const Divider(color: Colors.grey),
                                itemBuilder: (context, index) {
                                  final item = nutrition[index];
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 4.0,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.circle_outlined,
                                              size: 12,
                                              color: Colors.red,
                                            ),
                                            const SizedBox(width: 8),
                                            Text(
                                              item["name"],
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            if (item.containsKey("value"))
                                              Text(
                                                item["value"],
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            if (item.containsKey("percentage"))
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 8.0,
                                                ),
                                                child: Text(
                                                  item["percentage"],
                                                  style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> playSound() async {
    String audioPath = "sounds/menus.mp3";
    await player.play(AssetSource(audioPath));
  }

  void addToCart(Product product, int quantity) {
    print('Added to Cart : ${product.name}*$quantity');
  }
}
