import 'package:bpls_mobile/datasource/model/module_3_model.dart';
import 'package:bpls_mobile/datasource/static_data/other_static_data.dart';

class PayloadModel {
  PayloadModel({
    this.metaData,
    this.module01Identification,
    this.module02GeneralInfo,
    this.module03ProductionActivity,
    this.timeStamp,
    this.psuNumber,
    this.amonDhanModel,
    this.boroDhanModel,
    this.ausDhanModel,
    this.dhanModel,
    this.calModel,
    this.mosurModel,
    this.mangoModel,
    this.peyajModel,
    this.aluModel,
    this.sorisaModel,
    this.carpModel,
    this.cingriModel,
    this.meetCowModel,
    this.meetHenModel,
    this.uniqueID,
    this.isDoneAll = false,
  });

  PayloadModel.fromJson(dynamic json) {
    metaData = json['meta_data'] != null ? MetaDataStart.fromJson(json['meta_data']) : null;
    module01Identification = json['module_01_identification'] != null ? Module01Identification.fromJson(json['module_01_identification']) : null;
    module02GeneralInfo = json['module_02_general_info'] != null ? Module02GeneralInfo.fromJson(json['module_02_general_info']) : null;
    module03ProductionActivity = json['module_03_production_activity'] != null ? Module03ProductionActivity.fromJson(json['module_03_production_activity']) : null;
    timeStamp = json['time_stamp'];
    psuNumber = json['psuNumber'];
    isDoneAll = json['isDoneAll'];
    uniqueID = json['uniqueID'];
    amonDhanModel = json['amonDhan'] != null ? Module3Model.fromJson(json['amonDhan']) : null;
    boroDhanModel = json['boroDhan'] != null ? Module3Model.fromJson(json['boroDhan']) : null;
    ausDhanModel = json['ausDhan'] != null ? Module3Model.fromJson(json['ausDhan']) : null;
    dhanModel= json['dhan'] != null ? Module3Model.fromJson(json['dhan']) : null;
    calModel = json['cal'] != null ? Module3Model.fromJson(json['cal']) : null;
    mosurModel = json['mosur'] != null ? Module3Model.fromJson(json['mosur']) : null;
    mangoModel = json['mango'] != null ? Module3Model.fromJson(json['mango']) : null;
    peyajModel = json['peyaj'] != null ? Module3Model.fromJson(json['peyaj']) : null;
    aluModel = json['alu'] != null ? Module3Model.fromJson(json['alu']) : null;
    sorisaModel = json['sorisa'] != null ? Module3Model.fromJson(json['sorisa']) : null;
    carpModel = json['karp'] != null ? Module3Model.fromJson(json['karp']) : null;
    cingriModel = json['cingri'] != null ? Module3Model.fromJson(json['cingri']) : null;
    meetCowModel = json['meetCow'] != null ? Module3Model.fromJson(json['meetCow']) : null;
    meetHenModel = json['meetHen'] != null ? Module3Model.fromJson(json['meetHen']) : null;

  }

