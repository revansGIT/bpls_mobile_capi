import 'package:bpls_mobile/datasource/static_data/other_static_data.dart';
import 'package:flutter/material.dart';

class KhanaMemberModel {
  String? lineNumber;
  String? memberName;
  OtherStaticModel? memberRelation;
  OtherStaticModel? memberGender;
  String? memberAge;
  OtherStaticModel? religion;
  OtherStaticModel? marriageStatus;
  OtherStaticModel? educationLevel;
  OtherStaticModel? agricultureRelative;
  OtherStaticModel? incomeSource;
  late TextEditingController nameController;
  late TextEditingController ageController;
  late FocusNode nameFocusNode;
  late FocusNode ageFocusNode;

  KhanaMemberModel({this.lineNumber, this.memberName, this.memberRelation, this.memberGender, this.memberAge, this.religion, this.marriageStatus, this.educationLevel, this.agricultureRelative, this.incomeSource}) {
    _initializeControllers();
  }

  void updateControllers() {
    nameController.text = memberName ?? '';
    ageController.text = memberAge ?? '';
  }

  void dispose() {
    nameController.dispose();
    ageController.dispose();
    nameFocusNode.dispose();
    ageFocusNode.dispose();
  }

  void _initializeControllers() {
    nameController = TextEditingController(text: memberName ?? '');
    ageController = TextEditingController(text: memberAge ?? '');
    nameFocusNode = FocusNode();
    ageFocusNode = FocusNode();
  }

  static const _sentinel = Object();

  KhanaMemberModel copyWith({
    Object? lineNumber = _sentinel,
    Object? memberName = _sentinel,
    Object? memberRelation = _sentinel,
    Object? memberGender = _sentinel,
    Object? memberAge = _sentinel,
    Object? religion = _sentinel,
    Object? marriageStatus = _sentinel,
    Object? educationLevel = _sentinel,
    Object? agricultureRelative = _sentinel,
    Object? incomeSource = _sentinel,
  }) {
    return KhanaMemberModel(
      lineNumber: lineNumber == _sentinel ? this.lineNumber : lineNumber as String?,
      memberName: memberName == _sentinel ? this.memberName : memberName as String?,
      memberRelation: memberRelation == _sentinel ? this.memberRelation : memberRelation as OtherStaticModel?,
      memberGender: memberGender == _sentinel ? this.memberGender : memberGender as OtherStaticModel?,
      memberAge: memberAge == _sentinel ? this.memberAge : memberAge as String?,
      religion: religion == _sentinel ? this.religion : religion as OtherStaticModel?,
      marriageStatus: marriageStatus == _sentinel ? this.marriageStatus : marriageStatus as OtherStaticModel?,
      educationLevel: educationLevel == _sentinel ? this.educationLevel : educationLevel as OtherStaticModel?,
      agricultureRelative: agricultureRelative == _sentinel ? this.agricultureRelative : agricultureRelative as OtherStaticModel?,
      incomeSource: incomeSource == _sentinel ? this.incomeSource : incomeSource as OtherStaticModel?,
    );
  }
}
