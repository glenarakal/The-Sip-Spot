import 'package:flutter/material.dart';

class Address extends StatefulWidget {
  const Address({super.key});

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {

  bool isDefault = false;
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Address"),
        actions: [
          IconButton(onPressed: (){
             Navigator.pop(context);
          },
           icon: Icon(Icons.close,size:40 ,color: Colors.grey,))
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTextField("Address Name", "Office"),
            buildTextField("First Name", "Glen"),
            buildTextField("Last Name", "Arakal"),
            buildTextField("Mobile", "+91 97 1234 5678"),
            buildTextField("City", "Alleppey"),
            buildTextField("House/Flat No", "7D 159"),
            buildTextField("Residential Complex", "Abcdef"),
            buildTextField("Area", "Abcdef"),
            buildTextField("PinCode", "6912345"),
            buildTextField("Street Name", "The boundryline"),
            buildTextField("Landmarks", "Opposite KFC"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Make it Default", style: TextStyle(fontSize: 16)),
                Switch(
                  value: isDefault,
                  onChanged: (value) {
                    setState(() {
                      isDefault = value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle Update action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                    child: Text("Update"),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      // Handle Cancel action
                    },
                    child: Text("Cancel"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, String initialValue) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: TextFormField(
        initialValue: initialValue,
        decoration: InputDecoration(
          labelText: label,
          
        ),
      ),
    );
      
    
  }
}