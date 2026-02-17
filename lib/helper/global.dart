import 'dart:async';

import 'package:bpls_mobile/datasource/model/module_4_model.dart';
import 'package:bpls_mobile/datasource/static_data/other_static_data.dart';
import 'package:bpls_mobile/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_ce/hive.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';

var storage = Hive.box('myBox');
final globalLogger = Logger(printer: PrettyPrinter(stackTraceBeginIndex: 2, lineLength: 120, colors: true, printEmojis: true, dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart));

Future<dynamic> progressLoader(String message) => Get.defaultDialog(
  title: message,
  content: const Center(child: CircularProgressIndicator()),
);

void resetStorage() {
  storage.delete(AppConstant.tokenSharedData);
  storage.delete(AppConstant.phoneNumberSharedData);
  storage.delete(AppConstant.userIDSharedData);
  storage.delete(AppConstant.userInfoSharedData);
  storage.delete(AppConstant.riderActiveStatusSharedData);
  storage.delete(AppConstant.currentLatitudeSharedData);
  storage.delete(AppConstant.currentLongitudeSharedData);
  storage.delete(AppConstant.settingsSharedData);
  storage.delete(AppConstant.roomId);
}

void resetRideStorage() {
  storage.delete(AppConstant.roomId);
  storage.delete(AppConstant.rideStageSharedData);
  storage.delete(AppConstant.receivedRideRequestSharedData);
  storage.delete(AppConstant.rideSharedData);
  storage.delete(AppConstant.rideStartStatusSharedData);
  storage.delete(AppConstant.paymentStatusSharedData);
}

Future<void> launchPhoneDialer(String phoneNumber) async {
  String url = 'tel:$phoneNumber';
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $url';
  }
}

