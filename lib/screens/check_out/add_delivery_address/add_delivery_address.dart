import 'package:flutter/material.dart';
import 'package:waste_management_and_recycle_application/widgets/custom_text.dart';

class AddDeliveryAddress extends StatefulWidget {
  @override
  State<AddDeliveryAddress> createState() => _AddDeliveryAddressState();
}

enum AddressType {
  Home,
  Work,
}

class _AddDeliveryAddressState extends State<AddDeliveryAddress> {
  var myType = AddressType.Home;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 165, 248, 165),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 86, 161, 71),
        title: Text(
          'Add new delivery address',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        height: 48,
        child: MaterialButton(
          onPressed: () {},
          child: Text(
            'Add Address',
            style: TextStyle(color: Colors.black),
          ),
          color: Color.fromARGB(255, 86, 161, 71),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            CustomTextField(
                controller: TextEditingController(),
                keyboardType: TextInputType.name,
                labText: 'Frist Name'),
            CustomTextField(
                controller: TextEditingController(),
                keyboardType: TextInputType.name,
                labText: 'Last Name'),
            CustomTextField(
                controller: TextEditingController(),
                keyboardType: TextInputType.datetime,
                labText: 'Date of birth'),
            CustomTextField(
                controller: TextEditingController(),
                keyboardType: TextInputType.name,
                labText: 'Gender'),
            CustomTextField(
                controller: TextEditingController(),
                keyboardType: TextInputType.phone,
                labText: 'Mobile No'),
            CustomTextField(
                controller: TextEditingController(),
                keyboardType: TextInputType.emailAddress,
                labText: 'Email'),
            CustomTextField(
                controller: TextEditingController(),
                keyboardType: TextInputType.name,
                labText: 'Division'),
            CustomTextField(
                controller: TextEditingController(),
                keyboardType: TextInputType.name,
                labText: 'District'),
            CustomTextField(
                controller: TextEditingController(),
                keyboardType: TextInputType.name,
                labText: 'Union'),
            CustomTextField(
                controller: TextEditingController(),
                keyboardType: TextInputType.name,
                labText: 'Village'),
            CustomTextField(
                controller: TextEditingController(),
                keyboardType: TextInputType.number,
                labText: 'Post code'),
            InkWell(
              onTap: () {},
              child: Container(
                height: 47,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Set current Loaction'),
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.black45,
            ),
            ListTile(
              title: Text('Address Type*'),
            ),
            RadioListTile(
                title: Text('Home'),
                secondary: Icon(
                  Icons.home,
                  color: Color.fromARGB(255, 86, 161, 71),
                ),
                value: AddressType.Home,
                groupValue: myType,
                onChanged: (value) {
                  setState(() {
                    myType = value!;
                  });
                }),
            RadioListTile(
                title: Text('Work'),
                secondary: Icon(
                  Icons.work,
                  color: Color.fromARGB(255, 86, 161, 71),
                ),
                value: AddressType.Work,
                groupValue: myType,
                onChanged: (value) {
                  setState(() {
                    myType = value!;
                  });
                }),
          ],
        ),
      ),
    );
  }
}
