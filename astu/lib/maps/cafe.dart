// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, sized_box_for_whitespace

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Cafe extends StatelessWidget {
  static String id = 'Cafe';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20))),
            width: MediaQuery.of(context)
                .size
                .width, // Set container width to screen width
            height: MediaQuery.of(context).size.height *
                0.5, // Set container height to half of screen height
            child: MapSample(),
          ),
          SizedBox(
            height: 30,
          ),
          Row(children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Cafe",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            )
          ]),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  height: 200,
                  width: 300,
                  decoration: BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage('images/amphy.jpg')),
                    // Half of the height/width
                  ),
                ),
              )
            ],
          ),
          Row(children: [
            Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Open for 24 hour ",
                  style: TextStyle(fontSize: 20),
                )),
          ]),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "BLOCK 107",
                  style: TextStyle(fontSize: 20),
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}

class MapSample extends StatefulWidget {
  @override
  _MapSampleState createState() => _MapSampleState();
}

class _MapSampleState extends State<MapSample> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(8.564522983218845, 39.2917457113612440);

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 16.0,
      ),
    );
  }
}
