import 'package:flutter_application_1/allscreens/riderapp/addcom4.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/Assistants/RequestAssistant.dart';
import 'package:flutter_application_1/DataHandler/appData.dart';
import 'package:flutter_application_1/DataHandler/keys.dart';
import 'package:flutter_application_1/Models/address.dart';
import 'package:flutter_application_1/Models/directionDetails.dart';
import 'package:flutter_application_1/Models/placePredictions.dart';
import 'package:flutter_application_1/allwidgets/div.dart';
import 'pickdropoff2.dart';
import '../passengerapp/progress.dart';

class AbcdWidget extends StatefulWidget {
  const AbcdWidget({Key? key}) : super(key: key);

  @override
  _AbcdWidgetState createState() => _AbcdWidgetState();
}

class _AbcdWidgetState extends State<AbcdWidget> {
  TextEditingController? textController1;
  TextEditingController? textController2;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late DirectionDetails tripDirectionDetails;
  List<LatLng> pLineCoordinates = [];
  Set<Polyline> polylineSet = {};
  late Position currentPosition;
  var geoLocator = Geolocator();
  double bottomPaddingOfMap = 0;
  Set<Marker> markersSet = {};
  Set<Circle> circlesSet = {};
  double rideDetailsContainer = 0;
  /*void displayRideDetailsContainer() async {
    await getPlaceDirection();
    setState(() {});
  }*/
  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
  }

  @override
  void dispose() {
    textController1?.dispose();
    textController2?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional(0, -0.8),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.75,
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
                        'PICK UP',
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
                          onChanged: (val) {
                            findPlace(val);
                            //_navigateToNextScreen1(context);
                            print(val);
                          },
                          controller: textController1,
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
                  ],
                ),
              ),
            ),
          ),
          (MainScreen.placePredictionList.isNotEmpty)
              ? Align(
                  alignment: AlignmentDirectional(-0.5, 1),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                    child: ListView.separated(
                      padding: EdgeInsets.all(0.0),
                      itemBuilder: (context, index) {
                        return PredictionTile(
                          placePredictions:
                              MainScreen.placePredictionList[index],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          DividerWidget(),
                      itemCount: MainScreen.placePredictionList.length,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                    ),
                  ))
              : Align(),
          /*GestureDetector(
            onTap: () async {
              await Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => MainScreen()));
            },
          )*/
        ],
      ),
    );
  }

  void findPlace(String placeName) async {
    if (placeName.length > 0) {
      String autoCompleteUrl =
          "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$placeName&types=geocode&key=$mapkey1&components=country:tn";
      var res = await RequestAssistant.getRequest(autoCompleteUrl);
      /*if (res == "failed") {
        return;
      }*/
      //if (res["status"] == "OK") {
      var predictions = res["predictions"];
      var placeslist = (predictions as List)
          .map((e) => PlacePredictions.fromJson(e))
          .toList();

      setState(() {
        MainScreen.placePredictionList = placeslist;
        print("prediction list : ");
        print(MainScreen.placePredictionList);
      });
    }
  }

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => MainScreen3()));
  }
}

class PredictionTile extends StatelessWidget {
  final PlacePredictions placePredictions;
  PredictionTile({Key? key, required this.placePredictions}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextButton(
      //padding: EdgeInsets(0.0),
      onPressed: () {
        getPlaceAddressDetails(placePredictions.place_id, context);
      },
      child: Column(
        children: [
          SizedBox(
            width: 14.0,
          ),
          Row(
            children: [
              Icon(Icons.add_location),
              SizedBox(
                width: 14.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      placePredictions.main_text,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(
                      height: 3.0,
                    ),
                    Text(
                      placePredictions.secondary_text,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12.0, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            width: 14.0,
          ),
        ],
      ),
    );
  }

  void getPlaceAddressDetails(String placeID, context) async {
    showDialog(
        context: context,
        builder: (BuildContext context) => ProgressIndicatorExample());
    String placeDetailUrl =
        "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeID&key=$mapkey1";
    var res = await RequestAssistant.getRequest(placeDetailUrl);
    Navigator.pop(context);
    if (res == "failed") {
      return;
    }
    if (res["status"] == "OK") {
      Address address = Address();
      address.placeName = res["result"]["name"];
      address.placeId = placeID;
      address.latitude = res["result"]["geometry"]["location"]["lat"];
      address.longitude = res["result"]["geometry"]["location"]["lng"];
      Provider.of<AppData>(context, listen: false)
          .updateDropOffLocationAddress(address);
      print("this is your drop off location :: ");
      print(address.placeName);
      final dropoff = address.placeName;
      createRide(dropoff: dropoff);
      Navigator.pop(context, "obtainDirection");
    }
  }

  /*Stream<List<User>> readHistory() => FirebaseFirestore.instance
      .collection("History")
      .snapshots()
      .map((snapchot) =>
          snapchot.docs.map((doc) => User.fromJson(doc.data())).toList());*/
  Future createRide({required String dropoff}) async {
    final docride =
        FirebaseFirestore.instance.collection("History").doc("${docid}");
    final json = {
      "dropoff": dropoff,
    };
    await docride.set(json);
  }

  //static User fromJson(Map<String, dynamic> json) => User(id: json["id"]);
}
