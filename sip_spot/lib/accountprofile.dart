import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sip_spot/FAQ.dart';
import 'package:sip_spot/address.dart';
import 'package:sip_spot/cart.dart';
import 'package:sip_spot/fressery.dart';
import 'package:sip_spot/map.dart';
import 'package:sip_spot/notification.dart';
import 'package:sip_spot/profile.dart';
import 'package:sip_spot/subscription.dart';
import 'package:sip_spot/wallet.dart';
import 'package:sip_spot/walletbalance.dart';

class Accountprofile extends StatefulWidget {
  const Accountprofile({super.key});

  @override
  State<Accountprofile> createState() => _AccountprofileState();
}

class _AccountprofileState extends State<Accountprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "PROFILE",
          style: GoogleFonts.lusitana(fontWeight: FontWeight.bold),
        ),
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Accountprofile()),
            );
          },
          icon: Icon(Icons.menu),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  GestureDetector(
                    onTap:
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Profile()),
                        ),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.transparent,
                      child: ClipOval(
                        child: Image.network(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOn0Sb56dFRThzFygT9vO0mpANLcOfuiNXbA&s",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Glen Arakal\n',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: 'Wallet balance: ₹45,15,54458/-',
                          style: TextStyle(fontSize: 10, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(thickness: 2.0, color: Colors.black, height: 20),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Fressery()),
                    );
                  },
                  child: MenuItem(icon: Icons.home, text: "Shop"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MapScreen()),
                    );
                  },
                  child: MenuItem(
                    icon: Icons.notifications,
                    text: "Outlet Address",
                  ),
                ),

                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Order()),
                    );
                  },
                  child: MenuItemWithBadge(
                    icon: Icons.shopping_bag,
                    text: "My Order",
                    badgeText: "12",
                  ),
                ),

                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Wallet()),
                    );
                  },
                  child: MenuItemWithBadge(
                    icon: Icons.account_balance_wallet,
                    text: "My Wallet",
                    badgeText: "₹45,15,54458/-",
                  ),
                ),

                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Walletbalance()),
                    );
                  },
                  child: MenuItem(icon: Icons.person, text: "My Account"),
                ),

                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Order()),
                    );
                  },
                  child: MenuItem(
                    icon: Icons.subscriptions,
                    text: "My Subscription",
                  ),
                ),

                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Notification1()),
                    );
                  },
                  child: MenuItem(
                    icon: Icons.notifications,
                    text: "Notification",
                  ),
                ),

                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Address()),
                    );
                  },
                  child: MenuItem(
                    icon: Icons.location_on,
                    text: "Address Modification",
                  ),
                ),

                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Faq()),
                    );
                  },
                  child: MenuItem(
                    icon: Icons.chat_bubble_outline,
                    text: "FAQ's",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const MenuItem({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(text, style: TextStyle(fontSize: 16, color: Colors.black)),
    );
  }
}

class MenuItemWithBadge extends StatelessWidget {
  final IconData icon;
  final String text;
  final String badgeText;

  const MenuItemWithBadge({
    super.key,
    required this.icon,
    required this.text,
    required this.badgeText,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.black87),
      title: Row(
        children: [
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: badgeText.contains('₹') ? Colors.transparent : Colors.red,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.red),
            ),
            child: Text(
              badgeText,
              style: TextStyle(
                color: badgeText.contains('₹') ? Colors.black87 : Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
