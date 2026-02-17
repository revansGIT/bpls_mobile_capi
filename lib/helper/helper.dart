import 'dart:convert';
import 'dart:io' show File, HttpClient, HttpClientRequest, Directory;

import 'package:bpls_mobile/business_logic/provider/alu_provider.dart';
import 'package:bpls_mobile/business_logic/provider/amon_dhan_provider.dart';
import 'package:bpls_mobile/business_logic/provider/aus_dhan_provider.dart';
import 'package:bpls_mobile/business_logic/provider/boro_dhan_provider.dart';
import 'package:bpls_mobile/business_logic/provider/cal_provider.dart';
import 'package:bpls_mobile/business_logic/provider/carp_provider.dart';
import 'package:bpls_mobile/business_logic/provider/cingri_provider.dart';
import 'package:bpls_mobile/business_logic/provider/cow_provider.dart';
import 'package:bpls_mobile/business_logic/provider/dhan_provider.dart';
import 'package:bpls_mobile/business_logic/provider/helper_provider.dart';
import 'package:bpls_mobile/business_logic/provider/hen_provider.dart';
import 'package:bpls_mobile/business_logic/provider/mango_provider.dart';
import 'package:bpls_mobile/business_logic/provider/mosur_provider.dart';
import 'package:bpls_mobile/business_logic/provider/peyaj_provider.dart';
import 'package:bpls_mobile/business_logic/provider/save_data_provider.dart';
import 'package:bpls_mobile/business_logic/provider/sorisha_provider.dart';
import 'package:bpls_mobile/business_logic/provider/survey_provider.dart';
import 'package:bpls_mobile/features/dashboard/presentation/other_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:bpls_mobile/business_logic/provider/auth_provider.dart';
import 'package:bpls_mobile/business_logic/provider/dashboard_provider.dart';
import 'package:bpls_mobile/business_logic/provider/location_helper_provider.dart';
import 'package:bpls_mobile/datasource/model/user_model.dart';
import 'package:bpls_mobile/helper/global.dart';
import 'package:bpls_mobile/utils/app_constant.dart';
import 'package:bpls_mobile/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uuid/uuid.dart';

import '../main.dart';

HelperProvider get providerHelper => Provider.of<HelperProvider>(navigatorKey.currentState!.context, listen: false);

SurveyProvider get providerSurvey => Provider.of<SurveyProvider>(navigatorKey.currentState!.context, listen: false);

SaveDataProvider get providerSaveData => Provider.of<SaveDataProvider>(navigatorKey.currentState!.context, listen: false);

AuthProvider get providerAuth => Provider.of<AuthProvider>(navigatorKey.currentState!.context, listen: false);

DashboardProvider get providerDashboard => Provider.of<DashboardProvider>(navigatorKey.currentState!.context, listen: false);

AmonDhanProvider get providerAmonDhan => Provider.of<AmonDhanProvider>(navigatorKey.currentState!.context, listen: false);

BoroDhanProvider get providerBoroDhan => Provider.of<BoroDhanProvider>(navigatorKey.currentState!.context, listen: false);

AusDhanProvider get providerAusDhan => Provider.of<AusDhanProvider>(navigatorKey.currentState!.context, listen: false);

CalProvider get providerCal => Provider.of<CalProvider>(navigatorKey.currentState!.context, listen: false);

SorishaProvider get providerSorisha => Provider.of<SorishaProvider>(navigatorKey.currentState!.context, listen: false);

MangoProvider get providerMango => Provider.of<MangoProvider>(navigatorKey.currentState!.context, listen: false);

DhanProvider get providerDhan => Provider.of<DhanProvider>(navigatorKey.currentState!.context, listen: false);

MosurProvider get providerMosur => Provider.of<MosurProvider>(navigatorKey.currentState!.context, listen: false);

CarpProvider get providerCarp => Provider.of<CarpProvider>(navigatorKey.currentState!.context, listen: false);

CingriProvider get providerCingri => Provider.of<CingriProvider>(navigatorKey.currentState!.context, listen: false);

CowProvider get providerCow => Provider.of<CowProvider>(navigatorKey.currentState!.context, listen: false);

HenProvider get providerHen => Provider.of<HenProvider>(navigatorKey.currentState!.context, listen: false);

AluProvider get providerAlu => Provider.of<AluProvider>(navigatorKey.currentState!.context, listen: false);

PeyajProvider get providerPeyaj => Provider.of<PeyajProvider>(navigatorKey.currentState!.context, listen: false);

LocationHelperProvider get providerLocationHelper => Provider.of<LocationHelperProvider>(navigatorKey.currentState!.context, listen: false);

