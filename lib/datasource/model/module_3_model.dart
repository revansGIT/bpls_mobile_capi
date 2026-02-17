import 'package:bpls_mobile/datasource/model/module_4_model.dart';
import 'package:bpls_mobile/datasource/static_data/other_static_data.dart';
import 'package:flutter/cupertino.dart';

class Module3Model {
  OtherStaticModel? otherStaticModel;
  int? landQuantity;
  double? productionQuantity;
  double? otherSourceQuantity;
  double? salesQuantity;
  List<OtherStaticModel> section3_2_2List = [];
  List<OtherStaticModel> section3_2_3List = [];
  List<OtherStaticModel> section3_2_6List = [];
  List<OtherStaticModel> section3_2_7List = [];
  List<OtherStaticModel> section3_2_PartTwoOne = [];
  String section3_2_3OtherText = '';
  String section3_2_6OtherText = '';
  String section3_2_7OtherText = '';
  TextEditingController section3_1_8DistanceController = TextEditingController();
  TextEditingController section3_1_8HourController = TextEditingController();
  TextEditingController section3_1_8MinuteController = TextEditingController();
  TextEditingController section3_1_9DistanceController = TextEditingController();
  TextEditingController section3_1_9HourController = TextEditingController();
  TextEditingController section3_1_9MinuteController = TextEditingController();
  String? distanceLabel1_8;
  String? hourLabel1_8;
  String? minuteLabel1_8;
  String? distanceLabel1_9;
  String? hourLabel1_9;
  String? minuteLabel1_9;
  List<Module4Model>? module4ModelList;

  FocusNode section3_1_8DistanceFocusNode = FocusNode();
  FocusNode section3_1_8HourFocusNode = FocusNode();
  FocusNode section3_1_8MinuteFocusNode = FocusNode();
  FocusNode section3_1_9DistanceFocusNode = FocusNode();
  FocusNode section3_1_9HourFocusNode = FocusNode();
  FocusNode section3_1_9MinuteFocusNode = FocusNode();

  OtherStaticModel? uddesshoType;
  OtherStaticModel? transportUseOrNo;

  // Controllers
  late TextEditingController controllerLandQuantity;
  late TextEditingController controllerProductionQuantity;
  late TextEditingController controllerOtherSourceQuantity;
  late TextEditingController controllerSalesQuantity;

  // Focus nodes
  late FocusNode focusNodeLandQuantity;
  late FocusNode focusNodeProductionQuantity;
  late FocusNode focusNodeOtherSourceQuantity;
  late FocusNode focusNodeSalesQuantity;

  Module3Model({
    this.otherStaticModel,
    this.landQuantity,
    this.productionQuantity,
    this.otherSourceQuantity,
    this.salesQuantity,
    this.module4ModelList,
    List<OtherStaticModel>? section3_2_2List,
    List<OtherStaticModel>? section3_2_3List,
    List<OtherStaticModel>? section3_2_6List,
    List<OtherStaticModel>? section3_2_7List,
    List<OtherStaticModel>? section3_2_PartTwoOne,
    this.section3_2_3OtherText = '',
    this.section3_2_6OtherText = '',
    this.section3_2_7OtherText = '',
    this.uddesshoType,
    this.transportUseOrNo,
    this.distanceLabel1_8 = '',
    this.hourLabel1_8 = '',
    this.minuteLabel1_8 = '',
    this.distanceLabel1_9 = '',
    this.hourLabel1_9 = '',
    this.minuteLabel1_9 = '',
  }) {
    this.section3_2_2List = List<OtherStaticModel>.from(section3_2_2List ?? []);
    this.section3_2_3List = List<OtherStaticModel>.from(section3_2_3List ?? []);
    this.section3_2_6List = List<OtherStaticModel>.from(section3_2_6List ?? []);
    this.section3_2_7List = List<OtherStaticModel>.from(section3_2_7List ?? []);
    this.section3_2_PartTwoOne = List<OtherStaticModel>.from(section3_2_PartTwoOne ?? []);
    _initializeControllers();
  }

  void changeUddesshoType(OtherStaticModel? val) {
    uddesshoType = val;
  }

  void changeTransportUseOrNo(OtherStaticModel? val) {
    transportUseOrNo = val;
  }

