import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/Models/address.dart';

class AppData extends ChangeNotifier {
  var pickUpLocation = Address();
  var dropOffLocation = Address();

  void updatePickUpLocationAddress(Address pickUpAddress) {
    pickUpLocation = pickUpAddress;
    notifyListeners();
  }

  void updateDropOffLocationAddress(Address dropOffAddress) {
    dropOffLocation = dropOffAddress;
    notifyListeners();
  }
}