  MetaDataStart? metaData;
  Module01Identification? module01Identification;
  Module02GeneralInfo? module02GeneralInfo;
  Module03ProductionActivity? module03ProductionActivity;
  Module3Model? amonDhanModel;
  Module3Model? boroDhanModel;
  Module3Model? ausDhanModel;
  Module3Model? dhanModel;
  Module3Model? calModel;
  Module3Model? mosurModel;
  Module3Model? mangoModel;
  Module3Model? peyajModel;
  Module3Model? aluModel;
  Module3Model? sorisaModel;
  Module3Model? carpModel;
  Module3Model? cingriModel;
  Module3Model? meetCowModel;
  Module3Model? meetHenModel;
  String? timeStamp;
  String? psuNumber;
  bool? isDoneAll;
  String? uniqueID;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};

    if (metaData != null) {
      map['meta_data'] = metaData?.toJson();
    }
    if (module01Identification != null) {
      map['module_01_identification'] = module01Identification?.toJson();
    }
    if (module02GeneralInfo != null) {
      map['module_02_general_info'] = module02GeneralInfo?.toJson();
    }
    if (module03ProductionActivity != null) {
      map['module_03_production_activity'] = module03ProductionActivity?.toJson();
    }
    map['time_stamp'] = timeStamp;
    map['psuNumber'] = psuNumber;
    map['isDoneAll'] = isDoneAll;
    map['uniqueID'] = uniqueID;
    if (amonDhanModel != null) {
      map['amonDhan'] = amonDhanModel?.toJson();
    }
    if (boroDhanModel != null) {
      map['boroDhan'] = boroDhanModel?.toJson();
    }
    if (ausDhanModel != null) {
      map['ausDhan'] = ausDhanModel?.toJson();
    }
    if(dhanModel!=null){
      map['dhan'] = dhanModel?.toJson();
    }
    if (calModel != null) {
      map['cal'] = calModel?.toJson();
    }
    if (mosurModel != null) {
      map['mosur'] = mosurModel?.toJson();
    }
    if (mangoModel != null) {
      map['mango'] = mangoModel?.toJson();
    }
    if (peyajModel != null) {
      map['peyaj'] = peyajModel?.toJson();
    }
    if (aluModel != null) {
      map['alu'] = aluModel?.toJson();
    }
    if (sorisaModel != null) {
      map['sorisa'] = sorisaModel?.toJson();
    }
    if (carpModel != null) {
      map['karp'] = carpModel?.toJson();
    }
    if (cingriModel != null) {
      map['cingri'] = cingriModel?.toJson();
    }
    if (meetCowModel != null) {
      map['meetCow'] = meetCowModel?.toJson();
    }
    if (meetHenModel != null) {
      map['meetHen'] = meetHenModel?.toJson();
    }
    return map;
  }
}


class Stages {
  Stages({this.stageInfo, this.lossAmountKg, this.lossPercentage, this.machineUsed, this.causeCode});

  Stages.fromJson(dynamic json) {
    stageInfo = json['stage_id'] != null ? OtherStaticModel.fromJson(Map<String, dynamic>.from(json['stage_id'])) : null;
    lossAmountKg = json['loss_amount_kg'];
    lossPercentage = json['loss_percentage'];
    machineUsed = json['machine_used'] != null ? OtherStaticModel.fromJson(Map<String, dynamic>.from(json['machine_used'])) : null;
    causeCode = json['cause_code'] != null ? OtherStaticModel.fromJson(Map<String, dynamic>.from(json['cause_code'])) : null;
  }

  OtherStaticModel? stageInfo;
  num? lossAmountKg;
  String? lossPercentage;
  OtherStaticModel? machineUsed;
  OtherStaticModel? causeCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['stage_id'] = stageInfo?.toJson();
    map['loss_amount_kg'] = lossAmountKg;
    map['loss_percentage'] = lossPercentage;
    map['machine_used'] = machineUsed?.toJson();
    map['cause_code'] = causeCode?.toJson();
    return map;
  }
}

class MillerLosses {
  MillerLosses({this.cropName, this.stages, this.totalProduce});

  MillerLosses.fromJson(dynamic json) {
    cropName = json['crop_name'];
    totalProduce = json['totalProduce'];
    if (json['stages'] != null) {
      stages = [];
      json['stages'].forEach((v) {
        stages?.add(Stages.fromJson(v));
      });
    }
  }