List<Module4Model> fosolTypeQuestions(String val, String selectedTottoType,OtherStaticModel typeData) {
  List<Module4Model> module4ModelList = [];

  print('selectedTottoType: $selectedTottoType, val: $val');

  if (selectedTottoType == '1' || selectedTottoType == '2') {
    if (val == '1' || val == '2' || val == '3' || val == '6' || val == '10') {
      module4ModelList.add(Module4Model(slNo: 1, title: 'ফসল তোলা/কাটা/কর্তন/আঁটি বাঁধাই পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 2, title: 'মাঠ থেকে বাড়ি বা মাড়াই এর স্থানে আনার মধ্যবর্তী পর্যায়ে পরিবহণ জনিত ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 3, title: 'ফসল মাড়াই পর্যায়ে ক্ষতি (বাড়িতে/জমিতে)',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 4, title: 'পরিষ্কার করা/উইনো (ঝাড়া) করা পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 5, title: 'সিদ্ধ/শুকানো পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 6, title: 'ওজন করার পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 7, title: 'প্যাকেজিং পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 8, title: 'লোড-আনলোড পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 9, title: 'পরিবহন/হস্তান্তর পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 10, title: 'স্টোরেজ পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 11, title: 'অন্যান্য ক্ষতি (উল্লেখ করুন)',typeData: typeData));
    } else if (val == '7') {
      module4ModelList.add(Module4Model(slNo: 1, title: 'ফল সংগ্রহ (Harvesting) পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 2, title: 'পরিষ্কার করা পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 3, title: 'বাছাইকরণ/গ্রেডিং পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 4, title: 'ওজন করার পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 5, title: 'খানা/খামারে অস্থায়ী সংরক্ষণ',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 6, title: 'প্যাকেজিং পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 7, title: 'পরিবহন/হস্তান্তর পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 8, title: 'লোড-আনলোড পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 9, title: 'স্টোরেজ পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 10, title: 'বিক্রয় পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 11, title: 'অন্যান্য ক্ষতি (উল্লেখ করুন)',typeData: typeData));
    } else if (val == '11' || val == '12') {
      module4ModelList.add(Module4Model(slNo: 1, title: 'জলাশয় থেকে উত্তোলন/সংগ্রহ',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 2, title: '(Harvesting) পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 3, title: 'পরিস্কার/ধৌতকরণ পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 4, title: 'প্রাথমিক গ্রেডিং/বাছাইকরণ পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 5, title: 'ওজনকরণ পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 6, title: 'প্রাথমিক আইসিং/বরফজাতকরণ পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 7, title: 'প্যাকেজিং/মোড়কীকরণ পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 8, title: 'লোডিং/আনলোডিং পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 9, title: 'পরিবহন পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 10, title: 'বিক্রয়/ ব্যাপারীর জন্য অপেক্ষা',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 11, title: 'হস্তান্তর (Handover) পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 12, title: 'স্টোরেজ পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 13, title: 'অন্যান্য ক্ষতি (উল্লেখ করুন)',typeData: typeData));
    } else if (val == '8' || val == '9') {
      module4ModelList.add(Module4Model(slNo: 1, title: 'ফসল উত্তোলন পর্যায়ে ক্ষতি ',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 2, title: 'মাঠ থেকে বাড়ি অনার মধ্যবর্তী পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 3, title: 'পরিষ্কার করা পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 4, title: 'বাছাইকরণ/গ্রেডিং পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 5, title: 'শুকানো পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 6, title: 'চাহিদা/মূল্য হ্রাসের কারণের ফসল বিনষ্টকরণজনিত ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 7, title: 'ওজন করার পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 8, title: 'প্যাকেজিং পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 9, title: 'লোড-আনলোড পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 10, title: 'স্টোরেজ পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 11, title: 'পরিবহণ পরিবহন/হস্তান্তর পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 12, title: 'ব্যাপারির দোকানে পরিবহন পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 13, title: 'বিক্রয় পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 14, title: 'অন্যান্য ক্ষতি (উল্লেখ করুন)',typeData: typeData));
    } else if (val == '13' || val == '14') {
      module4ModelList.add(Module4Model(slNo: 1, title: 'ব্যবস্থাপনা ও অবকাঠামোগত পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 2, title: 'স্টোরেজ/সংরক্ষণ পর্যায়ে ক্ষতি ',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 3, title: 'গ্রেডিং/বাছাইকরণ পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 4, title: 'ওজনকরণ পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 5, title: 'বিক্রয় স্থানে পরিবহন পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 6, title: 'লোডিং ও আনলোডিং পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 7, title: 'অন্যান্য ক্ষতি (উল্লেখ করুন)',typeData: typeData));
    }
  } else if (selectedTottoType == '3' || selectedTottoType == '4') {
    if (val == '4' || val == '5' || val == '6' || val == '10') {
      module4ModelList.add(Module4Model(slNo: 1, title: 'ক্রয়ের স্থান থেকে ব্যাপারি/পাইকারি/আড়তদারে পরিবহন পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 2, title: 'পরিষ্কার করা/উইনো (ঝাড়া) করা পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 3, title: 'ওজনকরণ পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 4, title: 'লটিং/রি-লটিং/সাজানো পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 5, title: 'লোড-আনলোড পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 6, title: 'বাজারজাতকরণের জন্য প্যাকেজিং পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 7, title: 'বাজারজাত/হস্তান্তরের জন্য পরিবহন পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 8, title: 'স্টোরেজ পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 9, title: 'অন্যান্য ক্ষতি (উল্লেখ করুন)',typeData: typeData));
    } else if (val == '7') {
      module4ModelList.add(Module4Model(slNo: 1, title: 'ক্রয়ের স্থান থেকে পরিবহন পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 2, title: 'ওজনকরণ পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 3, title: 'লোডিং-আনলোডিং ও সাজানো',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 4, title: 'বাছাইকরণ/গ্রেডিং পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 5, title: 'খোলা জায়গায় রাখা',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 6, title: 'বাজারজাতকরণের জন্য প্যাকেজিং পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 7, title: 'বাজারজাত/হস্তান্তরের জন্য পরিবহন পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 8, title: 'বিক্রয় পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 9, title: 'স্টোরেজ পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 10, title: 'অন্যান্য ক্ষতি (উল্লেখ করুন)',typeData: typeData));
    } else if (val == '11' || val == '12') {
      module4ModelList.add(Module4Model(slNo: 1, title: 'ক্রয়ের স্থান থেকে আপনার প্রতিষ্ঠানে পরিবহন পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 2, title: 'গ্রেডিং/বাছাইকরণ পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 3, title: 'পরিস্কার/ধৌতকরণ পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 4, title: 'ওজনকরণ পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 5, title: 'লোডিং/আনলোডিং পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 6, title: 'আইসিং/বরফজাতকরণ পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 7, title: 'প্যাকেজিং/মোড়কীকরণ পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 8, title: 'আপনার প্রতিষ্ঠান হতে বিক্রয়ের স্থানে পরিবহন পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 9, title: 'হস্তান্তর (Handover) পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 10, title: 'স্টোরেজ পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 11, title: 'অন্যান্য ক্ষতি (উল্লেখ করুন)',typeData: typeData));
    } else if (val == '8' || val == '9') {
      module4ModelList.add(Module4Model(slNo: 1, title: 'ক্রয়ের স্থান থেকে আপনার প্রতিষ্ঠানে পরিবহন পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 2, title: 'আপনার প্রতিষ্ঠান হতে বিক্রয়ের স্থানে পরিবহন পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 3, title: 'পরিষ্কার করা পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 4, title: 'ওজনকরণ পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 5, title: 'বাছাইকরণ/গ্রেডিং পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 6, title: 'লটিং/রি-লটিং/সাজানো পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 7, title: 'লোড-আনলোড পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 8, title: 'বাজারজাতকরণের জন্য প্যাকেজিং পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 9, title: 'বাজারজাত/হস্তান্তরের জন্য পরিবহন পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 10, title: 'স্টোরেজ পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 11, title: 'অন্যান্য ক্ষতি (উল্লেখ করুন) ',typeData: typeData));
    } else if (val == '13' || val == '14') {
      module4ModelList.add(Module4Model(slNo: 1, title: 'পশু ক্রয় ও সংগ্রহ পর্যায়ে',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 2, title: 'বাছাই ও গ্রেডিং পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 3, title: 'ওজনকরণ পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 4, title: 'ক্রয়ের স্থান থেকে আপনার প্রতিষ্ঠানে পরিবহন পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 5, title: 'প্রদর্শন পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 6, title: 'স্টোরেজ পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 7, title: 'আপনার প্রতিষ্ঠান হতে বিক্রয়ের স্থানে পরিবহন পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 8, title: 'লোডিং/আনলোডিং পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 9, title: 'হস্তান্তর (Handover) পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 10, title: 'অন্যান্য ক্ষতি (উল্লেখ করুন)',typeData: typeData));
    }
  } else if (selectedTottoType == '5') {
    if (val == '4' || val == '5' || val == '6' || val == '10') {
      module4ModelList.add(Module4Model(slNo: 1, title: 'ক্রয়ের স্থান থেকে অটো/চাতাল মিলে পরিবহন পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 2, title: 'পরিষ্কার করা/উইনো করা (ঝাড়া) পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 3, title: 'সিদ্ধ/শুকানো পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 4, title: 'প্যাকেজিং/রি-প্যাকেজিং পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 5, title: 'স্টোরেজ পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 6, title: 'ছাটাই/ভাঙ্গানো (Husking) পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 7, title: 'পলিশিংকরণ পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 8, title: 'বাছাইকরণ/গ্রেডিং পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 9, title: 'লোড-আনলোড পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 10, title: 'অটো/চাতাল মিল থেকে বাজারজাতকরণে পরিবহন পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 11, title: 'স্টোরেজ পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 12, title: 'অন্যান্য ক্ষতি (উল্লেখ করুন)',typeData: typeData));
    } else if (val == '7') {
      module4ModelList.add(Module4Model(slNo: 1, title: 'ক্রয়ের স্থান থেকে আপনার গুদাম/কোল্ডস্টোরেজে পরিবহন পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 2, title: 'লোড-আনলোড পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 3, title: 'বাছাইকরণ/গ্রেডিং পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 4, title: 'স্টোরেজ পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 5, title: 'অন্যান্য ক্ষতি (উল্লেখ করুন)',typeData: typeData));
    } else if (val == '11' || val == '12') {
      module4ModelList.add(Module4Model(slNo: 1, title: 'ক্রয়ের স্থান থেকে আপনার প্রতিষ্ঠানে পরিবহন পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 2, title: 'ধোয়া ও পরিষ্কারকরণ',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 3, title: 'প্রাথমিক বাছাই ও গ্রেডিং',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 4, title: 'বরফ প্রয়োগ ও ঠাণ্ডাকরণ',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 5, title: 'প্রদর্শন পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 6, title: 'প্যাকেজিং/রি-প্যাকেজিং পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 7, title: 'লোড-আনলোড পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 8, title: 'স্টোরেজ পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 9, title: 'অন্যান্য ক্ষতি (উল্লেখ করুন)',typeData: typeData));
    } else if (val == '8' || val == '9') {
      module4ModelList.add(Module4Model(slNo: 1, title: 'ক্রয়ের স্থান থেকে গুদাম/কোল্ডস্টোরেজে পরিবহন পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 2, title: 'গুদাম/কোল্ডস্টোরেজ থেকে বিক্রয়ের স্থানে পরিবহন পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 3, title: 'পরিষ্কার করা পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 4, title: 'প্যাকেজিং/রি-প্যাকেজিং পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 5, title: 'বাছাইকরণ/গ্রেডিং পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 6, title: 'লোড-আনলোড পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 7, title: 'স্টোরেজ পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 8, title: 'অন্যান্য ক্ষতি (উল্লেখ করুন)',typeData: typeData));
    } else if (val == '13' || val == '14') {
      module4ModelList.add(Module4Model(slNo: 1, title: 'কাঁচামাল গ্রহণ',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 2, title: 'ক্রয়ের স্থান থেকে আপনার প্রতিষ্ঠানে পরিবহন পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 3, title: 'কর্তন পার্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 4, title: 'প্রাথমিক বাছাই ও ট্রিমিং',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 5, title: 'ধোয়া ও পরিষ্কারকরণ',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 6, title: 'গ্রাইন্ডিং, মিক্সিং/ফর্মুলেশন/ ফর্মিং/কোটিং / ব্রেডিং',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 7, title: 'প্যাকেজিং ও লেবেলিং',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 8, title: 'কোল্ড স্টোরেজ',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 9, title: 'আপনার প্রতিষ্ঠান হতে বিক্রয়ের স্থানে পরিবহন পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 10, title: 'বাজারজাতকরণ',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 11, title: 'অন্যান্য ক্ষতি (উল্লেখ করুন)',typeData: typeData));
    }
  } else if (selectedTottoType == '6') {
    if (val == '4' || val == '5' || val == '6' || val == '10') {
      module4ModelList.add(Module4Model(slNo: 1, title: 'বাড়ি/খামার/বাজার থেকে গোডাউনে পরিবহন পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 2, title: 'গোডাউন থেকে বাজারজাতকরণে পরিবহন পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 3, title: 'প্যাকেজিং/রি-প্যাকেজিং পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 4, title: 'লোড-আনলোড পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 5, title: 'স্টোরেজ পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 6, title: 'অন্যান্য ক্ষতি (উল্লেখ করুন)',typeData: typeData));
    } else if (val == '7') {
      module4ModelList.add(Module4Model(slNo: 1, title: 'ক্রয়ের স্থান থেকে আপনার গুদাম/কোল্ডস্টোরেজে পরিবহন পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 2, title: 'লোড-আনলোড পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 3, title: 'বাছাইকরণ/গ্রেডিং পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 4, title: 'স্টোরেজ পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 5, title: 'অন্যান্য ক্ষতি (উল্লেখ করুন)',typeData: typeData));
    } else if (val == '8' || val == '9') {
      module4ModelList.add(Module4Model(slNo: 1, title: 'ক্রয়ের স্থান থেকে গুদাম/কোল্ডস্টোরেজে পরিবহন পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 2, title: 'গুদাম/কোল্ডস্টোরেজ থেকে বিক্রয়ের স্থানে পরিবহন পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 3, title: 'পরিষ্কার করা পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 4, title: 'প্যাকেজিং/রি-প্যাকেজিং পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 5, title: 'বাছাইকরণ/গ্রেডিং পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 6, title: 'লোড-আনলোড পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 7, title: 'স্টোরেজ পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 8, title: 'অন্যান্য ক্ষতি (উল্লেখ করুন)',typeData: typeData));
    }
  } else if (selectedTottoType == '7') {
    if (val == '4' || val == '5' || val == '6' || val == '10') {
      module4ModelList.add(Module4Model(slNo: 1, title: 'কাঁচামাল গ্রহণ (Receiving)',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 2, title: 'গওজন/পরিমাপ ও আনলোডিং',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 3, title: 'পরিষ্কার/ধোয়া',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 4, title: 'লকাটা/ছাঁটাই/গ্রেডিং',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 5, title: 'মেশিনে প্রক্রিয়াকরণ',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 6, title: 'তাপ প্রয়োগ (সিদ্ধ/ভাজা/শুকানো)',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 7, title: 'শীতলকরণ/কুলিং',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 8, title: 'প্যাকেজিং সময়',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 9, title: 'রিপ্যাকেজিং/ লেবেলিং',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 10, title: 'অস্থায়ী সংরক্ষণ (ইউনিটের ভিতরে)',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 11, title: 'গুদামজাতকরণ (Storage)',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 12, title: 'ইউনিট থেকে পরিবহন',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 13, title: 'বাজারজাতকরণে বিলম্ব',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 14, title: 'মেয়াদোত্তীর্ণ (Expiry)',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 15, title: 'প্রাকৃতিক ও বাহ্যিক কারণ',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 16, title: 'অন্যান্য ক্ষতি (উল্লেখ করুন)',typeData: typeData));
    } else if (val == '7') {
      module4ModelList.add(Module4Model(slNo: 1, title: 'কাঁচামাল গ্রহণ (Receiving)',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 2, title: 'ওজনকরণ পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 3, title: 'পরিষ্কার/ধোয়া পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 4, title: 'বাছাইকরণ/গ্রেডিং পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 5, title: 'খোসা ছাড়ানো/কাটা / পাল্পিং পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 6, title: 'মেশিনে প্রক্রিয়াকরণ পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 7, title: 'শীতলকরণ/কুলিং পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 8, title: 'প্যাকেজিং সময়/রিপ্যাকেজিং/ লেবেলিং পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 9, title: 'অস্থায়ী সংরক্ষণ (ইউনিটের ভিতরে)',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 10, title: 'গুদামজাতকরণ (Storage)',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 11, title: 'প্রতিষ্ঠান থেকে পরিবহন',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 12, title: 'অন্যান্য ক্ষতি (উল্লেখ করুন)',typeData: typeData));
    } else if (val == '11' || val == '12') {
      module4ModelList.add(Module4Model(slNo: 1, title: 'ক্রয়ের স্থান থেকে আপনার প্রতিষ্ঠানে পরিবহন পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 2, title: 'ধোয়া ও পরিষ্কারকরণ',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 3, title: 'প্রাথমিক বাছাই ও গ্রেডিং',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 4, title: 'বরফ প্রয়োগ ও ঠাণ্ডাকরণ',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 5, title: 'প্রদর্শন পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 6, title: 'প্যাকেজিং/রি-প্যাকেজিং পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 7, title: 'লোড-আনলোড পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 8, title: 'স্টোরেজ পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 9, title: 'অন্যান্য ক্ষতি (উল্লেখ করুন)',typeData: typeData));
    } else if (val == '8' || val == '9') {
      module4ModelList.add(Module4Model(slNo: 1, title: 'কাঁচামাল গ্রহণ (Receiving)',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 2, title: 'ওজন/পরিমাপ ও আনলোডিং',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 3, title: 'পরিষ্কার/ধোয়া',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 4, title: 'কাটা/ছাঁটাই/গ্রেডিং',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 5, title: 'মেশিনে প্রক্রিয়াকরণ',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 6, title: 'শীতলকরণ/কুলিং',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 7, title: 'প্যাকেজিং সময়',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 8, title: 'রিপ্যাকেজিং/ লেবেলিং',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 9, title: 'অস্থায়ী সংরক্ষণ (ইউনিটের ভিতরে)',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 10, title: 'গুদামজাতকরণ (Storage)',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 11, title: 'ইউনিট থেকে পরিবহন',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 12, title: 'বাজারজাতকরণে বিলম্ব',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 13, title: 'মেয়াদোত্তীর্ণ (Expiry)',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 14, title: 'প্রাকৃতিক ও বাহ্যিক কারণ',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 15, title: 'অন্যান্য ক্ষতি (উল্লেখ করুন)',typeData: typeData));
    } else if (val == '13' || val == '14') {
      module4ModelList.add(Module4Model(slNo: 1, title: 'কাঁচামাল গ্রহণ',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 2, title: 'ক্রয়ের স্থান থেকে আপনার প্রতিষ্ঠানে পরিবহন পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 3, title: 'কর্তন পার্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 4, title: 'প্রাথমিক বাছাই ও ট্রিমিং',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 5, title: 'ধোয়া ও পরিষ্কারকরণ',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 6, title: 'গ্রাইন্ডিং, মিক্সিং/ফর্মুলেশন/ ফর্মিং/কোটিং / ব্রেডিং',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 7, title: 'প্যাকেজিং ও লেবেলিং',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 8, title: 'কোল্ড স্টোরেজ',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 9, title: 'আপনার প্রতিষ্ঠান হতে বিক্রয়ের স্থানে পরিবহন পর্যায়ে ক্ষতি',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 10, title: 'বাজারজাতকরণ',typeData: typeData));
      module4ModelList.add(Module4Model(slNo: 11, title: 'অন্যান্য ক্ষতি (উল্লেখ করুন)',typeData: typeData));
    }
  }
  return module4ModelList;
}

Module4Model? getFosolTypeQuestionByIndex(int index, String val, String selectedTottoType, OtherStaticModel typeData) {
  // Reuse your existing logic to generate the full list
  List<Module4Model> fullList = fosolTypeQuestions(val, selectedTottoType, typeData);

  // Check if the index is valid for the generated list
  if (index >= 0 && index < fullList.length) {
    return fullList[index];
  }

  // Return null or a default model if the index is out of range
  print('Error: Index $index is out of bounds for the list size ${fullList.length}');
  return null;
}



String idCrop(String title){

  print('title: $title');

  if(title == 'আমন ধান'){
    return '1';
  } else if(title == 'বোরো ধান'){
    return '2';
  } else if(title == 'আউশ ধান'){
    return '3';
  } else if(title == 'ধান (সকল ধরনের ধান)'){
    return '4';
  } else if(title == 'চাল'){
    return '5';
  } else if(title == 'মসুর'){
    return '6';
  } else if(title == 'আম'){
    return '7';
  } else if(title == 'পেঁয়াজ'){
    return '8';
  } else if(title == 'আলু'){
    return '9';
  } else if(title == 'সরিষা'){
    return '10';
  } else if(title == 'কার্প জাতীয় মাছ (রুই, কাতলা, কালবাউশ, মৃগেল, অন্যান্য কার্প)'||title == 'কার্প'){
    return '11';
  } else if(title == 'চিংড়ি'){
    return '12';
  } else if(title == 'গরুর মাংস'){
    return '13';
  } else if(title == 'মুরগির মাংস (পোল্ট্রি/ব্রয়লারসহ সব ধরনের মুরগী)'){
    return '14';
  } else {
    return '';
  }
}