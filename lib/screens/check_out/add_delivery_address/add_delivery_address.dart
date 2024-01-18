import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waste_management_and_recycle_application/providers/checkout_provider.dart';
import 'package:waste_management_and_recycle_application/screens/check_out/google_map/google_map.dart';
import 'package:waste_management_and_recycle_application/widgets/custom_text.dart';

class AddDeliveryAddress extends StatefulWidget {
  @override
  State<AddDeliveryAddress> createState() => _AddDeliveryAddressState();
}

enum addressType {
  Home,
  Work,
}

class _AddDeliveryAddressState extends State<AddDeliveryAddress> {
  var myType = addressType.Home;
  @override
  Widget build(BuildContext context) {
    CheckOutProvider checkOutProvider = Provider.of(context);
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
        child: checkOutProvider.isloading == false
            ? MaterialButton(
                onPressed: () {
                  checkOutProvider.validator(context, myType);
                },
                child: Text(
                  'Add Address',
                  style: TextStyle(color: Colors.black),
                ),
                color: Color.fromARGB(255, 86, 161, 71),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            CustomTextField(
                controller: checkOutProvider.firstName,
                keyboardType: TextInputType.name,
                labText: 'Frist Name'),
            CustomTextField(
                controller: checkOutProvider.lastName,
                keyboardType: TextInputType.name,
                labText: 'Last Name'),
            CustomTextField(
                controller: checkOutProvider.mobileNo,
                keyboardType: TextInputType.phone,
                labText: 'Mobile No'),
            CustomTextField(
                controller: checkOutProvider.alternateMobileNo,
                keyboardType: TextInputType.phone,
                labText: 'Alternate Mobile No'),
            CustomTextField(
                controller: checkOutProvider.email,
                keyboardType: TextInputType.emailAddress,
                labText: 'Email'),
            CustomTextField(
                controller: checkOutProvider.division,
                keyboardType: TextInputType.name,
                labText: 'Division'),
            CustomTextField(
                controller: checkOutProvider.district,
                keyboardType: TextInputType.name,
                labText: 'District'),
            CustomTextField(
                controller: checkOutProvider.union,
                keyboardType: TextInputType.name,
                labText: 'Union'),
            CustomTextField(
                controller: checkOutProvider.village,
                keyboardType: TextInputType.name,
                labText: 'Village'),
            CustomTextField(
                controller: checkOutProvider.postCode,
                keyboardType: TextInputType.number,
                labText: 'Post code'),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CustomGoogleMap()),
                );
              },
              child: Container(
                height: 47,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    checkOutProvider.setLocation == null
                        ? Text('Set current Loaction')
                        : Text('Location setup completed'),
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
                value: addressType.Home,
                groupValue: myType,
                onChanged: (value) {
                  setState(() {
                    myType = value!;
                  });
                }),
            RadioListTile(
                title: Text('Office'),
                secondary: Icon(
                  Icons.work,
                  color: Color.fromARGB(255, 86, 161, 71),
                ),
                value: addressType.Work,
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