  String? cropName;
  String? totalProduce;
  List<Stages>? stages;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['crop_name'] = cropName;
    map['totalProduce'] = totalProduce;
    if (stages != null) {
      map['stages'] = stages?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class GodownLosses {
  GodownLosses({this.cropName, this.stages});

  GodownLosses.fromJson(dynamic json) {
    cropName = json['crop_name'];
    if (json['stages'] != null) {
      stages = [];
      json['stages'].forEach((v) {
        stages?.add(Stages.fromJson(v));
      });
    }
  }

  String? cropName;
  List<Stages>? stages;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['crop_name'] = cropName;
    if (stages != null) {
      map['stages'] = stages?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class FarmerLosses {
  FarmerLosses({this.cropName, this.stages,this.totalLoss});

  FarmerLosses.fromJson(dynamic json) {
    cropName = json['crop_name'];
    totalLoss = json['totalLoss'];
    if (json['stages'] != null) {
      stages = [];
      json['stages'].forEach((v) {
        stages?.add(Stages.fromJson(v));
      });
    }
  }

  String? cropName;
  String? totalLoss;
  List<Stages>? stages;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['crop_name'] = cropName;
    map['totalLoss'] = totalLoss;
    if (stages != null) {
      map['stages'] = stages?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Module03ProductionActivity {
  Module03ProductionActivity({this.description, this.items});

  Module03ProductionActivity.fromJson(dynamic json) {
    description = json['description'];
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        if (v is Map) {
          final m = <String, dynamic>{};
          v.forEach((k, val) => m[k.toString()] = val);
          items?.add(Module3Model.fromJson(m));
        }
      });
    }
  }

  String? description;
  List<Module3Model>? items;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['description'] = description;
    if (items != null) {
      map['items'] = items?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Logistics {
  Logistics({
    this.storagePlace,
    this.processingPlace,
    this.transportMethod,
    this.usesTransport,
    this.packagingMethod,
    this.distancePurchaseToInstKm,
    this.timePurchaseToInstMin,
    this.processingPlacePartTwo,
    this.distanceInstToMarketKm,
    this.timePurchaseToInstHours,
    this.mainPurpose,
    this.distanceInsttoMarketHour,
    this.distanceInsttoMarketMinute,
  });

  Logistics.fromJson(dynamic json) {
    storagePlace = json['storage_place'] != null ? json['storage_place'].cast<num>() : [];
    processingPlace = json['processing_place'] != null ? json['processing_place'].cast<num>() : [];
    processingPlacePartTwo = json['processingPlacePartTwo'] != null ? json['processingPlacePartTwo'].cast<num>() : [];
    transportMethod = json['transport_method'] != null ? json['transport_method'].cast<num>() : [];
    usesTransport = json['uses_transport'] != null ? OtherStaticModel.fromJson(Map<String, dynamic>.from(json['uses_transport'])) : null;
    packagingMethod = json['packaging_method'] != null ? json['packaging_method'].cast<num>() : [];
    distancePurchaseToInstKm = json['distance_purchase_to_inst_km'];
    timePurchaseToInstMin = json['time_purchase_to_inst_min'];
    distanceInstToMarketKm = json['distance_inst_to_market_km'];
    timePurchaseToInstHours = json['time_purchase_to_inst_hours'];
    mainPurpose = json['main_purpose'] != null ? OtherStaticModel.fromJson(Map<String, dynamic>.from(json['main_purpose'])) : null;
    distanceInsttoMarketHour = json['distance_instto_market_hour'];
    distanceInsttoMarketMinute = json['distance_instto_market_minute'];
  }

  OtherStaticModel? mainPurpose;
  List<OtherStaticModel>? processingPlacePartTwo;
  List<OtherStaticModel>? processingPlace;
  List<OtherStaticModel>? storagePlace;
  OtherStaticModel? usesTransport;
  List<OtherStaticModel>? transportMethod;
  List<OtherStaticModel>? packagingMethod;
  num? distancePurchaseToInstKm;
  num? timePurchaseToInstHours;
  num? timePurchaseToInstMin;
  num? distanceInstToMarketKm;
  num? distanceInsttoMarketHour;
  num? distanceInsttoMarketMinute;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['storage_place'] = storagePlace;
    map['processing_place'] = processingPlace;
    map['transport_method'] = transportMethod;
    map['uses_transport'] = usesTransport?.toJson();
    map['packaging_method'] = packagingMethod;
    map['processingPlacePartTwo'] = processingPlacePartTwo;
    map['distance_purchase_to_inst_km'] = distancePurchaseToInstKm;
    map['time_purchase_to_inst_min'] = timePurchaseToInstMin;
    map['distance_inst_to_market_km'] = distanceInstToMarketKm;
    map['time_purchase_to_inst_hours'] = timePurchaseToInstHours;
    map['main_purpose'] = mainPurpose?.toJson();
    map['distance_instto_market_hour'] = distanceInsttoMarketHour;
    map['distance_instto_market_minute'] = distanceInsttoMarketMinute;
    return map;
  }
}

class CropsTypeTwoModel {
  CropsTypeTwoModel({this.itemCode, this.itemName, this.purchasedProcessedKg, this.soldMilledKg});

  CropsTypeTwoModel.fromJson(dynamic json) {
    itemCode = json['item_code'];
    itemName = json['item_name'];
    purchasedProcessedKg = json['purchased_processed_kg'];
    soldMilledKg = json['sold_milled_kg'];
  }

  num? itemCode;
  String? itemName;
  num? purchasedProcessedKg;
  num? soldMilledKg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['item_code'] = itemCode;
    map['item_name'] = itemName;
    map['purchased_processed_kg'] = purchasedProcessedKg;
    map['sold_milled_kg'] = soldMilledKg;
    return map;
  }
}

class FarmerProductionData {
  FarmerProductionData({this.description, this.crops, this.logistics});

  FarmerProductionData.fromJson(dynamic json) {
    description = json['description'];
    if (json['crops'] != null) {
      crops = [];
      json['crops'].forEach((v) {
        crops?.add(CropsTypeOneModel.fromJson(v));
      });
    }
    logistics = json['logistics'] != null ? Logistics.fromJson(json['logistics']) : null;
  }

  String? description;
  List<CropsTypeOneModel>? crops;
  Logistics? logistics;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['description'] = description;
    if (crops != null) {
      map['crops'] = crops?.map((v) => v.toJson()).toList();
    }
    if (logistics != null) {
      map['logistics'] = logistics?.toJson();
    }
    return map;
  }
}

class CropsTypeOneModel {
  CropsTypeOneModel({this.cropCode, this.cropName, this.landDecimal, this.productionKg, this.obtainedOthersKg, this.givenOthersKg, this.netProductionKg});

  CropsTypeOneModel.fromJson(dynamic json) {
    cropCode = json['crop_code'];
    cropName = json['crop_name'];
    landDecimal = json['land_decimal'];
    productionKg = json['production_kg'];
    obtainedOthersKg = json['obtained_others_kg'];
    givenOthersKg = json['given_others_kg'];
    netProductionKg = json['net_production_kg'];
  }

  num? cropCode;
  String? cropName;
  num? landDecimal;
  num? productionKg;
  num? obtainedOthersKg;
  num? givenOthersKg;
  num? netProductionKg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['crop_code'] = cropCode;
    map['crop_name'] = cropName;
    map['land_decimal'] = landDecimal;
    map['production_kg'] = productionKg;
    map['obtained_others_kg'] = obtainedOthersKg;
    map['given_others_kg'] = givenOthersKg;
    map['net_production_kg'] = netProductionKg;
    return map;
  }
}

class Module02GeneralInfo {
  Module02GeneralInfo({this.householdDetails, this.institutionDetails, this.informationLevel, this.typeOfProductOrFoodConduct});

