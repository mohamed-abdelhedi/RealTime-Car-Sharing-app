import 'dart:async';
import 'package:flutter_application_1/Assistants/AssistantMethods.dart';
import 'package:flutter_application_1/DataHandler/appData.dart';
import 'package:flutter_application_1/Models/placePredictions.dart';
import 'package:flutter_application_1/allscreens/passengerapp/pickdrop3.dart';
import 'package:flutter_application_1/allscreens/passengerapp/confmap1.dart';
import 'package:flutter_application_1/allscreens/passengerapp/progress.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import 'package:flutter_application_1/Models/directionDetails.dart';

import '../../DataHandler/keys.dart';
import '../riderapp/timedate5.dart';

class pickdrop2 extends StatefulWidget {
  static const String idScreen = "pickdrop2";
  static List<PlacePredictions> placePredictionList = [];

  const pickdrop2({super.key});
  @override
  _pickdrop2State createState() => _pickdrop2State();
}

class _pickdrop2State extends State<pickdrop2> {
  TextEditingController textController1 = TextEditingController();
  TextEditingController textController2 = TextEditingController();
  final Completer<GoogleMapController> _controllerGoogleMap = Completer();
  late GoogleMapController newGoogleMapController;

  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  late DirectionDetails tripDirectionDetails;
  List<LatLng> pLineCoordinates = [];
  Set<Polyline> polylineSet = {};
  late Position currentPosition;
  var geoLocator = Geolocator();
  double bottomPaddingOfMap = 0;
  Set<Marker> markersSet = {};
  Set<Circle> circlesSet = {};
  double rideDetailsContainer = 0;
  void displayRideDetailsContainer() async {
    await getPlaceDirection();
    setState(() {});
  }

  void locatePosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;

    LatLng latLatPosition = LatLng(position.latitude, position.longitude);

    CameraPosition cameraPosition =
        new CameraPosition(target: latLatPosition, zoom: 14);
    newGoogleMapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

