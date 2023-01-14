import 'package:flutter_application_1/Assistants/RequestAssistant.dart';
import 'package:flutter_application_1/DataHandler/keys.dart';
import 'package:flutter_application_1/Models/directionDetails.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_application_1/Models/address.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/DataHandler/appData.dart';
import 'package:geocoding/geocoding.dart';
import 'dart:convert';

class AssistantMethods {
  static Future<String> serachCoordinateAddress(
      Position position, context) async {
    String placeAddress = "";
    String st1, st2, st3, st4;
    String url =
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$mapkey1";
    var response = await RequestAssistant.getRequest(url);
    if (response != "failed") {
      placeAddress = response["results"][0]["formatted_address"];

      Address userPickUpAddress = new Address();
      userPickUpAddress.placeName =
          response["results"][0]["address_components"][4]["long_name"];
      userPickUpAddress.latitude =
          response["results"][0]["geometry"]["location"]["lat"];
      userPickUpAddress.longitude =
          response["results"][0]["geometry"]["location"]["lng"];

      /*userPickUpAddress.longitude = position.longitude;
      userPickUpAddress.latitude = position.latitude;
      userPickUpAddress.placeName = placeAddress;*/
      Provider.of<AppData>(context, listen: false)
          .updatePickUpLocationAddress(userPickUpAddress);

      return response["results"][0]["formatted_address"];
    } else {
      return "";
    }
  }

  static Future<DirectionDetails> obtainPlaceDirectionDetails(
      LatLng initialPosition, LatLng finalPosition) async {
    String directionUrl =
        "https://maps.googleapis.com/maps/api/directions/json?origin=${initialPosition.latitude},${initialPosition.longitude}&destination=${finalPosition.latitude},${finalPosition.longitude}&key=$mapkey1";
    var res = await RequestAssistant.getRequest(directionUrl);
    /*if (res == "failed") {
      return null;
    }*/
    DirectionDetails directionDetails = DirectionDetails(
        distanceValue: res["routes"][0]["legs"][0]["distance"]["value"],
        durationValue: res["routes"][0]["legs"][0]["duration"]["value"],
        distanceText: res["routes"][0]["legs"][0]["distance"]["text"],
        durationText: res["routes"][0]["legs"][0]["duration"]["text"],
        encodedPoints: res["routes"][0]["overview_polyline"]["points"]);
    /*directionDetails.distanceValue =
        res["routes"][0]["legs"][0]["distance"]["value"];
    directionDetails.durationValue =
        res["routes"][0]["legs"][0]["duration"]["value"];
    directionDetails.distanceText =
        res["routes"][0]["legs"][0]["distance"]["text"];
    directionDetails.durationText =
        res["routes"][0]["legs"][0]["duration"]["text"];
    directionDetails.encodedPoints =
        res["routes"][0]["overview_polyline"]["points"];*/
    return directionDetails;
  }

  static int calculateFares(DirectionDetails directionDetails) {
    //in terms DT
    double timeTravelFare = (directionDetails.durationValue / 60) * 0.2;
    double distanceTravelFare = (directionDetails.distanceValue / 1000) * 0.20;
    double totalFareAmount = timeTravelFare + distanceTravelFare;
    return totalFareAmount.truncate() + 1;
  }
}