  Module02GeneralInfo.fromJson(dynamic json) {
    householdDetails = json['household_details'] != null ? HouseholdDetails.fromJson(json['household_details']) : null;
    institutionDetails = json['institution_details'] != null ? InstitutionDetails.fromJson(json['institution_details']) : null;
    informationLevel = json['information_level'] != null ? OtherStaticModel.fromJson(Map<String, dynamic>.from(json['information_level'])) : null;
    if (json['type_of_product_or_food_conduct'] != null) {
      typeOfProductOrFoodConduct = [];
      json['type_of_product_or_food_conduct'].forEach((v) {
        typeOfProductOrFoodConduct?.add(OtherStaticModel.fromJson(Map<String, dynamic>.from(v)));
      });
    }
  }

  HouseholdDetails? householdDetails;
  InstitutionDetails? institutionDetails;
  OtherStaticModel? informationLevel;
  List<OtherStaticModel>? typeOfProductOrFoodConduct;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (householdDetails != null) {
      map['household_details'] = householdDetails?.toJson();
    }
    if (institutionDetails != null) {
      map['institution_details'] = institutionDetails?.toJson();
    }
    if (informationLevel != null) {
      map['information_level'] = informationLevel?.toJson();
    }
    if (typeOfProductOrFoodConduct != null) {
      map['type_of_product_or_food_conduct'] = typeOfProductOrFoodConduct?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class InstitutionDetails {
  InstitutionDetails({
    this.institutionSerial,
    this.ownerName,
    this.ownerGender,
    this.ownerAge,
    this.organizationHoldingNo,
    this.organizationAddress,
    this.organizationPhone,
    this.institutionType,
    this.establishmentYear,
    this.ownershipType,
    this.manpowerRegular,
    this.manpowerIrregular,
  });

  InstitutionDetails.fromJson(dynamic json) {
    institutionSerial = json['institution_serial'];
    ownerName = json['owner_name'];
    ownerGender = json['owner_gender'] != null ? OtherStaticModel.fromJson(Map<String, dynamic>.from(json['owner_gender'])) : null;
    ownerAge = json['owner_age'];
    establishmentYear = json['establishment_year'];
    organizationHoldingNo = json['organization_holding_no'];
    organizationAddress = json['organization_address'];
    organizationPhone = json['organization_phone'];
    institutionType = json['institution_type'] != null ? OtherStaticModel.fromJson(Map<String, dynamic>.from(json['institution_type'])) : null;
    ownershipType = json['ownership_type'] != null ? OtherStaticModel.fromJson(Map<String, dynamic>.from(json['ownership_type'])) : null;
    manpowerRegular = json['manpower_regular'] != null ? Manpower.fromJson(json['manpower_regular']) : null;
    manpowerIrregular = json['manpower_irregular'] != null ? Manpower.fromJson(json['manpower_irregular']) : null;
  }

  String? institutionSerial;
  String? ownerName;
  OtherStaticModel? ownerGender;
  String? ownerAge;
  String? establishmentYear;
  String? organizationHoldingNo;
  String? organizationAddress;
  String? organizationPhone;
  OtherStaticModel? institutionType;
  OtherStaticModel? ownershipType;
  Manpower? manpowerRegular;
  Manpower? manpowerIrregular;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['institution_serial'] = institutionSerial;
    map['owner_name'] = ownerName;
    map['owner_gender'] = ownerGender?.toJson();
    map['owner_age'] = ownerAge;
    map['establishment_year'] = establishmentYear;
    map['organization_holding_no'] = organizationHoldingNo;
    map['organization_address'] = organizationAddress;
    map['organization_phone'] = organizationPhone;
    map['institution_type'] = institutionType?.toJson();
    map['ownership_type'] = ownershipType?.toJson();
    if (manpowerRegular != null) {
      map['manpower_regular'] = manpowerRegular?.toJson();
    }
    if (manpowerIrregular != null) {
      map['manpower_irregular'] = manpowerIrregular?.toJson();
    }
    return map;
  }
}

class Manpower {
  Manpower({this.male, this.female, this.hijra});

