//constant key

import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConstant {
  // static const String baseUrl = "https://www.shebaone.com/api";
  static final String baseUrl = "${dotenv.env['BASE_URL']}";
  static final String login = "${baseUrl}login";
  static final String submitForm = "${baseUrl}surveys/submit";
  static final String countByType = "${baseUrl}surveys/count-by-type";

  // @23317427781809 @26886612774969 Vai,
  //
  // postman request 'https://capi.sebpobd.net/api/surveys/count-by-type' \
  // --header 'Accept: application/json' \
  // --header 'Content-Type: application/json' \
  // --header 'Authorization: Bearer 198|DrgSh0ZtULqmqZugLxcKRvFAvfJVm3fop4ftP5hjed9a8e97' \
  // --auth-bearer-token '198|DrgSh0ZtULqmqZugLxcKRvFAvfJVm3fop4ftP5hjed9a8e97'
  //
  //
  // Response:
  //
  // {
  // "status": "OK",
  // "data": {
  // "total_khana_household": 3,
  // "total_organization": 7,
  // "total_submissions": 10
  // }
  // }

  static final String profile = "$baseUrl/profile";
  static final String online = "$baseUrl/online";
  static final String offline = "$baseUrl/offline";
  static  String settings = "$baseUrl/settings";
  static  String currentLocation = "$baseUrl/current-location";
  static  String rideRequestAccept = "$baseUrl/ride-request/accept";
  static  String tickets = "$baseUrl/tickets";

  static String rideList(int page, bool isComplete) => "$baseUrl/ride-list?status=${isComplete ? "complete" : 'cancel'}&limit=20&page=$page";
  static String rideListToday(int page) => "$baseUrl/ride-list-today?limit=20&page=$page";
  static String runningRide= "$baseUrl/running-ride";
  static String rideStart(int orderID) => "$baseUrl/ride-start/$orderID";
  static String rideEnd(int orderID) => "$baseUrl/ride-end/$orderID";
  static String chatList(int orderID) => "$baseUrl/chat/$orderID";

  // Socket Listener
  static const String socketUserGetDeliveryManLocation = 'userGetDeliveryManLocation';
  static const String socketPatientRiderChatGet = 'patientRiderChatGet';
  static const String socketPatientRiderRideOnlinePaymentGet = 'patientRiderRideOnlinePaymentGet';
  static const String socketPatientRiderRideCancelGet = 'patientRiderRideCancelGet';
  static const String socketPatientRiderRideDestinationChangeGet = 'patientRiderRideDestinationChangeGet';
  static const String socketPatientRiderRideRequestGet = 'patientRiderRideRequestGet';

  //Socket Emitter
  static const String socketJoinPrivateChat = 'joinPrivateChat';
  static const String socketPatientRiderChat = 'patientRiderChat';

  // Shared Key
  static const String userIDSharedData = 'userID';
  static const String phoneNumberSharedData = 'phoneNumber';
  static const String tokenSharedData = 'token';
  static const String riderActiveStatusSharedData = 'riderActiveStatus';
  static const String currentLatitudeSharedData = 'currentLatitude';
  static const String currentLongitudeSharedData = 'currentLongitude';
  static const String rideSharedData = 'rideData';
  static const String receivedRideRequestSharedData = 'receivedRideRequestData';
  static const String settingsSharedData = 'settingsData';
  static const String userInfoSharedData = 'userInfo';
  static const String rideStartStatusSharedData = 'rideStartStatus';
  static const String rideStageSharedData = 'rideStage';
  static const String paymentStatusSharedData = 'paymentStatus';
  static const String riderType = 'riderType';
  static const String ambulanceRider = 'ambulanceRider';
  static const String apiUrl = 'apiUrl';
  static const String roomId = 'roomId';
  // static const String savedPayloadListKhana = 'savedPayloadListKhana';
  static const String savedPayloadList = 'savedPayloadList';
  static const String savedPayloadListCompleteKhana = 'savedPayloadListCompleteKhana';
  static const String savedPayloadListCompleteOrganization = 'savedPayloadListCompleteOrganization';
  static const String lastSavedNumber = 'lastSavedNumber';


}
