import 'package:geolocator/geolocator.dart';
import 'package:car_mate/Assistants/requestAssistant.dart';
import 'package:car_mate/allscreens/pickdropp2.dart';
import 'package:car_mate/Models/address.dart';
import 'package:provider/provider.dart';
import 'package:car_mate/DataHandler/appData.dart';
import 'package:geocoding/geocoding.dart';

class AssistantMethods {
  static Future<String> serachCoordinateAddress(
      Position position, context) async {
    String placeAddress = "";
    String st1, st2, st3, st4;
    String url =
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=AIzaSyCcpoHNm-kR0rnNjf7r_e8TN0_EfdJK7uU";
    var response = await RequestAssistant.getRequest(url);
    print(response);
    /*if (response != "failed") {
      //placeAddress = response["results"][0]["formatted_address"] ;
      st1 = response["results"][0]["address_components"][3]["long_name"];
      st2 = response["results"][0]["address_components"][4]["long_name"];
      st3 = response["results"][0]["address_components"][5]["long_name"];
      st4 = response["results"][0]["address_components"][6]["long_name"];
      placeAddress = st1 + ", " + st2 + ", " + st3 + ", " + st4;
      Address userPickUpAddress = new Address();
      userPickUpAddress.longitude = position.longitude;
      userPickUpAddress.latitude = position.latitude;
      userPickUpAddress.placeName = placeAddress;
      Provider.of<AppData>(context, listen: false)
          .updatePickUpLocationAddress(userPickUpAddress);
    }*/
    return response;
  }
}
// +mainscreen modification : arjaaa3 lel video 15 & 16