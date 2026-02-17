import 'package:bpls_mobile/helper/global.dart';
import 'package:bpls_mobile/utils/app_constant.dart';
import 'package:flutter/material.dart';

class LocationHelperProvider with ChangeNotifier {
  var lat = storage.get(AppConstant.currentLatitudeSharedData, defaultValue: '23.8041').toString();
  var lon = storage.get(AppConstant.currentLongitudeSharedData, defaultValue: '90.4152').toString();




}