  void toggleSection3_2(OtherStaticModel val, int section) {
    if (section == 2) {
      if (section3_2_2List.contains(val)) {
        section3_2_2List.remove(val);
      } else {
        section3_2_2List.add(val);
      }
    } else if (section == 3) {
      if (section3_2_3List.contains(val)) {
        section3_2_3List.remove(val);
      } else {
        section3_2_3List.add(val);
      }
    } else if (section == 6) {
      if (section3_2_6List.contains(val)) {
        section3_2_6List.remove(val);
      } else {
        section3_2_6List.add(val);
      }
    } else if (section == 7) {
      if (section3_2_7List.contains(val)) {
        section3_2_7List.remove(val);
      } else {
        section3_2_7List.add(val);
      }
    } else if (section == 8) {
      if (section3_2_PartTwoOne.contains(val)) {
        section3_2_PartTwoOne.remove(val);
      } else {
        section3_2_PartTwoOne.add(val);
      }
    }
  }

  void updateSection3_2OtherText(String val, int section) {
    if (section == 3) {
      section3_2_3OtherText = val;
    } else if (section == 6) {
      section3_2_6OtherText = val;
    } else if (section == 7) {
      section3_2_7OtherText = val;
    }
  }

  void _initializeControllers() {
    controllerLandQuantity = TextEditingController(text: landQuantity?.toString() ?? '');
    controllerProductionQuantity = TextEditingController(text: productionQuantity?.toString() ?? '');
    controllerOtherSourceQuantity = TextEditingController(text: otherSourceQuantity?.toString() ?? '');
    controllerSalesQuantity = TextEditingController(text: salesQuantity?.toString() ?? '');
    section3_1_8DistanceController = TextEditingController(text: distanceLabel1_8 ?? "");
    section3_1_8HourController = TextEditingController(text: hourLabel1_8 ?? "");
    section3_1_8MinuteController = TextEditingController(text: minuteLabel1_8 ?? "");
    section3_1_9DistanceController = TextEditingController(text: distanceLabel1_9 ?? "");
    section3_1_9HourController = TextEditingController(text: hourLabel1_9 ?? "");
    section3_1_9MinuteController = TextEditingController(text: minuteLabel1_9 ?? "");

    focusNodeLandQuantity = FocusNode();
    focusNodeProductionQuantity = FocusNode();
    focusNodeOtherSourceQuantity = FocusNode();
    focusNodeSalesQuantity = FocusNode();
    section3_1_8DistanceFocusNode = FocusNode();
    section3_1_8HourFocusNode = FocusNode();
    section3_1_8MinuteFocusNode = FocusNode();
    section3_1_9DistanceFocusNode = FocusNode();
    section3_1_9HourFocusNode = FocusNode();
    section3_1_9MinuteFocusNode = FocusNode();
  }

  void updateControllers() {
    controllerLandQuantity.text = landQuantity?.toString() ?? '';
    controllerProductionQuantity.text = productionQuantity?.toString() ?? '';
    controllerOtherSourceQuantity.text = otherSourceQuantity?.toString() ?? '';
    controllerSalesQuantity.text = salesQuantity?.toString() ?? '';
    section3_1_8DistanceController.text = distanceLabel1_8 ?? "";
    section3_1_8HourController.text = hourLabel1_8 ?? "";
    section3_1_8MinuteController.text = minuteLabel1_8 ?? "";
    section3_1_9DistanceController.text = distanceLabel1_9 ?? "";
    section3_1_9HourController.text = hourLabel1_9 ?? "";
    section3_1_9MinuteController.text = minuteLabel1_9 ?? "";
  }

  void dispose() {
    controllerLandQuantity.dispose();
    controllerProductionQuantity.dispose();
    controllerOtherSourceQuantity.dispose();
    controllerSalesQuantity.dispose();
    section3_1_8DistanceController.dispose();
    section3_1_8HourController.dispose();
    section3_1_8MinuteController.dispose();
    section3_1_9DistanceController.dispose();
    section3_1_9HourController.dispose();
    section3_1_9MinuteController.dispose();

    focusNodeLandQuantity.dispose();
    focusNodeProductionQuantity.dispose();
    focusNodeOtherSourceQuantity.dispose();
    focusNodeSalesQuantity.dispose();
    section3_1_8DistanceFocusNode.dispose();
    section3_1_8HourFocusNode.dispose();
    section3_1_8MinuteFocusNode.dispose();
    section3_1_9DistanceFocusNode.dispose();
    section3_1_9HourFocusNode.dispose();
    section3_1_9MinuteFocusNode.dispose();
  }

