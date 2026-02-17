import 'package:bpls_mobile/datasource/static_data/other_static_data.dart';
import 'package:flutter/cupertino.dart';

class Module4Model {
  OtherStaticModel? typeData;
  int? slNo;
  String? title;
  double? lossAmountPerKg;
  double? lossPercentage;
  OtherStaticModel? lossReasonData;
  OtherStaticModel? useMachineOrNot;
  double? lossWithTotalProducersPerKg;
  double? lossWithTotalProducersPerKgMinus;
  List<OtherStaticModel>? typeList;
  List<OtherStaticModel>? selectedLossReasons;
  String? otherReasons;
  String? errorMessage; // Error state for validation

  Module4Model({
    this.typeData,
    this.slNo,
    this.title,
    this.typeList,
    this.otherReasons,
    this.selectedLossReasons,
    this.lossWithTotalProducersPerKgMinus,
    this.lossWithTotalProducersPerKg,
    this.lossAmountPerKg,
    this.lossPercentage,
    this.useMachineOrNot,
    this.lossReasonData,
  }) {
    initializeControllers();
  }

  Module4Model.fromJson(dynamic json) {
    typeData = json['type_data'] != null ? OtherStaticModel.fromJson(Map<String, dynamic>.from(json['type_data'])) : null;
    slNo = _toInt(json['sl_no']);
    title = json['title']?.toString();
    lossWithTotalProducersPerKgMinus = _toDouble(json['loss_with_total_producers_per_kg_minus']);
    lossWithTotalProducersPerKg = _toDouble(json['loss_with_total_producers_per_kg']);
    lossAmountPerKg = _toDouble(json['loss_amount_per_kg']);
    if(json['selected_loss_reasons'] != null) {
      selectedLossReasons = (json['selected_loss_reasons'] as List).map((v) => OtherStaticModel.fromJson(Map<String, dynamic>.from(v))).toList();
    }
    otherReasons = json['other_reasons']?.toString();
    lossPercentage = _toDouble(json['loss_percentage']);
    useMachineOrNot = json['use_machine_or_not'] != null ? OtherStaticModel.fromJson(Map<String, dynamic>.from(json['use_machine_or_not'])) : null;
    lossReasonData = json['loss_reason_data'] != null ? OtherStaticModel.fromJson(Map<String, dynamic>.from(json['loss_reason_data'])) : null;
    initializeControllers();
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type_data'] = typeData?.toJson();
    map['sl_no'] = slNo;
    map['title'] = title;
    map['selected_loss_reasons'] = selectedLossReasons?.map((v) => v.toJson()).toList();
    map['other_reasons'] = otherReasons;
    map['loss_with_total_producers_per_kg_minus'] = lossWithTotalProducersPerKgMinus;
    map['loss_with_total_producers_per_kg'] = lossWithTotalProducersPerKg;
    map['loss_amount_per_kg'] = lossAmountPerKg;
    map['loss_percentage'] = lossPercentage;
    map['use_machine_or_not'] = useMachineOrNot?.toJson();
    map['loss_reason_data'] = lossReasonData?.toJson();
    return map;
  }

  static double? _toDouble(dynamic value) {
    if (value == null) {
      return null;
    }
    if (value is num) {
      return value.toDouble();
    }
    return double.tryParse(value.toString());
  }

  static int? _toInt(dynamic value) {
    if (value == null) {
      return null;
    }
    if (value is int) {
      return value;
    }
    if (value is num) {
      return value.toInt();
    }
    return int.tryParse(value.toString());
  }

  static const _sentinel = Object();

  Module4Model copyWith({
    Object? typeData = _sentinel,
    Object? slNo = _sentinel,
    Object? title = _sentinel,
    Object? lossWithTotalProducersPerKg = _sentinel,
    Object? lossWithTotalProducersPerKgMinus = _sentinel,
    Object? totalQuantityPerKg = _sentinel,
    Object? lossQuantityPerKg = _sentinel,
    Object? lossPercentage = _sentinel,
    Object? useMachineOrNot = _sentinel,
    Object? lossReasonData = _sentinel,
    Object? otherReasons = _sentinel,
    Object? errorMessage = _sentinel,
    Object? selectedLossReasons = _sentinel,
    Object? typeList = _sentinel,
    Object? lossQuantityPerKgController = _sentinel,
    Object? lossQuantityPerKgFocusNode = _sentinel,
    Object? otherReasonsController = _sentinel,
  }) {
    return Module4Model(
      typeData: typeData == _sentinel ? this.typeData : typeData as OtherStaticModel?,
      slNo: slNo == _sentinel ? this.slNo : slNo as int?,
      title: title == _sentinel ? this.title : title as String?,
      lossWithTotalProducersPerKgMinus: lossWithTotalProducersPerKgMinus == _sentinel ? this.lossWithTotalProducersPerKgMinus : lossWithTotalProducersPerKgMinus as double?,
      lossWithTotalProducersPerKg: lossWithTotalProducersPerKg == _sentinel ? this.lossWithTotalProducersPerKg : lossWithTotalProducersPerKg as double?,
      lossAmountPerKg: lossQuantityPerKg == _sentinel ? this.lossAmountPerKg : lossQuantityPerKg as double?,
      lossPercentage: lossPercentage == _sentinel ? this.lossPercentage : lossPercentage as double?,
      useMachineOrNot: useMachineOrNot == _sentinel ? this.useMachineOrNot : useMachineOrNot as OtherStaticModel?,
      lossReasonData: lossReasonData == _sentinel ? this.lossReasonData : lossReasonData as OtherStaticModel?,
      otherReasons: otherReasons == _sentinel ? this.otherReasons : otherReasons as String?,
      selectedLossReasons: selectedLossReasons == _sentinel ? this.selectedLossReasons : selectedLossReasons as List<OtherStaticModel>?,
      typeList: typeList == _sentinel ? this.typeList : typeList as List<OtherStaticModel>?,
    );
  }

  late TextEditingController lossQuantityPerKgController;
  late FocusNode lossQuantityPerKgFocusNode;
  late TextEditingController otherReasonsController;

  void initializeControllers() {
    lossQuantityPerKgController = TextEditingController(text: lossAmountPerKg?.toString() ?? '');
    otherReasonsController = TextEditingController(text: otherReasons ?? '');
    lossQuantityPerKgFocusNode = FocusNode();
  }

  void updateControllers(String value) {
    lossQuantityPerKgController.text = value;
    lossAmountPerKg = double.tryParse(value);
  }

  void updateOtherReasonsController(String value) {
    otherReasonsController.text = value;
    otherReasons = value;
  }

  void dispose() {
    lossQuantityPerKgController.dispose();
    otherReasonsController.dispose();
    lossQuantityPerKgFocusNode.dispose();
  }
}