  Manpower.fromJson(dynamic json) {
    male = json['male'];
    female = json['female'];
    hijra = json['hijra'];
  }

  num? male;
  num? female;
  num? hijra;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['male'] = male;
    map['female'] = female;
    map['hijra'] = hijra;
    return map;
  }
}

class HouseholdDetails {
  HouseholdDetails({
    this.khanaHeadName,
    this.khanaNumber,
    this.respondentMobile,
    this.fatherHusbandName,
    this.addressHoldingNo,
    // this.respondentLineNumber,
    this.description,
    this.houseType,
    this.kitchenStatus,
    this.fuelSource,
    this.electricitySource,
    this.waterSource,
    this.toiletFacility,
    this.members,
    this.answerPersonLineNumber,
    this.answerPersonPhoneNumber,
    this.houseTypeOthers,
    this.kitchenStatusOthers,
    this.fuelSourceOthers,
    this.electricitySourceOthers,
    this.waterSourceOthers,
    this.toiletFacilityOthers,

  });

  HouseholdDetails.fromJson(dynamic json) {
    description = json['description'] != null ? OtherStaticModel.fromJson(Map<String, dynamic>.from(json['description'])) : null;
    houseType = json['house_type'] != null ? OtherStaticModel.fromJson(Map<String, dynamic>.from(json['house_type'])) : null;
    khanaNumber = json['khanaNumber'];
    kitchenStatus = json['kitchen_status'] != null ? OtherStaticModel.fromJson(Map<String, dynamic>.from(json['kitchen_status'])) : null;
    fuelSource = json['fuel_source'] != null ? OtherStaticModel.fromJson(Map<String, dynamic>.from(json['fuel_source'])) : null;
    electricitySource = json['electricity_source'] != null ? OtherStaticModel.fromJson(Map<String, dynamic>.from(json['electricity_source'])) : null;
    waterSource = json['water_source'] != null ? OtherStaticModel.fromJson(Map<String, dynamic>.from(json['water_source'])) : null;
    toiletFacility = json['toilet_facility'] != null ? OtherStaticModel.fromJson(Map<String, dynamic>.from(json['toilet_facility'])) : null;
    if (json['members'] != null) {
      members = [];
      json['members'].forEach((v) {
        members?.add(Members.fromJson(v));
      });
    }
    answerPersonLineNumber = json['answer_person_line_number'];
    answerPersonPhoneNumber = json['answer_person_phone_number'];
    // respondentLineNumber = json['respondent_line_number'];
    khanaHeadName = json['khanaHeadName'];
    fatherHusbandName = json['father_husband_name'];
    addressHoldingNo = json['address_holding_no'];
    respondentMobile = json['respondent_mobile'];
    houseTypeOthers= json['house_type_others'];
    kitchenStatusOthers= json['kitchen_status_others'];
    fuelSourceOthers= json['fuel_source_others'];
    electricitySourceOthers= json['electricity_source_others'];
    waterSourceOthers= json['water_source_others'];
    toiletFacilityOthers= json['toilet_facility_others'];

  }

