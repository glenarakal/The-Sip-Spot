import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

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
    this.selectedSize = "250ml",
  });

  int get totalPrice => quantity * price;
}

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  String dropdownValue = 'Morning';
  var items = ['Morning', 'Afternoon', 'Evening', 'Night', 'Mid-Night'];

  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  Future<void> _selectDate(
    BuildContext context,
    TextEditingController controller,
  ) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        controller.text = DateFormat('dd MMMM yyyy').format(picked);
      });
    }
  }

  final List<String> days = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"];
  final List<bool> selectedDays = [true, false, false, true, true, false, true];

  List<Product> products = [
    Product(
      name: "Coconut Juice",
      imageUrl: "https://m.media-amazon.com/images/I/51U6cpbp1iL.jpg",
      price: 70,
    ),
    Product(
      name: "Carrot Juice",
      imageUrl:
          "https://cdn.cdnparenting.com/articles/2020/01/24151805/Carrot-Apple-Juice-Recipe.webp",
      price: 49,
    ),

    Product(
      name: "WaterMelon",
      imageUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxH8UbUDZ86i-uGrAKgUSqzlock9reeBEVpQ&s",
      price: 59,
    ),
  ];

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

  void selectSize(Product product, String size) {
    setState(() {
      product.selectedSize = size;
    });
  }

  String dropdownvalue = 'Morning';
  var itemss = ['Morning', 'Afternoon', 'Evening', 'Night', 'Mid-Night'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "CART",
          style: GoogleFonts.lusitana(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 3,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.pinkAccent, Colors.deepOrange],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 400,
              width: double.infinity, // Fixed height for ListView
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: products.length,
                itemBuilder: (BuildContext context, index) {
                  final product = products[index];
                  return SizedBox(
                    width: double.infinity,
                    child: Card(
                      color: const Color.fromARGB(255, 252, 251, 250),
                      elevation: 3,
                      margin: EdgeInsets.only(bottom: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          children: [
                            // Popup Menu Fix - Keep it aligned to the top right

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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product.name,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      Text(
                                        "${product.quantity} x ₹${product.price} = ₹${product.totalPrice}",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                    

                                      // Size Selection and Subscription Toggle Fix
                                      Wrap(
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        spacing:
                                            10, // Add spacing between elements
                                        children: [
                                          Text(
                                            "Size: ",
                                            style: TextStyle(fontSize: 14),
                                          ),
                                          ChoiceChip(
                                            label: Text("200ml"),
                                            selected:
                                                product.selectedSize == "200ml",
                                            onSelected:
                                                (selected) => selectSize(
                                                  product,
                                                  "200ml",
                                                ),
                                          ),
                                          Container(
                                            height: 30,
                                            width: 130,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Color(0xFF04EE20),
                                                  Color(0xFF40FF93),
                                                ],
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(60),
                                            ),
                                            child: TextButton(
                                              onPressed: () {},
                                              child: Text(
                                                'Start Subscription',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                            Text(
                                            "${product.quantity} x ₹${product.price} = ₹${product.totalPrice}",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          

                                          // FlutterSwitch and Subscribe Text Fix
                                        ],
                                      ),

                                      Row(
                                        children: [
                                          IconButton(
                                  onPressed: () => decreaseQuantity(product),
                                  icon: Icon(Icons.remove, size: 20),
                                ),
                                IconButton(
                                  onPressed: () => increaseQuantity(product),
                                  icon: Icon(Icons.add, size: 20),
                                ),
                                        ],
                                      ),


                                      SizedBox(height: 8),
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
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: startDateController,
                    readOnly: true,
                    decoration: InputDecoration(
                      helperText: "Start Date",
                      suffixIcon: Icon(Icons.calendar_today),
                      border: OutlineInputBorder(),
                    ),
                    onTap: () => _selectDate(context, startDateController),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: endDateController,
                    readOnly: true,
                    decoration: InputDecoration(
                      helperText: "End Date",
                      suffixIcon: Icon(Icons.calendar_today),
                      border: OutlineInputBorder(),
                    ),
                    onTap: () => _selectDate(context, endDateController),
                  ),

                  SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Day of Week",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(days.length, (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedDays[index] = !selectedDays[index];
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color:
                                    selectedDays[index]
                                        ? Colors.green
                                        : Colors.grey[300],
                              ),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.check,
                                    color:
                                        selectedDays[index]
                                            ? Colors.white
                                            : Colors.grey,
                                    size: 18,
                                  ),
                                  Text(
                                    days[index],
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          selectedDays[index]
                                              ? Colors.white
                                              : Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment
                                .spaceBetween, // Distributes space effectively
                        children: [
                          Text(
                            'Delivery Slot →',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          DropdownButton<String>(
                            value: dropdownvalue,
                            dropdownColor: Colors.white,
                            style: TextStyle(color: Colors.green, fontSize: 16),
                            underline: Container(
                              height: 2,
                              color: Colors.green,
                            ), // Stylish underline
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: Colors.green,
                            ),
                            items:
                                items.map((String item) {
                                  return DropdownMenuItem(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: TextStyle(color: Colors.green),
                                    ),
                                  );
                                }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue = newValue!;
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Total Amount\n15 times * 1 item = ₹79",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),

                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Shipping address",
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        SizedBox(height: 8),
                        Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Sajin Philip",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Address line 1",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "Change",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Coupon Code",
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        SizedBox(height: 8),

                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Enter coupon code",
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 14,
                                ),
                              ),
                              child: Text("ACTIVATE"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Column(
                    children: [
                      _buildBillRow("Bill Total:", "₹2580"),
                      _buildBillRow("Discount:", "₹-580"),
                      Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ), // Adds a separator line
                      _buildBillRow("Grand Total:", "₹2000", isBold: true),
                    ],
                  ),
                  Container(
                    height: 30,
                    width: 125,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.red, Colors.redAccent],
                      ),
                    ),

                    child: Center(
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "PAY NOW",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBillRow(String label, String amount, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color:
                  isBold ? Colors.green : Colors.black, // Highlight Grand Total
            ),
          ),
        ],
      ),
    );
  }
}
