import 'package:flutter/material.dart';

class Faq extends StatefulWidget {
  const Faq({super.key});

  @override
  State<Faq> createState() => _FaqState();
}

class _FaqState extends State<Faq> {

    final List<Map<String, String>> faqs = [
    {
      "question": "How do I place an order?",
      "answer": "You can place an order through our app by selecting your favorite juice and adding it to the cart.",
      "image": "assets/images/order.jpeg"
    },
    {
      "question": "What payment methods do you accept?",
      "answer": "We accept credit/debit cards, UPI, and digital wallets.",
      "image": "assets/images/order.jpeg"
    },
    {
      "question": "Can I track my order?",
      "answer": "Yes! You can track your order in real-time from the 'My Orders' section.",
      "image": "assets/images/order.jpeg"
    },
    {
      "question": "What is the delivery time?",
      "answer": "Delivery usually takes 30-45 minutes, depending on your location.",
      "image" : "assets/images/order.jpeg"
      
    },
    {
      "question": "Do you offer refunds?",
      "answer": "Yes, refunds are processed in case of incorrect or missing items. Please contact support.",
      "image": "assets/images/order.jpeg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold( backgroundColor: Color.fromARGB(174, 8, 56, 200),
         appBar: AppBar(
        title: Text('Frequently Asked Questions',
        style: TextStyle(color: Color.fromARGB(255, 246, 247, 249)),),
        backgroundColor: Color.fromARGB(174, 8, 56, 200),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: faqs.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 3,
              margin: EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ExpansionTile(
                leading: Image.asset(
                  faqs[index]["image"]!,
                  width: 40,
                  height: 40,
                ),
                title: Text(
                  faqs[index]["question"]!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      faqs[index]["answer"]!,
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}