  OtherStaticModel? description;
  String? khanaNumber;
  String? khanaHeadName;
  String? fatherHusbandName;
  String? addressHoldingNo;
  String? respondentMobile;

  // String? respondentLineNumber;
  OtherStaticModel? houseType;
  String? houseTypeOthers;
  OtherStaticModel? kitchenStatus;
  String? kitchenStatusOthers;
  OtherStaticModel? fuelSource;
  String? fuelSourceOthers;
  OtherStaticModel? electricitySource;
  String? electricitySourceOthers;
  OtherStaticModel? waterSource;
  String? waterSourceOthers;
  OtherStaticModel? toiletFacility;
  String? toiletFacilityOthers;
  List<Members>? members;
  String? answerPersonLineNumber;
  String? answerPersonPhoneNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['khanaHeadName'] = khanaHeadName;
    map['respondent_mobile'] = respondentMobile;
    map['khanaNumber'] = khanaNumber;
    map['father_husband_name'] = fatherHusbandName;
    map['address_holding_no'] = addressHoldingNo;
    map['description'] = description?.toJson();
    map['house_type'] = houseType?.toJson();
    map['kitchen_status'] = kitchenStatus?.toJson();
    map['fuel_source'] = fuelSource?.toJson();
    map['electricity_source'] = electricitySource?.toJson();
    map['water_source'] = waterSource?.toJson();
    map['toilet_facility'] = toiletFacility?.toJson();
    if (members != null) {
      map['members'] = members?.map((v) => v.toJson()).toList();
    }
    map['answer_person_line_number'] = answerPersonLineNumber;
    map['answer_person_phone_number'] = answerPersonPhoneNumber;
    map['house_type_others'] = houseTypeOthers;
    map['kitchen_status_others'] = kitchenStatusOthers;
    map['fuel_source_others'] = fuelSourceOthers;
    map['electricity_source_others'] = electricitySourceOthers;
    map['water_source_others'] = waterSourceOthers;
    map['toilet_facility_others'] = toiletFacilityOthers;
    return map;
  }
}

class Members {
  Members({this.lineNo, this.name, this.relationship, this.gender, this.age, this.religion, this.maritalStatus, this.educationCode, this.isInvolvedAgri, this.incomeSource});

  Members.fromJson(dynamic json) {
    lineNo = json['line_no'];
    name = json['name'];
    relationship = json['relationship'] != null ? OtherStaticModel.fromJson(Map<String, dynamic>.from(json['relationship'])) : null;
    gender = json['gender'] != null ? OtherStaticModel.fromJson(Map<String, dynamic>.from(json['gender'])) : null;
    age = json['age'];
    religion = json['religion'] != null ? OtherStaticModel.fromJson(Map<String, dynamic>.from(json['religion'])) : null;
    maritalStatus = json['marital_status'] != null ? OtherStaticModel.fromJson(Map<String, dynamic>.from(json['marital_status'])) : null;
    educationCode = json['education_code'] != null ? OtherStaticModel.fromJson(Map<String, dynamic>.from(json['education_code'])) : null;
    isInvolvedAgri = json['is_involved_agri'] != null ? OtherStaticModel.fromJson(Map<String, dynamic>.from(json['is_involved_agri'])) : null;
    incomeSource = json['income_source'] != null ? OtherStaticModel.fromJson(Map<String, dynamic>.from(json['income_source'])) : null;
  }

