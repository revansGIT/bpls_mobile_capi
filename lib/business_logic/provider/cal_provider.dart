import 'package:bpls_mobile/datasource/model/module_3_model.dart';
import 'package:bpls_mobile/datasource/model/module_4_model.dart';
import 'package:bpls_mobile/datasource/static_data/other_static_data.dart';
import 'package:bpls_mobile/helper/helper.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CalProvider with ChangeNotifier {

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

    if (part == 1) {
      member.module4ModelList ??= [];
    } else if (_partConfigMap.containsKey(part)) {
      // Get configuration for the current part
      final config = _partConfigMap[part]!;
      final items = config['items'] as List<Map<String, String>>;

      // Add items from configuration
      for (int i = 0; i < items.length; i++) {
        member.module4ModelList!.add(
          Module4Model(
            slNo: i + 1,
            title: items[i]['title']!,
            typeList: getLossReasonList(items[i]['typeList']!),
          ),
        );
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

    moduleData.lossAmountPerKg = parsed;
    moduleData.lossPercentage = (parsed * 100.0) / netQuantity;
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
  final Map<int, Map<String, dynamic>> _partConfigMap = {
    2: {
      'count': 9,
      'items': [
        {'typeList': 'lossReasonListPartTwo1', 'title': 'ক্রয়ের স্থান থেকে ব্যাপারি/পাইকারি/আড়তদারে পরিবহন পর্যায়ে ক্ষতি'},
        {'typeList': 'lossReasonListPartTwo2', 'title': 'পরিষ্কার করা/উইনো (ঝাড়া) করা পর্যায়ে ক্ষতি'},
        {'typeList': 'lossReasonListPartTwo3', 'title': 'ওজনকরণ পর্যায়ে ক্ষতি'},
        {'typeList': 'lossReasonListPartTwo4', 'title': 'লটিং/রি-লটিং/সাজানো পর্যায়ে ক্ষতি'},
        {'typeList': 'lossReasonListPartTwo5', 'title': 'লোড-আনলোড পর্যায়ে ক্ষতি'},
        {'typeList': 'lossReasonListPartTwo6', 'title': 'বাজারজাতকরণের জন্য প্যাকেজিং পর্যায়ে ক্ষতি'},
        {'typeList': 'lossReasonListPartTwo7', 'title': 'বাজারজাত/হস্তান্তরের জন্য পরিবহন পর্যায়ে ক্ষতি'},
        {'typeList': 'lossReasonListPartTwo8', 'title': 'স্টোরেজ পর্যায়ে ক্ষতি'},
        {'typeList': 'lossReasonList96', 'title': 'অন্যান্য ক্ষতি (উল্লেখ করুন)'},
      ]
    },
    3: {
      'count': 6,
      'items': [
        {'typeList': 'lossReasonListPartThree1', 'title': 'বাড়ি/খামার/বাজার থেকে গোডাউনে পরিবহন পর্যায়ে ক্ষতি'},
        {'typeList': 'lossReasonListPartThree2', 'title': 'গোডাউন থেকে বাজারজাতকরণে পরিবহন পর্যায়ে ক্ষতি'},
        {'typeList': 'lossReasonListPartThree3', 'title': 'প্যাকেজিং/রি-প্যাকেজিং পর্যায়ে ক্ষতি'},
        {'typeList': 'lossReasonListPartThree4', 'title': 'লোড-আনলোড পর্যায়ে ক্ষতি'},
        {'typeList': 'lossReasonListPartThree5', 'title': 'স্টোরেজ পর্যায়ে ক্ষতি'},
        {'typeList': 'lossReasonList96', 'title': 'অন্যান্য ক্ষতি (উল্লেখ করুন)'},
      ]
    },
    4: {
      'count': 7,
      'items': [
        {'typeList': 'lossReasonListPartFour6', 'title': 'ছাটাই/ভাঙ্গানো (Husking) পর্যায়ে ক্ষতি'},
        {'typeList': 'lossReasonListPartFour7', 'title': 'পলিশিংকরণ পর্যায়ে ক্ষতি'},
        {'typeList': 'lossReasonListPartFour8', 'title': 'বাছাইকরণ/গ্রেডিং পর্যায়ে ক্ষতি'},
        {'typeList': 'lossReasonListPartFour9', 'title': 'লোড-আনলোড পর্যায়ে ক্ষতি'},
        {'typeList': 'lossReasonListPartFour10', 'title': 'অটো/চাতাল মিল থেকে বাজারজাতকরণে পরিবহন পর্যায়ে ক্ষতি'},
        {'typeList': 'lossReasonListPartFour11', 'title': 'স্টোরেজ পর্যায়ে ক্ষতি'},
        {'typeList': 'lossReasonList96', 'title': 'অন্যান্য ক্ষতি (উল্লেখ করুন)'},
      ]
    },
    5: {
      'count': 16,
      'items': [
        {'typeList': 'lossReasonListPartFive1', 'title': 'কাঁচামাল গ্রহণ (Receiving)'},
        {'typeList': 'lossReasonListPartFive2', 'title': 'গওজন/পরিমাপ ও আনলোডিং'},
        {'typeList': 'lossReasonListPartFive3', 'title': 'পরিষ্কার/ধোয়া'},
        {'typeList': 'lossReasonListPartFive4', 'title': 'লকাটা/ছাঁটাই/গ্রেডিং'},
        {'typeList': 'lossReasonListPartFive5', 'title': 'মেশিনে প্রক্রিয়াকরণ'},
        {'typeList': 'lossReasonListPartFive6', 'title': 'তাপ প্রয়োগ (সিদ্ধ/ভাজা/শুকানো)'},
        {'typeList': 'lossReasonListPartFive7', 'title': 'শীতলকরণ/কুলিং'},
        {'typeList': 'lossReasonListPartFive8', 'title': 'প্যাকেজিং সময়'},
        {'typeList': 'lossReasonListPartFive9', 'title': 'রিপ্যাকেজিং/ লেবেলিং'},
        {'typeList': 'lossReasonListPartFive10', 'title': 'অস্থায়ী সংরক্ষণ (ইউনিটের ভিতরে)'},
        {'typeList': 'lossReasonListPartFive11', 'title': 'গুদামজাতকরণ (Storage)'},
        {'typeList': 'lossReasonListPartFive12', 'title': 'ইউনিট থেকে পরিবহন'},
        {'typeList': 'lossReasonListPartFive13', 'title': 'বাজারজাতকরণে বিলম্ব'},
        {'typeList': 'lossReasonListPartFive14', 'title': 'মেয়াদোত্তীর্ণ (Expiry)'},
        {'typeList': 'lossReasonListPartFive15', 'title': 'প্রাকৃতিক ও বাহ্যিক কারণ'},
        {'typeList': 'lossReasonList96', 'title': 'অন্যান্য ক্ষতি (উল্লেখ করুন)'},
      ]
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
    if (part == 1) {
      member.module4ModelList!.clear();
      member.module4ModelList ??= [];
    } else if (_partConfigMap.containsKey(part)) {
      final config = _partConfigMap[part]!;
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
