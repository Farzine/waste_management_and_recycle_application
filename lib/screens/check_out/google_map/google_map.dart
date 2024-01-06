import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:waste_management_and_recycle_application/providers/checkout_provider.dart';

class CustomGoogleMap extends StatefulWidget {
  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  LatLng _initialcameraposition = LatLng(23.6850, 90.3563);

  late GoogleMapController controller;
  Location _location = Location();
  void _onMapCreated(GoogleMapController _value) {
    controller = _value;
    _location.onLocationChanged.listen((event) {
      if (event.latitude != null && event.longitude != null) {
        controller.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(event.latitude!, event.longitude!),
            zoom: 15,
          ),
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    CheckOutProvider checkOutProvider = Provider.of(context);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 165, 248, 165),
      // appBar: AppBar(
      //   backgroundColor: Color.fromARGB(255, 86, 161, 71),
      //   title: Text(
      //     'Set location',
      //     style: TextStyle(
      //         color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
      //   ),
      //   iconTheme: IconThemeData(
      //     color: Colors.black,
      //   ),
      // ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: _initialcameraposition,
                ),
                mapType: MapType.normal,
                onMapCreated: _onMapCreated,
                myLocationEnabled: true,
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 50,
                  width: double.infinity,
                  margin:
                      EdgeInsets.only(right: 60, left: 10, bottom: 40, top: 40),
                  child: MaterialButton(
                    onPressed: () async {
                      await _location.getLocation().then((value) {
                        setState(() {
                          checkOutProvider.setLocation = value;
                        });
                      });
                      Navigator.of(context).pop();
                    },
                    color: Color.fromARGB(255, 86, 161, 71),
                    child: Text('Set location'),
                    shape: StadiumBorder(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