    String address =
        await AssistantMethods.serachCoordinateAddress(position, context);
    print("This is your address : " + address);
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(35.6952183, 10.8190989),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    /*var textController1; //drop off
    var textController2;*/ //pickup
    String placeAddress =
        Provider.of<AppData>(context).pickUpLocation.placeName;
    textController1.text = placeAddress;
    return Scaffold(
      key: scaffoldKey,

      // AppBar
      body: Stack(children: [
        Stack(
          children: [
            Positioned(
              child: GoogleMap(
                padding: EdgeInsets.only(bottom: bottomPaddingOfMap),
                mapType: MapType.normal,
                myLocationButtonEnabled: true,
                initialCameraPosition: _kGooglePlex,
                myLocationEnabled: true,
                zoomControlsEnabled: false,
                zoomGesturesEnabled: true,
                polylines: polylineSet,
                markers: markersSet,
                circles: circlesSet,
                onMapCreated: (GoogleMapController controller) {
                  // _controllerGoogleMap.complete(controller);
                  newGoogleMapController = controller;
                  newGoogleMapController!.setMapStyle('''[
  {
    "featureType": "all",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#242f3e"
      }
    ]
  },
  {
    "featureType": "all",
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "lightness": -80
      }
    ]
  },
  {
    "featureType": "administrative",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#746855"
      }
    ]
  },
  {
    "featureType": "administrative.locality",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#d59563"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#d59563"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#263c3f"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#6b9a76"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry.fill",
    "stylers": [
      {
        "color": "#2b3544"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9ca5b3"
      }
    ]
  },
  {
    "featureType": "road.arterial",
    "elementType": "geometry.fill",
    "stylers": [
      {
        "color": "#38414e"
      }
    ]
  },
  {
    "featureType": "road.arterial",
    "elementType": "geometry.stroke",
    "stylers": [
      {
        "color": "#212a37"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry.fill",
    "stylers": [
      {
        "color": "#746855"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry.stroke",
    "stylers": [
      {
        "color": "#1f2835"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#f3d19c"
      }
    ]
  },
  {
    "featureType": "road.local",
    "elementType": "geometry.fill",
    "stylers": [
      {
        "color": "#38414e"
      }
    ]
  },
  {
    "featureType": "road.local",
    "elementType": "geometry.stroke",
    "stylers": [
      {
        "color": "#212a37"
      }
    ]
  },
  {
    "featureType": "transit",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#2f3948"
      }
    ]
  },
  {
    "featureType": "transit.station",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#d59563"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#17263c"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#515c6d"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "lightness": -20
      }
    ]
  }
]''');

                  setState(() {
                    bottomPaddingOfMap = 200.0;
                  });

                  locatePosition();
                },
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0, 0.9),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.96,
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-0.6, -0.8),
                        child: Text(
                          Provider.of<AppData>(context).pickUpLocation != null
                              ? Provider.of<AppData>(context)
                                  .pickUpLocation
                                  .placeName
                              : 'PICK UP',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Color(0xFF8D8D8E),
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-0.85, -0.8),
                        child: FaIcon(
                          FontAwesomeIcons.solidCircle,
                          color: Color(0xFF4949C1),
                          size: 18,
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-0.85, 0),
                        child: FaIcon(
                          FontAwesomeIcons.solidCircle,
                          color: Color(0xFF72B104),
                          size: 18,
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-0.6, 0),
                        child: Text(
                          'DROP OFF',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Color(0xFF8D8D8E),
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-0.5, 0.3),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(65, 0, 0, 0),
                          child: TextFormField(
                            onTap: () async {
                              var res = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AbcdWidget()));
                              if (res == "obtainDirection") {
                                print(
                                    "direction obtained !!!!!!!!!!!!!!!!!!!!!!!!!");
                                await getPlaceDirection();
                              }
                            },
                            controller: textController1,
                            showCursor: true,
                            readOnly: true,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelStyle: TextStyle(
                                fontFamily: 'Poppins',
                                color: Color(0x40ffffff),
                                fontSize: 18,
                              ),
                              hintText: 'Destination',
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                            ),
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0x40FFFFFF),
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-0.5, -0.5),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(65, 0, 0, 0),
                          child: TextFormField(
                            controller: textController2,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelStyle: TextStyle(
                                fontFamily: 'Poppins',
                                color: Color(0x40FFFFFF),
                                fontSize: 18,
                              ),
                              hintText: 'Current localization',
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                            ),
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0x40FFFFFF),
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0, 0.83),
                        child: Container(
                          child: ElevatedButton(
                            onPressed: () {
                              _navigateToNextScreen(context);
                            },
                            child: Text(
                              'Confirm',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                            ),
                            //style: ButtonStyle(),
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 75, 57, 239),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                side: BorderSide(
                                  color: Color.fromARGB(255, 75, 57, 239),
                                ),
                              ),
                            ),
                          ),
                          width: 130.0,
                          height: 40,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }

  void _navigateToNextScreen1(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => AbcdWidget()));
  }

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => MainScreen2()));
  }

  Future<void> getPlaceDirection() async {
    var initialPos =
        Provider.of<AppData>(context, listen: false).pickUpLocation;
    var finalPos = Provider.of<AppData>(context, listen: false).dropOffLocation;

    var pickUpLating = LatLng(initialPos.latitude, initialPos.longitude);
    var dropofflating = LatLng(finalPos.latitude, finalPos.longitude);

    showDialog(
        context: context,
        builder: (BuildContext context) => ProgressIndicatorExample());

    var details = await AssistantMethods.obtainPlaceDirectionDetails(
        pickUpLating, dropofflating);
    setState(() {
      tripDirectionDetails = details;
    });
    Navigator.pop(context);
    print("This is Encoded Points ::");
    print(details.encodedPoints);
    //Polyline polylinePoints = PolylinePoints() as Polyline;
    List<PointLatLng> decodedPolyLinePointsResult =
        decodeEncodedPolyline(details.encodedPoints);
    pLineCoordinates.clear();
    if (decodedPolyLinePointsResult.isNotEmpty) {
      decodedPolyLinePointsResult.forEach((PointLatLng pointLatLng) {
        pLineCoordinates
            .add(LatLng(pointLatLng.latitude, pointLatLng.longitude));
      });
    }
    polylineSet.clear();
    setState(() {
      Polyline polyline = Polyline(
        color: Colors.pink,
        polylineId: PolylineId("PolylineID"),
        jointType: JointType.round,
        points: pLineCoordinates,
        width: 5,
        startCap: Cap.roundCap,
        endCap: Cap.roundCap,
        geodesic: true,
      );
      polylineSet.add(polyline);
    });
    LatLngBounds latLngBounds;
    if (pickUpLating.latitude > dropofflating.latitude &&
        pickUpLating.longitude > dropofflating.longitude) {
      latLngBounds =
          LatLngBounds(southwest: dropofflating, northeast: pickUpLating);
    } else if (pickUpLating.longitude > dropofflating.longitude) {
      latLngBounds = LatLngBounds(
          southwest: LatLng(pickUpLating.latitude, dropofflating.longitude),
          northeast: LatLng(dropofflating.latitude, pickUpLating.longitude));
    } else if (pickUpLating.latitude > dropofflating.latitude) {
      latLngBounds = LatLngBounds(
          southwest: LatLng(dropofflating.latitude, pickUpLating.longitude),
          northeast: LatLng(pickUpLating.latitude, dropofflating.longitude));
    } else {
      latLngBounds =
          LatLngBounds(southwest: pickUpLating, northeast: dropofflating);
    }
    newGoogleMapController
        .animateCamera(CameraUpdate.newLatLngBounds(latLngBounds, 70));
    Marker pickUpLocMarker = Marker(
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
      infoWindow:
          InfoWindow(title: initialPos.placeName, snippet: "My location"),
      position: pickUpLating,
      markerId: MarkerId("pickupID"),
    );
    Marker dropOffLocMarker = Marker(
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      infoWindow:
          InfoWindow(title: finalPos.placeName, snippet: "DropOff location"),
      position: dropofflating,
      markerId: MarkerId("dropOffID"),
    );
    setState(() {
      markersSet.add(pickUpLocMarker);
      markersSet.add(dropOffLocMarker);
    });
    Circle pickUpLocCircle = Circle(
      fillColor: Colors.blueAccent,
      center: pickUpLating,
      radius: 12,
      strokeWidth: 4,
      strokeColor: Colors.blueAccent,
      circleId: CircleId("pickUpID"),
    );
    Circle dropOffLocCircle = Circle(
      fillColor: Colors.deepPurple,
      center: dropofflating,
      radius: 12,
      strokeWidth: 4,
      strokeColor: Colors.deepPurple,
      circleId: CircleId("dropOffID"),
    );
    setState(() {
      circlesSet.add(pickUpLocCircle);
      circlesSet.add(dropOffLocCircle);
    });
  }

  List<PointLatLng> decodeEncodedPolyline(String encoded) {
    List<PointLatLng> poly = [];
    int index = 0, len = encoded.length;
    int lat = 0, lng = 0;

    while (index < len) {
      int b, shift = 0, result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlat = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lat += dlat;

      shift = 0;
      result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlng = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lng += dlng;
      PointLatLng p =
          new PointLatLng((lat / 1E5).toDouble(), (lng / 1E5).toDouble());
      poly.add(p);
    }
    return poly;
  }
}
