import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Walletbalance extends StatefulWidget {
  const Walletbalance({super.key});

  @override
  State<Walletbalance> createState() => _OrderState();
}

class _OrderState extends State<Walletbalance> {
  final List<String> paymentmodes = [
    'Wallet (Balance :₹580)',
    "Net Banking",
    "Card Payment",
    "Cash On Delivery",
  ];
  final List<IconData> paymentIcons = [
    Icons.account_balance_wallet_outlined,
    Icons.mouse,
    Icons.credit_card,
    Icons.money,
  ];
  int selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "WALLET",
          style: GoogleFonts.lusitana(fontWeight: FontWeight.bold),
        ),
        titleTextStyle: TextStyle(color: Colors.white),
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

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.menu),
        ),

        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.calendar_today, color: Colors.black87),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications, color: Colors.black87),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_bag_sharp)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: paymentmodes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(
                    paymentIcons[index],
                    color: const Color.fromARGB(255, 10, 10, 9),
                  ),

                  title: Text(paymentmodes[index]),
                  tileColor:
                      selectedindex == index
                          ? const Color.fromARGB(255, 242, 244, 242)
                          : const Color.fromARGB(255, 227, 225, 225),
                  onTap: () {
                    selectedindex = index;
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Proceeding with ${paymentmodes[selectedindex]}',
                    ),
                  ),
                );
              },
              child: Container(
                height: 100,
                width: 200,
                padding: EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color.fromARGB(197, 253, 4, 4),
                      const Color.fromARGB(255, 234, 9, 121),
                      const Color.fromARGB(255, 231, 2, 2),
                    ],
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  "PROCEED TO PAY",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