  double get computedTotalQuantity => (productionQuantity ?? 0) + (otherSourceQuantity ?? 0) - (salesQuantity ?? 0);

  double get computedTotalQuantityPartTwo => (otherSourceQuantity ?? 0);

  static const _sentinel = Object();

  Module3Model copyWith({
    Object? otherStaticModel = _sentinel,
    Object? landQuantity = _sentinel,
    Object? productionQuantity = _sentinel,
    Object? otherSourceQuantity = _sentinel,
    Object? salesQuantity = _sentinel,
    Object? section3_2_2List = _sentinel,
    Object? section3_2_3List = _sentinel,
    Object? section3_2_6List = _sentinel,
    Object? section3_2_7List = _sentinel,
    Object? section3_2_PartTwoOne = _sentinel,
    Object? section3_2_3OtherText = _sentinel,
    Object? section3_2_6OtherText = _sentinel,
    Object? section3_2_7OtherText = _sentinel,
    Object? uddesshoType = _sentinel,
    Object? transportUseOrNo = _sentinel,
    Object? distanceLabel1_8 = _sentinel,
    Object? hourLabel1_8 = _sentinel,
    Object? minuteLabel1_8 = _sentinel,
    Object? distanceLabel1_9 = _sentinel,
    Object? hourLabel1_9 = _sentinel,
    Object? minuteLabel1_9 = _sentinel,
    Object? module4ModelList = _sentinel,
  }) {
    return Module3Model(
      otherStaticModel: otherStaticModel == _sentinel ? this.otherStaticModel : otherStaticModel as OtherStaticModel?,
      landQuantity: landQuantity == _sentinel ? this.landQuantity : landQuantity as int?,
      productionQuantity: productionQuantity == _sentinel ? this.productionQuantity : productionQuantity as double?,
      otherSourceQuantity: otherSourceQuantity == _sentinel ? this.otherSourceQuantity : otherSourceQuantity as double?,
      salesQuantity: salesQuantity == _sentinel ? this.salesQuantity : salesQuantity as double?,
      section3_2_2List: section3_2_2List == _sentinel ? this.section3_2_2List : section3_2_2List as List<OtherStaticModel>,
      section3_2_3List: section3_2_3List == _sentinel ? this.section3_2_3List : section3_2_3List as List<OtherStaticModel>,
      section3_2_6List: section3_2_6List == _sentinel ? this.section3_2_6List : section3_2_6List as List<OtherStaticModel>,
      section3_2_7List: section3_2_7List == _sentinel ? this.section3_2_7List : section3_2_7List as List<OtherStaticModel>,
      section3_2_PartTwoOne: section3_2_PartTwoOne == _sentinel ? this.section3_2_PartTwoOne : section3_2_PartTwoOne as List<OtherStaticModel>,
      section3_2_3OtherText: section3_2_3OtherText == _sentinel ? this.section3_2_3OtherText : section3_2_3OtherText as String,
      section3_2_6OtherText: section3_2_6OtherText == _sentinel ? this.section3_2_6OtherText : section3_2_6OtherText as String,
      section3_2_7OtherText: section3_2_7OtherText == _sentinel ? this.section3_2_7OtherText : section3_2_7OtherText as String,
      uddesshoType: uddesshoType == _sentinel ? this.uddesshoType : uddesshoType as OtherStaticModel?,
      transportUseOrNo: transportUseOrNo == _sentinel ? this.transportUseOrNo : transportUseOrNo as OtherStaticModel?,
      distanceLabel1_8: distanceLabel1_8 == _sentinel ? this.distanceLabel1_8 : distanceLabel1_8 as String?,
      hourLabel1_8: hourLabel1_8 == _sentinel ? this.hourLabel1_8 : hourLabel1_8 as String?,
      minuteLabel1_8: minuteLabel1_8 == _sentinel ? this.minuteLabel1_8 : minuteLabel1_8 as String?,
      distanceLabel1_9: distanceLabel1_9 == _sentinel ? this.distanceLabel1_9 : distanceLabel1_9 as String?,
      hourLabel1_9: hourLabel1_9 == _sentinel ? this.hourLabel1_9 : hourLabel1_9 as String?,
      minuteLabel1_9: minuteLabel1_9 == _sentinel ? this.minuteLabel1_9 : minuteLabel1_9 as String?,
      module4ModelList: module4ModelList == _sentinel ? this.module4ModelList : module4ModelList as List<Module4Model>?,
    );
  }

