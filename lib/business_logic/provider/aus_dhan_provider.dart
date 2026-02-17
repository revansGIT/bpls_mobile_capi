import 'package:bpls_mobile/datasource/model/module_3_model.dart';
import 'package:bpls_mobile/datasource/model/module_4_model.dart';
import 'package:bpls_mobile/datasource/static_data/other_static_data.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AusDhanProvider with ChangeNotifier {

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

    member.module4ModelList!.add(Module4Model(slNo: 1, title: 'ফসল তোলা/কাটা/কর্তন/আঁটি বাঁধাই পর্যায়ে ক্ষতি', typeList: lossReasonList1));
    member.module4ModelList!.add(Module4Model(slNo: 2, title: 'মাঠ থেকে বাড়ি বা মাড়াই এর স্থানে আনার মধ্যবর্তী পর্যায়ে পরিবহণ জনিত ক্ষতি', typeList: lossReasonList2));
    member.module4ModelList!.add(Module4Model(slNo: 3, title: 'ফসল মাড়াই পর্যায়ে ক্ষতি (বাড়িতে/জমিতে)', typeList: lossReasonList3));
    member.module4ModelList!.add(Module4Model(slNo: 4, title: 'পরিষ্কার করা/উইনো (ঝাড়া) করা পর্যায়ে ক্ষতি', typeList: lossReasonList4));
    member.module4ModelList!.add(Module4Model(slNo: 5, title: 'সিদ্ধ/শুকানো পর্যায়ে ক্ষতি', typeList: lossReasonList5));
    member.module4ModelList!.add(Module4Model(slNo: 6, title: 'ওজন করার পর্যায়ে ক্ষতি', typeList: lossReasonList6));
    member.module4ModelList!.add(Module4Model(slNo: 7, title: 'প্যাকেজিং পর্যায়ে ক্ষতি', typeList: lossReasonList7));
    member.module4ModelList!.add(Module4Model(slNo: 8, title: 'লোড-আনলোড পর্যায়ে ক্ষতি', typeList: lossReasonList8));
    member.module4ModelList!.add(Module4Model(slNo: 9, title: 'পরিবহন/হস্তান্তর পর্যায়ে ক্ষতি', typeList: lossReasonList9));
    member.module4ModelList!.add(Module4Model(slNo: 10, title: 'স্টোরেজ পর্যায়ে ক্ষতি', typeList: lossReasonList10));
    member.module4ModelList!.add(Module4Model(slNo: 11, title: 'অন্যান্য ক্ষতি (উল্লেখ করুন)', typeList: lossReasonList96));
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

  void initializeValue(Module3Model m) {
    member = m;
    if(m.module4ModelList==null || m.module4ModelList!.isEmpty) return;
    for (int i = 0; i < m.module4ModelList!.length; i++) {
      member.module4ModelList![i].lossAmountPerKg = m.module4ModelList![i].lossAmountPerKg;
      member.module4ModelList![i].lossPercentage = m.module4ModelList![i].lossPercentage;
      member.module4ModelList![i].useMachineOrNot = m.module4ModelList![i].useMachineOrNot;
      member.module4ModelList![i].lossReasonData = m.module4ModelList![i].lossReasonData;
      member.module4ModelList![i].selectedLossReasons = m.module4ModelList![i].selectedLossReasons;
      if (i== 0) {
        member.module4ModelList![i].typeList= lossReasonList1;
      }else if (i== 1) {
        member.module4ModelList![i].typeList= lossReasonList2;
      }else if (i== 2) {
        member.module4ModelList![i].typeList= lossReasonList3;
      }else if (i== 3) {
        member.module4ModelList![i].typeList= lossReasonList4;
      }else if (i== 4) {
        member.module4ModelList![i].typeList= lossReasonList5;
      }else if (i== 5) {
        member.module4ModelList![i].typeList= lossReasonList6;
      }else if (i== 6) {
        member.module4ModelList![i].typeList= lossReasonList7;
      }else if (i== 7) {
        member.module4ModelList![i].typeList= lossReasonList8;
      }else if (i== 8) {
        member.module4ModelList![i].typeList= lossReasonList9;
      }else if (i== 9) {
        member.module4ModelList![i].typeList= lossReasonList10;
      }else if (i== 10) {
        member.module4ModelList![i].typeList = lossReasonList96;
      }
    }
    notifyListeners();
  }
}