  num? lineNo;
  String? name;
  OtherStaticModel? relationship;
  OtherStaticModel? gender;
  num? age;
  OtherStaticModel? religion;
  OtherStaticModel? maritalStatus;
  OtherStaticModel? educationCode;
  OtherStaticModel? isInvolvedAgri;
  OtherStaticModel? incomeSource;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['line_no'] = lineNo;
    map['name'] = name;
    map['relationship'] = relationship?.toJson();
    map['gender'] = gender?.toJson();
    map['age'] = age;
    map['religion'] = religion?.toJson();
    map['marital_status'] = maritalStatus?.toJson();
    map['education_code'] = educationCode?.toJson();
    map['is_involved_agri'] = isInvolvedAgri?.toJson();
    map['income_source'] = incomeSource?.toJson();
    return map;
  }
}

class Module01Identification {
  Module01Identification({this.geoCode, this.respondentType, this.respondentTypeLabel});

  Module01Identification.fromJson(dynamic json) {
    geoCode = json['geo_code'] != null ? GeoCode.fromJson(json['geo_code']) : null;
    respondentType = json['respondent_type'];
    respondentTypeLabel = json['respondent_type_label'];
  }

  GeoCode? geoCode;
  num? respondentType;
  String? respondentTypeLabel;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (geoCode != null) {
      map['geo_code'] = geoCode?.toJson();
    }
    map['respondent_type'] = respondentType;
    map['respondent_type_label'] = respondentTypeLabel;
    return map;
  }
}

class GeoCode {
  GeoCode({
    this.divisionCode,
    this.districtCode,
    this.cityCorpCode,
    this.pourashavaCode,
    this.upazilaCode,
    this.unionCode,
    this.wardCode,
    this.mouzaCode,
    this.villageCode,
    this.eaCode,
    this.rmoCode,
  });

  GeoCode.fromJson(dynamic json) {
    divisionCode = json['division_code'];
    districtCode = json['district_code'];
    cityCorpCode = json['city_corp_code'];
    pourashavaCode = json['pourashava_code'];
    upazilaCode = json['upazila_code'];
    unionCode = json['union_code'];
    wardCode = json['ward_code'];
    mouzaCode = json['mouza_code'];
    villageCode = json['village_code'];
    eaCode = json['ea_code'];
    rmoCode = json['rmo_code'];
  }

  String? divisionCode;
  String? districtCode;
  dynamic cityCorpCode;
  dynamic pourashavaCode;
  String? upazilaCode;
  String? unionCode;
  String? wardCode;
  String? mouzaCode;
  String? villageCode;
  String? eaCode;
  String? rmoCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['division_code'] = divisionCode;
    map['district_code'] = districtCode;
    map['city_corp_code'] = cityCorpCode;
    map['pourashava_code'] = pourashavaCode;
    map['upazila_code'] = upazilaCode;
    map['union_code'] = unionCode;
    map['ward_code'] = wardCode;
    map['mouza_code'] = mouzaCode;
    map['village_code'] = villageCode;
    map['ea_code'] = eaCode;
    map['rmo_code'] = rmoCode;
    return map;
  }
}

class MetaDataStart {
  MetaDataStart({this.deviceID, this.surveyorId, this.startDate, this.submissionDate, this.gpsCoordinates, this.appVersion});

  MetaDataStart.fromJson(dynamic json) {
    deviceID = json['deviceID'];
    surveyorId = json['surveyor_id'];
    startDate = json['start_date'];
    submissionDate = json['submission_date'];
    gpsCoordinates = json['gps_coordinates'] != null ? GpsCoordinates.fromJson(json['gps_coordinates']) : null;
    appVersion = json['app_version'];
  }

  String? deviceID;
  String? surveyorId;
  String? startDate;
  String? submissionDate;
  GpsCoordinates? gpsCoordinates;
  String? appVersion;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['deviceID'] = deviceID;
    map['surveyor_id'] = surveyorId;
    map['start_date'] = startDate;
    map['submission_date'] = submissionDate;
    if (gpsCoordinates != null) {
      map['gps_coordinates'] = gpsCoordinates?.toJson();
    }
    map['app_version'] = appVersion;
    return map;
  }
}

class GpsCoordinates {
  GpsCoordinates({this.latitude, this.longitude, this.accuracy});

  GpsCoordinates.fromJson(dynamic json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    accuracy = json['accuracy'];
  }

  num? latitude;
  num? longitude;
  num? accuracy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['accuracy'] = accuracy;
    return map;
  }
}