  factory Module3Model.fromJson(Map<String, dynamic> json) {
    return Module3Model(
      otherStaticModel: json['otherStaticModel'] != null ? OtherStaticModel.fromJson(Map<String, dynamic>.from(json['otherStaticModel'])) : null,
      landQuantity: json['landQuantity'],
      productionQuantity: json['productionQuantity'] == null ? null : (json['productionQuantity'] as num).toDouble(),
      otherSourceQuantity: json['otherSourceQuantity'] == null ? null : (json['otherSourceQuantity'] as num).toDouble(),
      salesQuantity: json['salesQuantity'] == null ? null : (json['salesQuantity'] as num).toDouble(),
      section3_2_2List: (json['section3_2_2List'] as List<dynamic>?)?.map((e) => OtherStaticModel.fromJson(Map<String, dynamic>.from(e))).toList() ?? [],
      section3_2_3List: (json['section3_2_3List'] as List<dynamic>?)?.map((e) => OtherStaticModel.fromJson(Map<String, dynamic>.from(e))).toList() ?? [],
      section3_2_6List: (json['section3_2_6List'] as List<dynamic>?)?.map((e) => OtherStaticModel.fromJson(Map<String, dynamic>.from(e))).toList() ?? [],
      section3_2_7List: (json['section3_2_7List'] as List<dynamic>?)?.map((e) => OtherStaticModel.fromJson(Map<String, dynamic>.from(e))).toList() ?? [],
      section3_2_PartTwoOne: (json['section3_2_PartTwoOne'] as List<dynamic>?)?.map((e) => OtherStaticModel.fromJson(Map<String, dynamic>.from(e))).toList() ?? [],
      section3_2_3OtherText: json['section3_2_3OtherText'] ?? '',
      section3_2_6OtherText: json['section3_2_6OtherText'] ?? '',
      section3_2_7OtherText: json['section3_2_7OtherText'] ?? '',
      uddesshoType: json['uddesshoType'] != null ? OtherStaticModel.fromJson(Map<String, dynamic>.from(json['uddesshoType'])) : null,
      transportUseOrNo: json['transportUseOrNo'] != null ? OtherStaticModel.fromJson(Map<String, dynamic>.from(json['transportUseOrNo'])) : null,
      distanceLabel1_8: json['distanceLabel1_8'],
      hourLabel1_8: json['hourLabel1_8'],
      minuteLabel1_8: json['minuteLabel1_8'],
      distanceLabel1_9: json['distanceLabel1_9'],
      hourLabel1_9: json['hourLabel1_9'],
      minuteLabel1_9: json['minuteLabel1_9'],
      module4ModelList: (json['loss_data'] as List<dynamic>?)
          ?.map((e) => Module4Model.fromJson(Map<String, dynamic>.from(e)))
          .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['otherStaticModel'] = otherStaticModel?.toJson();
    data['landQuantity'] = landQuantity;
    data['productionQuantity'] = productionQuantity;
    data['otherSourceQuantity'] = otherSourceQuantity;
    data['salesQuantity'] = salesQuantity;
    data['section3_2_2List'] = section3_2_2List.map((e) => e.toJson()).toList();
    data['section3_2_3List'] = section3_2_3List.map((e) => e.toJson()).toList();
    data['section3_2_6List'] = section3_2_6List.map((e) => e.toJson()).toList();
    data['section3_2_7List'] = section3_2_7List.map((e) => e.toJson()).toList();
    data['section3_2_PartTwoOne'] = section3_2_PartTwoOne.map((e) => e.toJson()).toList();
    data['section3_2_3OtherText'] = section3_2_3OtherText;
    data['section3_2_6OtherText'] = section3_2_6OtherText;
    data['section3_2_7OtherText'] = section3_2_7OtherText;
    data['uddesshoType'] = uddesshoType?.toJson();
    data['transportUseOrNo'] = transportUseOrNo?.toJson();
    data['distanceLabel1_8'] = distanceLabel1_8;
    data['hourLabel1_8'] = hourLabel1_8;
    data['minuteLabel1_8'] = minuteLabel1_8;
    data['distanceLabel1_9'] = distanceLabel1_9;
    data['hourLabel1_9'] = hourLabel1_9;
    data['minuteLabel1_9'] = minuteLabel1_9;
    data['loss_data'] = module4ModelList?.map((e) => e.toJson()).toList();
    return data;
  }
}
