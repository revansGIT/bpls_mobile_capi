import 'package:bpls_mobile/datasource/model/module_3_model.dart';
import 'package:bpls_mobile/datasource/model/module_4_model.dart';
import 'package:bpls_mobile/datasource/static_data/other_static_data.dart';
import 'package:bpls_mobile/helper/helper.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HenProvider with ChangeNotifier {

  ScrollController scrollController = ScrollController();

  // Keys for input fields
  GlobalKey landQuantityKey = GlobalKey();
  GlobalKey productionQuantityKey = GlobalKey();
  GlobalKey otherSourceQuantityKey = GlobalKey();
  GlobalKey salesQuantityKey = GlobalKey();
  GlobalKey distanceKey = GlobalKey();
  GlobalKey hourKey = GlobalKey();
  GlobalKey minuteKey = GlobalKey();
  GlobalKey distance2Key = GlobalKey();
  GlobalKey hour2Key = GlobalKey();
  GlobalKey minute2Key = GlobalKey();
  GlobalKey transportTypeKey = GlobalKey();
  GlobalKey packageSelectKey = GlobalKey();
  GlobalKey section3_2_3Key = GlobalKey();
  GlobalKey transportUseOrNotKey = GlobalKey();
  GlobalKey section3_2_2Key = GlobalKey();
  GlobalKey uddesoKey = GlobalKey();
  GlobalKey section3_2_PartTwoKey = GlobalKey();

  Module3Model member = Module3Model();
  void clearMember() {
    member = Module3Model();
    notifyListeners();
  }
  void initializeData() {
    member.module4ModelList ??= [];

    if (part == 4) {
      member.module4ModelList ??= [];
    } else if (partConfigMap.containsKey(part)) {
      // Get configuration for the current part
      final config = partConfigMap[part]!;
      final items = config['items'] as List<Map<String, String>>;

      // Add items from configuration
      for (int i = 0; i < items.length; i++) {
        member.module4ModelList!.add(Module4Model(slNo: i + 1, title: items[i]['title']!, typeList: getLossReasonList(items[i]['typeList']!)));
      }
    }

    notifyListeners();
  }

  void toggleLossReason(int index, int reasonIndex, OtherStaticModel otherStaticModel) {
    if (member.module4ModelList![index].selectedLossReasons == null) {
      member.module4ModelList![index].selectedLossReasons = [];
    }
    if (member.module4ModelList![index].selectedLossReasons!.contains(otherStaticModel)) {
      member.module4ModelList![index].selectedLossReasons!.remove(otherStaticModel);
    } else {
      member.module4ModelList![index].selectedLossReasons!.add(otherStaticModel);
    }
    notifyListeners();
  }

  void updatedData() {
    notifyListeners();
  }

  bool handleLossAmountInput({required String value, required Module4Model moduleData, required double netQuantity, required int part}) {
    // Allow deletion - empty input
    if (value.isEmpty) {
      moduleData.lossAmountPerKg = null;
      moduleData.errorMessage = null;
      notifyListeners();
      return true;
    }

    // Try to parse input
    final parsed = double.tryParse(value);
    if (parsed == null) {
      final errorMsg = 'অবৈধ ইনপুট';
      moduleData.errorMessage = errorMsg;
      Fluttertoast.showToast(msg: errorMsg, toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM, backgroundColor: Colors.red, textColor: Colors.white, fontSize: 14.0);
      notifyListeners();
      return false;
    }

    // Calculate remaining quantity
    final double sumAll = member.module4ModelList!.fold(0, (s, it) => s + (it.lossAmountPerKg ?? 0));
    final double currentPrev = moduleData.lossAmountPerKg ?? 0;
    final double sumOther = sumAll - currentPrev;
    final double remaining = netQuantity - sumOther;

    // Check if remaining quantity is available
    if (remaining < 0) {
      final errorMsg = 'অধিক ক্ষতির জন্য কোনো খালি পরিমাণ আর নেই';
      moduleData.errorMessage = errorMsg;
      Fluttertoast.showToast(msg: errorMsg, toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM, backgroundColor: Colors.red, textColor: Colors.white, fontSize: 14.0);
      notifyListeners();
      return false;
    }

    // Check if input exceeds remaining
    if (parsed > remaining) {
      final errorMsg = 'শুধু ${remaining.toStringAsFixed(2)} কেজি পর্যন্ত দিয়েই এটা পূরণ করা যাবে';
      moduleData.errorMessage = errorMsg;
      Fluttertoast.showToast(msg: errorMsg, toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM, backgroundColor: Colors.red, textColor: Colors.white, fontSize: 14.0);
      notifyListeners();
      return false;
    }

    // Valid input - update values and clear error
    moduleData.lossPercentage = (parsed * 100.0) / netQuantity;
    moduleData.lossAmountPerKg = parsed;
    moduleData.errorMessage = null;

    if (part == 1) {
      moduleData.lossWithTotalProducersPerKg = parsed + netQuantity;
    } else {
      moduleData.lossWithTotalProducersPerKgMinus = netQuantity - parsed;
    }

    notifyListeners();
    return true;
  }

  void updateModule4(int index, Module4Model module4Model) {
    if (index >= 0) {
      member.module4ModelList![index].useMachineOrNot = module4Model.useMachineOrNot;
      member.module4ModelList![index].lossReasonData = module4Model.lossReasonData;
    }
    notifyListeners();
  }

  /// Configuration map for each part type with titles and loss reason lists
  final Map<int, Map<String, dynamic>> partConfigMap = {
    1: {
      'count': 7,
      'items': [
        {'typeList': 'lossReasonListCowHenPartOneFirst', 'title': 'ব্যবস্থাপনা ও অবকাঠামোগত পর্যায়ে ক্ষতি'},
        {'typeList': 'lossReasonListCowHenPartOneSecond', 'title': 'স্টোরেজ/সংরক্ষণ পর্যায়ে ক্ষতি '},
        {'typeList': 'lossReasonListCowHenPartOneThird', 'title': 'গ্রেডিং/বাছাইকরণ পর্যায়ে ক্ষতি'},
        {'typeList': 'lossReasonListCowHenPartOneFourth', 'title': 'ওজনকরণ পর্যায়ে ক্ষতি'},
        {'typeList': 'lossReasonListCowHenPartOneFifth', 'title': 'বিক্রয় স্থানে পরিবহন পর্যায়ে ক্ষতি'},
        {'typeList': 'lossReasonListCowHenPartOneSixth', 'title': 'লোডিং ও আনলোডিং পর্যায়ে ক্ষতি'},
        {'typeList': 'lossReasonListCowHenPartOneSeventh', 'title': 'অন্যান্য ক্ষতি (উল্লেখ করুন)'},
      ],
    },
    2: {
      'count': 10,
      'items': [
        {'typeList': 'lossReasonListCowHenPartTwoFirst', 'title': 'পশু ক্রয় ও সংগ্রহ পর্যায়ে'},
        {'typeList': 'lossReasonListCowHenPartTwoSecond', 'title': 'বাছাই ও গ্রেডিং পর্যায়ে ক্ষতি'},
        {'typeList': 'lossReasonListCowHenPartTwoThird', 'title': 'ওজনকরণ পর্যায়ে ক্ষতি'},
        {'typeList': 'lossReasonListCowHenPartTwoFourth', 'title': 'ক্রয়ের স্থান থেকে আপনার প্রতিষ্ঠানে পরিবহন পর্যায়ে ক্ষতি'},
        {'typeList': 'lossReasonListCowHenPartTwoFifth', 'title': 'প্রদর্শন পর্যায়ে ক্ষতি'},
        {'typeList': 'lossReasonListCowHenPartTwoSixth', 'title': 'স্টোরেজ পর্যায়ে ক্ষতি'},
        {'typeList': 'lossReasonListCowHenPartTwoSeventh', 'title': 'আপনার প্রতিষ্ঠান হতে বিক্রয়ের স্থানে পরিবহন পর্যায়ে ক্ষতি'},
        {'typeList': 'lossReasonListCowHenPartTwoEighth', 'title': 'লোডিং/আনলোডিং পর্যায়ে ক্ষতি'},
        {'typeList': 'lossReasonListCowHenPartTwoNinth', 'title': 'হস্তান্তর (Handover) পর্যায়ে ক্ষতি'},
        {'typeList': 'lossReasonListCowHenPartTwoTenth', 'title': 'অন্যান্য ক্ষতি (উল্লেখ করুন)'},
      ],
    },
    3: {
      'count': 11,
      'items': [
        {'typeList': 'lossReasonListCowHenPartThreeFirst', 'title': 'কাঁচামাল গ্রহণ'},
        {'typeList': 'lossReasonListCowHenPartThreeSecond', 'title': 'ক্রয়ের স্থান থেকে আপনার প্রতিষ্ঠানে পরিবহন পর্যায়ে ক্ষতি'},
        {'typeList': 'lossReasonListCowHenPartThreeThird', 'title': 'কর্তন পার্যায়ে ক্ষতি'},
        {'typeList': 'lossReasonListCowHenPartThreeFourth', 'title': 'প্রাথমিক বাছাই ও ট্রিমিং'},
        {'typeList': 'lossReasonListCowHenPartThreeFifth', 'title': 'ধোয়া ও পরিষ্কারকরণ'},
        {'typeList': 'lossReasonListCowHenPartThreeSixth', 'title': 'গ্রাইন্ডিং, মিক্সিং/ফর্মুলেশন/ ফর্মিং/কোটিং / ব্রেডিং'},
        {'typeList': 'lossReasonListCowHenPartThreeSeventh', 'title': 'প্যাকেজিং ও লেবেলিং'},
        {'typeList': 'lossReasonListCowHenPartThreeEighth', 'title': 'কোল্ড স্টোরেজ'},
        {'typeList': 'lossReasonListCowHenPartThreeNinth', 'title': 'আপনার প্রতিষ্ঠান হতে বিক্রয়ের স্থানে পরিবহন পর্যায়ে ক্ষতি'},
        {'typeList': 'lossReasonListCowHenPartThreeTenth', 'title': 'বাজারজাতকরণ'},
        {'typeList': 'lossReasonListCowHenPartThreeEleventh', 'title': 'অন্যান্য ক্ষতি (উল্লেখ করুন)'},
      ],
    },
    5: {
      'count': 11,
      'items': [
        {'typeList': 'lossReasonListCowHenPartThreeFirst', 'title': 'কাঁচামাল গ্রহণ'},
        {'typeList': 'lossReasonListCowHenPartThreeSecond', 'title': 'ক্রয়ের স্থান থেকে আপনার প্রতিষ্ঠানে পরিবহন পর্যায়ে ক্ষতি'},
        {'typeList': 'lossReasonListCowHenPartThreeThird', 'title': 'কর্তন পার্যায়ে ক্ষতি'},
        {'typeList': 'lossReasonListCowHenPartThreeFourth', 'title': 'প্রাথমিক বাছাই ও ট্রিমিং'},
        {'typeList': 'lossReasonListCowHenPartThreeFifth', 'title': 'ধোয়া ও পরিষ্কারকরণ'},
        {'typeList': 'lossReasonListCowHenPartThreeSixth', 'title': 'গ্রাইন্ডিং, মিক্সিং/ফর্মুলেশন/ ফর্মিং/কোটিং / ব্রেডিং'},
        {'typeList': 'lossReasonListCowHenPartThreeSeventh', 'title': 'প্যাকেজিং ও লেবেলিং'},
        {'typeList': 'lossReasonListCowHenPartThreeEighth', 'title': 'কোল্ড স্টোরেজ'},
        {'typeList': 'lossReasonListCowHenPartThreeNinth', 'title': 'আপনার প্রতিষ্ঠান হতে বিক্রয়ের স্থানে পরিবহন পর্যায়ে ক্ষতি'},
        {'typeList': 'lossReasonListCowHenPartThreeTenth', 'title': 'বাজারজাতকরণ'},
        {'typeList': 'lossReasonListCowHenPartThreeEleventh', 'title': 'অন্যান্য ক্ষতি (উল্লেখ করুন)'},
      ],
    },
  };

  /// Copy common loss-related fields from source to target model
  void _copyCommonFields(Module4Model source, Module4Model target) {
    target.lossAmountPerKg = source.lossAmountPerKg;
    target.lossPercentage = source.lossPercentage;
    target.useMachineOrNot = source.useMachineOrNot;
    target.lossReasonData = source.lossReasonData;
    target.selectedLossReasons = source.selectedLossReasons;
  }

  void initializeValue(Module3Model m) {
    member = m;
    if(m.module4ModelList==null || m.module4ModelList!.isEmpty) return;
    if (part == 4) {
      member.module4ModelList!.clear();
      member.module4ModelList ??= [];
    } else if (partConfigMap.containsKey(part)) {
      final config = partConfigMap[part]!;
      final items = config['items'] as List<Map<String, String>>;
      final count = config['count'] as int;
      for (int i = 0; i < count; i++) {
        _copyCommonFields(m.module4ModelList![i], member.module4ModelList![i]);
        member.module4ModelList![i].typeList = getLossReasonList(items[i]['typeList']!);
        member.module4ModelList![i].title = items[i]['title']!;
      }
    }

    notifyListeners();
  }
}
