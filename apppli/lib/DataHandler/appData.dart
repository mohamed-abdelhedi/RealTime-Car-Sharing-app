import 'package:flutter/cupertino.dart';
import 'package:car_mate/Models/address.dart';
import 'package:car_mate/DataHandler/appData.dart';


class AppData extends ChangeNotifier {
  var pickUpLocation = Address();

  void updatePickUpLocationAddress(Address pickUpAddress) {
    pickUpLocation = pickUpAddress;
    notifyListeners();
  }
}