UserModel get userModel => storage.get(AppConstant.userInfoSharedData) != null ? UserModel.fromJson(storage.get(AppConstant.userInfoSharedData)) : UserModel();

double get screenHeight => MediaQuery.of(navigatorKey.currentState!.context).size.height;

double get screenWeight => MediaQuery.of(navigatorKey.currentState!.context).size.width;

int get selectTottoType => int.parse(providerSurvey.selectedTottoType.id);
// bool get tottoKhan_And_Organization => true;
bool get tottoKhanAndOrganization => providerSurvey.selectedTottoType.id == '1' || providerSurvey.selectedTottoType.id == '2';

int get part => (providerSurvey.selectedTottoType.id == '1' || providerSurvey.selectedTottoType.id == '2')
    ? 1
    : (providerSurvey.selectedTottoType.id == '3' || providerSurvey.selectedTottoType.id == '4')
    ? 2
    : (providerSurvey.selectedTottoType.id == '5')
    ? 3
    : (providerSurvey.selectedTottoType.id == '6')
    ? 4
    : 5;

void navigateToOtherScreen(String title) {
  Navigator.of(navigatorKey.currentState!.context).push(MaterialPageRoute(builder: (context) => OtherScreen(title)));
}

void navigateTo(Widget screen) {
  Navigator.of(navigatorKey.currentState!.context).push(MaterialPageRoute(builder: (context) => screen));
}

void back() {
  Navigator.of(navigatorKey.currentState!.context).pop();
}

void hideKeyboard() {
  FocusScopeNode currentFocus = FocusScope.of(navigatorKey.currentState!.context);
  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}

var uuid = Uuid();

String toTitleCase(String text) {
  if (text.isEmpty) return text;
  return text
      .split(' ')
      .map((word) {
        if (word.isEmpty) return word;
        return word[0].toUpperCase() + word.substring(1).toLowerCase();
      })
      .join(' ');
}

Future<File?> downloadFile(String url, String filename) async {
  try {
    HttpClient httpClient = HttpClient();
    HttpClientRequest httpClientRequest = await httpClient.getUrl(Uri.parse(url));
    var response = await httpClientRequest.close();
    var bytes = await consolidateHttpClientResponseBytes(response);
    String dir = (await getApplicationDocumentsDirectory()).path;
    var finalPath = '$dir/$filename';
    File file = File(finalPath);

    if (await file.exists()) {
      await file.delete();
    }

    await file.writeAsBytes(bytes);
    return file;
  } catch (e) {
    return null;
  }
}

Future<void> saveJsonToFile(Map<String, dynamic> jsonData) async {
  try {
    // Get app documents directory
    final appDocDir = await getApplicationDocumentsDirectory();

    // Create folder structure: surveys/[surveyorId]/[geoCode]/[date]
    final surveyorId = 'unknown';
    final geoCode = 'unknown';
    final dateFolder = DateTime.now().toString().split(' ')[0]; // YYYY-MM-DD format

    final folderPath = '${appDocDir.path}/surveys/$surveyorId/$geoCode/$dateFolder';
    final folder = Directory(folderPath);

    // Create directories if they don't exist
    if (!await folder.exists()) {
      await folder.create(recursive: true);
    }

    // Create filename with timestamp
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final fileName = 'survey_$timestamp.json';

    // Write JSON file
    final file = File('${folder.path}/$fileName');
    await file.writeAsString(jsonEncode(jsonData));

    if (kDebugMode) {
      print('JSON file saved at: ${file.path}');
    }
    if (kDebugMode) {
      print('Folder structure: surveys/$surveyorId/$geoCode/$dateFolder/');
    }
  } catch (e) {
    if (kDebugMode) {
      print('Error saving JSON file: $e');
    }
  }
}

void showSnackMessage(String message, {duration = 2, bool isError = true}) {
  ScaffoldMessenger.of(navigatorKey.currentState!.context).showSnackBar(
    SnackBar(
      content: Text(message, style: const TextStyle(fontSize: 14)),
      backgroundColor: isError ? Colors.red : kPrimaryColor,
      duration: Duration(seconds: duration),
    ),
  );
}

void showToastMessage(String message, {length = Toast.LENGTH_SHORT, bool isError = true, gravity = ToastGravity.SNACKBAR}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: length,
    gravity: gravity,
    timeInSecForIosWeb: 1,
    backgroundColor: isError ? Colors.red : kPrimaryColor,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

Future<void> showSuccessDialog(String message, BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // User must tap the button to dismiss
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        elevation: 0,
        backgroundColor: Colors.transparent, // Makes the background transparent
        child: _buildSuccessDialogContent(context, message),
      );
    },
  );
}

