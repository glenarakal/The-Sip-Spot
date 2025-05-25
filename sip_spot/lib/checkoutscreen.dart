import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sip_spot/plainjuices.dart';
import 'package:sip_spot/Vegetablejuices.dart';

class CheckoutScreen extends StatefulWidget {
  final List<Product> cart;

  CheckoutScreen({required this.cart});

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  late Razorpay _razorpay;
  String userName = '';

  double getTotalAmount() {
    return widget.cart.fold(
      0,
      (sum, item) => sum + (item.price * item.quantity),
    );
  }

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    await saveOrder(); // Save to Firebase
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Payment Successful! Order saved.")));
    Navigator.pop(context); // Close CheckoutScreen
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Payment Failed. Please try again.")),
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("External wallet selected.")));
  }

  void startPayment() {
    if (userName.trim().isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Please enter your name")));
      return;
    }

    var options = {
      'key': 'https://razorpay.me/@thesipspot', // Replace with your Razorpay Key
      'amount': (getTotalAmount() * 100).toInt(), // In paise
      'name': 'The Sip Spot',
      'description': 'Juice Order Payment',
      'prefill': {'contact': '9123456780', 'email': 'example@gmail.com'},
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> saveOrder() async {
    await FirebaseFirestore.instance.collection('orders').add({
      'userName': userName,
      'items': widget.cart
          .map(
            (item) => {
              'name': item.name,
              'quantity': item.quantity,
              'size': item.selectedSize,
              'price': item.price,
            },
          )
          .toList(),
      'total': getTotalAmount(),
      'timestamp': Timestamp.now(),
    });
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Checkout")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Enter your name"),
              onChanged: (value) {
                setState(() {
                  userName = value;
                });
              },
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: widget.cart.length,
                itemBuilder: (context, index) {
                  final item = widget.cart[index];
                  return ListTile(
                    leading: Image.network(
                      item.imageUrl,
                      width: 50,
                      height: 50,
                    ),
                    title: Text(item.name),
                    subtitle: Text(
                      "${item.selectedSize}, Qty: ${item.quantity}",
                    ),
                    trailing: Text("₹${item.price * item.quantity}"),
                  );
                },
              ),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "₹${getTotalAmount()}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              icon: Icon(Icons.payment),
              label: Text("Pay with Razorpay"),
              onPressed: startPayment,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