Widget _buildSuccessDialogContent(BuildContext context, String message) {
  return Container(
    padding: const EdgeInsets.all(20.0),
    decoration: BoxDecoration(
      color: Colors.white, // Dialog background color
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(20.0),
      boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10.0, offset: const Offset(0.0, 10.0))],
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min, // To make the dialog compact
      children: <Widget>[
        const SizedBox(height: 15),
        Text(
          "Success!",
          style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.green[700]),
        ),
        const SizedBox(height: 10),
        Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16.0, color: Colors.grey[700]),
        ),
        const SizedBox(height: 20),
      ],
    ),
  );
}

class Helper {
  static double setHeight(BuildContext context, {height = 1}) {
    return MediaQuery.of(context).size.height * height;
  }

  static double setWidth(BuildContext context, {width = 1}) {
    return MediaQuery.of(context).size.width * width;
  }


  static void circleProgressBar(context) {
    Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(kPrimaryColor)));
  }

  static void boxDecoration(Color color, double radius) {
    BoxDecoration(color: color, borderRadius: BorderRadius.all(Radius.circular(radius)));
  }

  static Future<void> openCall(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    await launchUrl(launchUri);
  }

  static Future<void> openEmail(String email) async {
    final Uri emailLaunchUri = Uri(scheme: 'mailto', path: email);
    await launchUrl(emailLaunchUri);
  }

  static Future<void> openMap(double latitude, double longitude) async {
    // final Uri googleUrl = Uri(path: "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude");

    String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await launchUrl(Uri.parse(googleUrl))) {
      await canLaunchUrl(Uri.parse(googleUrl));
    } else {
      throw 'Could not open the map.';
    }
  }

  static Future<void> openMap2(double lat, double long) async {
    final String googleMapslocationUrl = "google.navigation:q=$lat,$long&mode=d";

    final String encodedURl = Uri.encodeFull(googleMapslocationUrl);

    if (await canLaunchUrl(Uri.parse(encodedURl))) {
      await launchUrl(Uri.parse(encodedURl));
    } else {
      throw 'Could not launch $encodedURl';
    }
  }

  static Future launchGoogleMapsNavigation2(double lat, double lng) async {
    var uri = Uri.parse("google.navigation:q=$lat,$lng&mode=w");
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch ${uri.toString()}';
    }
  }

  static Future<void> openWhatsapp(String number) async {
    var whatsappAndroid = Uri.parse("whatsapp://send?phone=$number&text=");
    if (await canLaunchUrl(whatsappAndroid)) {
      await launchUrl(whatsappAndroid);
    } else {}
  }

  static Future<void> openSocial(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  String utcConverter(String dateUtc) {
    var date = DateTime.tryParse(dateUtc)?.toLocal();

    const List<String> months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];

    String amPm = date!.hour >= 12 ? "pm" : "am";
    int hour = date.hour % 12 == 0 ? 12 : date.hour % 12;

    String formattedDate = "${date.day}th ${months[date.month - 1]} ${date.year}, $hour.${date.minute.toString().padLeft(2, '0')}$amPm";
    return formattedDate;
  }

  void cacheImages(BuildContext context, String url) {
    CachedNetworkImage(
      imageUrl: url,
      placeholder: (context, url) => Icon(Icons.person, color: Colors.black),
      errorWidget: (context, url, error) => Icon(Icons.error, color: Colors.black),
    );
  }
}

/// Formats a number to remove unnecessary trailing zeros
/// Examples: 23.00 -> "23", 23.30 -> "23.3", 23.45 -> "23.45"
String formatNumber(double value, {int decimals = 2}) {
  String formatted = value.toStringAsFixed(decimals);
  // Remove trailing zeros and decimal point if not needed
  formatted = formatted.replaceAll(RegExp(r'([.]*0+)(?!.*\d)'), '');
  return formatted;
}

/// Custom TextInputFormatter that prevents input from exceeding a maximum value
/// Useful for preventing users from entering more than allowed quantity
class MaxValueTextInputFormatter extends TextInputFormatter {
  final double maxValue;

  MaxValueTextInputFormatter(this.maxValue);

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // Allow empty input
    if (newValue.text.isEmpty) {
      return newValue;
    }

    // Try to parse the new value
    final parsed = double.tryParse(newValue.text);

    // If parsing fails, revert to old value
    if (parsed == null) {
      return oldValue;
    }

    // If new value exceeds max, keep the old value
    if (parsed > maxValue) {
      return oldValue;
    }

    // Otherwise accept the new value
    return newValue;
  }
}
