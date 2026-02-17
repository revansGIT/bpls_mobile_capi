import 'package:bpls_mobile/business_logic/provider/helper_provider.dart';
import 'package:bpls_mobile/business_logic/provider/save_data_provider.dart';
import 'package:bpls_mobile/datasource/model/khana_member_model.dart';
import 'package:bpls_mobile/datasource/model/module_3_model.dart';
import 'package:bpls_mobile/datasource/model/module_4_model.dart';
import 'package:bpls_mobile/datasource/model/payload_model.dart';
import 'package:bpls_mobile/datasource/model/user_model.dart';
import 'package:bpls_mobile/datasource/static_data/other_static_data.dart';
import 'package:bpls_mobile/helper/global.dart';
import 'package:bpls_mobile/helper/helper.dart';
import 'package:bpls_mobile/routes/app_pages.dart';
import 'package:bpls_mobile/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SurveyProvider with ChangeNotifier {
  final SharedPreferences _prefs;

  SurveyProvider(this._prefs);

  @override
  void dispose() {
    for (var model in module3ModelList) {
      model.dispose();
    }

    // Dispose Khana controllers
    khanaHeadNameController.dispose();
    khanaHeadFatherController.dispose();
    khanaHeadHoldingNumber.dispose();
    khanaHeadMobileNumber.dispose();
    answerPersonLineNumber.dispose();
    answerPersonMobileNumber.dispose();

    khanaHeadNameFocusNode.dispose();
    khanaHeadFatherFocusNode.dispose();
    khanaHeadHoldingFocusNode.dispose();
    khanaHeadMobileFocusNode.dispose();

    // Dispose Organization controllers
    organizationOwnerNameController.dispose();
    organizationOwnerAgeController.dispose();
    organizationHoldingNumberController.dispose();
    organizationAddressController.dispose();
    organizationPhoneController.dispose();
    organizationEstablishedYearController.dispose();
    organizationDailyWorkedMan.dispose();
    organizationDailyWorkedWomen.dispose();
    organizationDailyWorkedOther.dispose();
    organizationDailyIrregularWorkedMan.dispose();
    organizationDailyIrregularWorkedWomen.dispose();
    organizationDailyIrregularWorkedOther.dispose();

    organizationOwnerNameFocusNode.dispose();
    organizationOwnerAgeFocusNode.dispose();
    organizationHoldingNumberFocusNode.dispose();
    organizationAddressFocusNode.dispose();
    organizationPhoneFocusNode.dispose();
    organizationEstablishedYearFocusNode.dispose();
    organizationDailyWorkedManFocusNode.dispose();
    organizationDailyWorkedWomenFocusNode.dispose();
    organizationDailyWorkedOtherFocusNode.dispose();
    organizationDailyIrregularWorkedManFocusNode.dispose();
    organizationDailyIrregularWorkedWomenFocusNode.dispose();
    organizationDailyIrregularWorkedOtherFocusNode.dispose();
    super.dispose();
  }

  void updatedData() {
    notifyListeners();
  }

  int unitSelect = -1;

  void changeUnitSelect(int val, HelperProvider helperProvider) {
    unitSelect = val;
    initializeFirstData(helperProvider);
    notifyListeners();
  }

  String answerPersonName8_3 = '';

  void changeAnswerPersonName8_3(String val) {
    try {
      int answerPosition = (int.tryParse(val) ?? -1) - 1;
      answerPersonName8_3 = khanaMemberList[answerPosition].memberName ?? '';
    } catch (e) {
      answerPersonName8_3 = '';
    }
    notifyListeners();
  }

  int formTypeSelect = -1;

  void changeFormTypeSelect(int val) {
    formTypeSelect = val;
    notifyListeners();
  }

  final TextEditingController khanaHeadNameController = TextEditingController();
  final TextEditingController khanaHeadFatherController = TextEditingController();
  final TextEditingController khanaHeadHoldingNumber = TextEditingController();
  final TextEditingController khanaHeadMobileNumber = TextEditingController();
  final TextEditingController answerPersonLineNumber = TextEditingController();
  final TextEditingController answerPersonMobileNumber = TextEditingController();

  final FocusNode khanaHeadNameFocusNode = FocusNode();
  final FocusNode khanaHeadFatherFocusNode = FocusNode();
  final FocusNode khanaHeadHoldingFocusNode = FocusNode();
  final FocusNode khanaHeadMobileFocusNode = FocusNode();

  OtherStaticModel selectedTottoType = OtherStaticModel(id: '-1', description: 'নির্বাচন করুন');

  void resetTottoType() {
    selectedTottoType = OtherStaticModel(id: '-1', description: 'নির্বাচন করুন');
    unitSelect = -1;
    notifyListeners();
  }

  void changeTottoType(OtherStaticModel val) {
    selectedTottoType = val;
    selectedConductTypes.clear();
    selectedConductTypes = [];
    module3ModelList.clear();
    module3ModelList = [];
    providerAmonDhan.clearMember();
    providerBoroDhan.clearMember();
    providerAusDhan.clearMember();
    providerDhan.clearMember();
    providerCal.clearMember();
    providerMosur.clearMember();
    providerMango.clearMember();
    providerPeyaj.clearMember();
    providerAlu.clearMember();
    providerSorisha.clearMember();
    providerCarp.clearMember();
    providerCingri.clearMember();
    providerCow.clearMember();
    providerHen.clearMember();
    notifyListeners();
  }

  List<OtherStaticModel> selectedConductTypes = [];
  List<Module3Model> module3ModelList = [];

  // List<Module4Model> module4ModelList = [];
  int selectedPageIndex = 0;
  int firstConductIndex = 0;

  void shortByAscIDConductType() {
    selectedConductTypes.sort((a, b) {
      try {
        int idA = int.parse(a.id);
        int idB = int.parse(b.id);
        return idA.compareTo(idB);
      } catch (e) {
        return a.id.compareTo(b.id);
      }
    });
    firstConductIndex = 0;
    // Get.toNamed(AppRoutes.screenFoodLoss1);
    route(firstConductIndex);
    notifyListeners();
  }

  void nextConductType(BuildContext context) {
    if (firstConductIndex < selectedConductTypes.length - 1) {
      firstConductIndex++;
      route(firstConductIndex);
    } else {
      changeClickNoButtonFinally(false);
      Get.toNamed(AppRoutes.listingConfirmation);
    }
    notifyListeners();
  }

  void route(int index) {
    String currentTypeId = selectedConductTypes[index].id;
    String routeName = '';
    if (currentTypeId == '1') {
      routeName = AppRoutes.screenFoodLoss1;
    } else if (currentTypeId == '2') {
      routeName = AppRoutes.screenFoodLoss2;
    } else if (currentTypeId == '3') {
      routeName = AppRoutes.screenFoodLoss3;
    } else if (currentTypeId == '4') {
      routeName = AppRoutes.screenFoodLoss4;
    } else if (currentTypeId == '5') {
      routeName = AppRoutes.screenFoodLoss5;
    } else if (currentTypeId == '6') {
      routeName = AppRoutes.screenFoodLoss6;
    } else if (currentTypeId == '7') {
      routeName = AppRoutes.screenFoodLoss7;
    } else if (currentTypeId == '8') {
      routeName = AppRoutes.screenFoodLoss8;
    } else if (currentTypeId == '9') {
      routeName = AppRoutes.screenFoodLoss9;
    } else if (currentTypeId == '10') {
      routeName = AppRoutes.screenFoodLoss10;
    } else if (currentTypeId == '11') {
      routeName = AppRoutes.screenFoodLoss11;
    } else if (currentTypeId == '12') {
      routeName = AppRoutes.screenFoodLoss12;
    } else if (currentTypeId == '13') {
      routeName = AppRoutes.screenFoodLoss13;
    } else if (currentTypeId == '14') {
      routeName = AppRoutes.screenFoodLoss14;
    }
    Get.toNamed(routeName);
    // Navigator.pushNamed(context, routeName);
  }

  void previousConductType() {
    firstConductIndex--;
    notifyListeners();
  }

  void changeSelectedPageIndex(int val) {
    selectedPageIndex = val;
    notifyListeners();
  }

  void toggleConductType(OtherStaticModel val) {
    if (selectedConductTypes.contains(val)) {
      selectedConductTypes.remove(val);

      if (val.id == '1') {
        providerAmonDhan.clearMember();
      } else if (val.id == '2') {
        providerBoroDhan.clearMember();
      } else if (val.id == '3') {
        providerAusDhan.clearMember();
      } else if (val.id == '4') {
        providerDhan.clearMember();
      } else if (val.id == '5') {
        providerCal.clearMember();
      } else if (val.id == '6') {
        providerMosur.clearMember();
      } else if (val.id == '7') {
        providerMango.clearMember();
      } else if (val.id == '8') {
        providerPeyaj.clearMember();
      } else if (val.id == '9') {
        providerAlu.clearMember();
      } else if (val.id == '10') {
        providerSorisha.clearMember();
      } else if (val.id == '11') {
        providerCarp.clearMember();
      } else if (val.id == '12') {
        providerCingri.clearMember();
      } else if (val.id == '13') {
        providerCow.clearMember();
      } else if (val.id == '14') {
        providerHen.clearMember();
      }
    } else {
      selectedConductTypes.add(val);
      if (val.id == '1') {
        providerAmonDhan.initializeData();
      } else if (val.id == '2') {
        providerBoroDhan.initializeData();
      } else if (val.id == '3') {
        providerAusDhan.initializeData();
      } else if (val.id == '4') {
        providerDhan.initializeData();
      } else if (val.id == '5') {
        providerCal.initializeData();
      } else if (val.id == '6') {
        providerMosur.initializeData();
      } else if (val.id == '7') {
        providerMango.initializeData();
      } else if (val.id == '8') {
        providerPeyaj.initializeData();
      } else if (val.id == '9') {
        providerAlu.initializeData();
      } else if (val.id == '10') {
        providerSorisha.initializeData();
      } else if (val.id == '11') {
        providerCarp.initializeData();
      } else if (val.id == '12') {
        providerCingri.initializeData();
      } else if (val.id == '13') {
        providerCow.initializeData();
      } else if (val.id == '14') {
        providerHen.initializeData();
      }
      module3ModelList.add(Module3Model(otherStaticModel: val));
      notifyListeners();
    }
  }

  void updateModule3(int index, Module3Model member) {
    if (index >= 0 && index < module3ModelList.length) {
      module3ModelList[index].landQuantity = member.landQuantity;
      module3ModelList[index].productionQuantity = member.productionQuantity;
      module3ModelList[index].otherSourceQuantity = member.otherSourceQuantity;
      module3ModelList[index].salesQuantity = member.salesQuantity;
      notifyListeners();
    }
  }

  OtherStaticModel? selectedHouseType;
  TextEditingController otherHouseTypeController = TextEditingController();
  String otherHouseType = '';
  OtherStaticModel? selectedKitchenType;
  TextEditingController otherKitchenTypeController = TextEditingController();
  String otherKitchenType = '';
  OtherStaticModel? selectedKookingFuelType;
  TextEditingController otherKookingFuelTypeController = TextEditingController();
  String otherKookingFuelType = '';
  OtherStaticModel? selectedElectricitySourceType;
  TextEditingController otherElectricitySourceTypeController = TextEditingController();
  String otherElectricitySourceType = '';
  OtherStaticModel? selectedDrinkingWaterType;
  TextEditingController otherDrinkingWaterTypeController = TextEditingController();
  String otherDrinkingWaterType = '';
  OtherStaticModel? selectedToiletType;
  TextEditingController otherToiletTypeController = TextEditingController();
  String otherToiletType = '';
  String otherMachineUse = '';
  String otherMachineLossReasonUse = '';

  void changeMachineReasonOrLoss(int type, String val) {
    if (type == 1) {
      otherMachineUse = val;
    } else if (type == 2) {
      otherMachineLossReasonUse = val;
    }
  }

  void changeOtherTypeSection2(int type, String val) {
    if (type == 0) {
      otherHouseType = val;
    }
    if (type == 1) {
      otherKitchenType = val;
    } else if (type == 2) {
      otherKookingFuelType = val;
    } else if (type == 3) {
      otherElectricitySourceType = val;
    } else if (type == 4) {
      otherDrinkingWaterType = val;
    } else if (type == 5) {
      otherToiletType = val;
    } else if (type == 7) {
      otherBusinessType = val;
    }
    notifyListeners();
  }

  void changeBasicInformationType(int type, {OtherStaticModel? val}) {
    if (type == 1) {
      selectedHouseType = val;
    } else if (type == 2) {
      selectedKitchenType = val;
    } else if (type == 3) {
      selectedKookingFuelType = val;
    } else if (type == 4) {
      selectedElectricitySourceType = val;
    } else if (type == 5) {
      selectedDrinkingWaterType = val;
    } else if (type == 6) {
      selectedToiletType = val;
    }
    notifyListeners();
  }

  int? memberListCount;

  void changeMemberListCount(int val) {
    if (val == 0) {
      for (var member in khanaMemberList) {
        member.dispose();
      }
      khanaMemberList.clear();
      khanaMemberList = [];
      memberListCount = null;
    } else {
      memberListCount = val;
      khanaMemberList.clear();
      khanaMemberList = [];
      khanaMemberList = List<KhanaMemberModel>.generate(val, (index) => KhanaMemberModel(lineNumber: (index + 1).toString()));
      khanaMemberList[0].memberRelation = OtherStaticModel(id: '1', description: 'খানা প্রধান');
    }
    notifyListeners();
  }

  List<KhanaMemberModel> khanaMemberList = [];

  void updateKhanaMember(int index, KhanaMemberModel member) {
    if (index >= 0 && index < khanaMemberList.length) {
      khanaMemberList[index] = member;
      notifyListeners();
    }
  }

  //TODO: For Organization Survey

  TextEditingController organizationOwnerNameController = TextEditingController();
  TextEditingController organizationOwnerAgeController = TextEditingController();
  TextEditingController organizationHoldingNumberController = TextEditingController();
  TextEditingController organizationAddressController = TextEditingController();
  TextEditingController organizationPhoneController = TextEditingController();
  TextEditingController organizationEstablishedYearController = TextEditingController();
  TextEditingController organizationDailyWorkedMan = TextEditingController();
  TextEditingController organizationDailyWorkedWomen = TextEditingController();
  TextEditingController organizationDailyWorkedOther = TextEditingController();
  TextEditingController organizationDailyIrregularWorkedMan = TextEditingController();
  TextEditingController organizationDailyIrregularWorkedWomen = TextEditingController();
  TextEditingController organizationDailyIrregularWorkedOther = TextEditingController();

  int totalRegularWorker = 0;
  int totalIrregularWorker = 0;

  void updateTotalWorkers() {
    totalRegularWorker =
        (int.tryParse(organizationDailyWorkedMan.text) ?? 0) + (int.tryParse(organizationDailyWorkedWomen.text) ?? 0) + (int.tryParse(organizationDailyWorkedOther.text) ?? 0);
    totalIrregularWorker =
        (int.tryParse(organizationDailyIrregularWorkedMan.text) ?? 0) +
        (int.tryParse(organizationDailyIrregularWorkedWomen.text) ?? 0) +
        (int.tryParse(organizationDailyIrregularWorkedOther.text) ?? 0);
    notifyListeners();
  }

  FocusNode organizationOwnerNameFocusNode = FocusNode();
  FocusNode organizationOwnerAgeFocusNode = FocusNode();
  FocusNode organizationHoldingNumberFocusNode = FocusNode();
  FocusNode organizationAddressFocusNode = FocusNode();
  FocusNode organizationPhoneFocusNode = FocusNode();
  FocusNode organizationEstablishedYearFocusNode = FocusNode();
  FocusNode organizationDailyWorkedManFocusNode = FocusNode();
  FocusNode organizationDailyWorkedWomenFocusNode = FocusNode();
  FocusNode organizationDailyWorkedOtherFocusNode = FocusNode();
  FocusNode organizationDailyIrregularWorkedManFocusNode = FocusNode();
  FocusNode organizationDailyIrregularWorkedWomenFocusNode = FocusNode();
  FocusNode organizationDailyIrregularWorkedOtherFocusNode = FocusNode();

  OtherStaticModel? selectGender;

  void changeGender(OtherStaticModel? val) {
    selectGender = val;
    notifyListeners();
  }

  OtherStaticModel? selectedOrganizationType;

  void changeOrganizationType(OtherStaticModel? val) {
    selectedOrganizationType = val;
    notifyListeners();
  }

  OtherStaticModel? selectedBusinessType;
  String otherBusinessType = '';
  TextEditingController otherBusinessTypeController = TextEditingController();

  void changeBusinessType(OtherStaticModel? val) {
    selectedBusinessType = val;
    notifyListeners();
  }

  OtherStaticModel? uddesshoType;
  OtherStaticModel? transportUseOrNo;

  void changeUddesshoType(OtherStaticModel? val) {
    uddesshoType = val;
    notifyListeners();
  }

  void changeTransportUseOrNo(OtherStaticModel? val) {
    transportUseOrNo = val;
    notifyListeners();
  }

  // TODO: For Payload

  DateTime startTimeSurvey = DateTime.now();

  void startTime() {
    startTimeSurvey = DateTime.now();
  }

  Module01Identification module01Identification = Module01Identification();
  MetaDataStart metaDataStart = MetaDataStart();

  void initializeFirstData(HelperProvider helperProvider) {
    module01Identification = Module01Identification(geoCode: helperProvider.geoCode, respondentType: unitSelect, respondentTypeLabel: unitSelect == 1 ? 'খানা' : 'প্রতিষ্ঠান');
    UserModel userModel = UserModel.fromJson(storage.get(AppConstant.userInfoSharedData) ?? {});
    metaDataStart = MetaDataStart(
      deviceID: uuid.v6(),
      surveyorId: userModel.id.toString(),
      startDate: startTimeSurvey.toIso8601String(),
      submissionDate: null,
      gpsCoordinates: GpsCoordinates(latitude: _prefs.getDouble('user_latitude') ?? 23.8041, longitude: _prefs.getDouble('user_longitude') ?? 90.4152, accuracy: 12),
      appVersion: '${dotenv.env['APP_VERSION']}',
    );
    notifyListeners();
  }

  Module02GeneralInfo module02GeneralInfo = Module02GeneralInfo();

  void secondStepClick(int lastSaveNumber) {
    HouseholdDetails householdDetails = HouseholdDetails();
    InstitutionDetails institutionDetails = InstitutionDetails();

    if (unitSelect == 1) {
      List<Members> members = khanaMemberList.map((member) {
        return Members(
          lineNo: int.parse(member.lineNumber.toString()),
          name: member.memberName,
          relationship: member.memberRelation,
          gender: member.memberGender,
          age: member.memberAge == null ? 0 : int.parse(member.memberAge.toString()),
          religion: member.religion,
          maritalStatus: member.marriageStatus,
          educationCode: member.educationLevel,
          isInvolvedAgri: member.agricultureRelative,
          incomeSource: member.incomeSource,
          // age: member.age,
        );
      }).toList();

      householdDetails = HouseholdDetails(
        description: OtherStaticModel(id: '1', description: 'সাধারণ খানা'),
        khanaNumber: getSLNumber(lastSaveNumber),
        khanaHeadName: khanaHeadNameController.text.trim(),
        fatherHusbandName: khanaHeadFatherController.text.trim(),
        addressHoldingNo: khanaHeadHoldingNumber.text.trim(),
        respondentMobile: khanaHeadMobileNumber.text.trim(),
        houseType: selectedHouseType,
        kitchenStatus: selectedKitchenType,
        fuelSource: selectedKookingFuelType,
        electricitySource: selectedElectricitySourceType,
        waterSource: selectedDrinkingWaterType,
        toiletFacility: selectedToiletType,
        answerPersonLineNumber: answerPersonLineNumber.text.trim(),
        answerPersonPhoneNumber: answerPersonMobileNumber.text.trim(),
        members: members,
        houseTypeOthers: otherHouseType,
        kitchenStatusOthers: otherKitchenType,
        fuelSourceOthers: otherKookingFuelType,
        electricitySourceOthers: otherElectricitySourceType,
        waterSourceOthers: otherDrinkingWaterType,
        toiletFacilityOthers: otherToiletType,
      );
    } else if (unitSelect == 2) {
      institutionDetails = InstitutionDetails(
        institutionSerial: getSLNumber(lastSaveNumber),
        ownerName: organizationOwnerNameController.text.trim(),
        ownerGender: selectGender,
        ownerAge: organizationOwnerAgeController.text.trim(),
        organizationHoldingNo: organizationHoldingNumberController.text.trim(),
        organizationAddress: organizationAddressController.text.trim(),
        organizationPhone: organizationPhoneController.text.trim(),
        ownershipType: selectedOrganizationType,
        establishmentYear: organizationEstablishedYearController.text.trim(),
        institutionType: selectedBusinessType,
        manpowerIrregular: Manpower(
          male: int.tryParse(organizationDailyIrregularWorkedMan.text.trim()) ?? 0,
          female: int.tryParse(organizationDailyIrregularWorkedWomen.text.trim()) ?? 0,
          hijra: int.tryParse(organizationDailyIrregularWorkedOther.text.trim()) ?? 0,
        ),
        manpowerRegular: Manpower(
          male: int.tryParse(organizationDailyWorkedMan.text.trim()) ?? 0,
          female: int.tryParse(organizationDailyWorkedWomen.text.trim()) ?? 0,
          hijra: int.tryParse(organizationDailyWorkedOther.text.trim()) ?? 0,
        ),
      );
    }

    module02GeneralInfo = Module02GeneralInfo(
      householdDetails: unitSelect == 1 ? householdDetails : null,
      institutionDetails: unitSelect == 2 ? institutionDetails : null,
      typeOfProductOrFoodConduct: selectedConductTypes,
      informationLevel: selectedTottoType,
    );

    notifyListeners();
  }

  String getSLNumber(int number) {
    return 'FLW-${number.toString().length == 1
        ? '00$number'
        : number.toString().length == 2
        ? '0$number'
        : (number).toString()}';
  }

  FarmerProductionData farmerProductionData = FarmerProductionData();
  Module03ProductionActivity module03ProductionActivity = Module03ProductionActivity();

  List<Stages> stageData(List<Module4Model> listOfData, double lossWith) {
    List<Stages> stageList = [];
    String lossPercentage1 = '0';
    for (var element in listOfData) {
      final double lossQty = (element.lossAmountPerKg ?? 0).toDouble();
      final double lossRate = (lossQty * 100.0) / lossWith;
      if (lossRate == 0 || lossRate.isNaN) lossPercentage1 = '0%';
      lossPercentage1 = (lossRate % 1 == 0) ? "${lossRate.toInt()}%" : "${lossRate.toStringAsFixed(2)}%";

      stageList.add(
        Stages(
          causeCode: element.lossReasonData,
          machineUsed: element.useMachineOrNot,
          stageInfo: element.typeData!,
          lossAmountKg: element.lossAmountPerKg,
          lossPercentage: lossPercentage1,
        ),
      );
    }
    return stageList;
  }

  String totalLoss(List<Module4Model> listOfData) {
    double totalLossAmount = 0;
    for (var element in listOfData) {
      totalLossAmount += (element.lossAmountPerKg == null ? 0 : element.lossAmountPerKg!);
    }
    return totalLossAmount.toString();
  }

  void updateForm4Data(int part, double lossWith) {
    module03ProductionActivity = Module03ProductionActivity(
      description: part == 1
          ? 'উৎপাদন: খানা/প্রতিষ্ঠান কৃষি খামার'
          : 'প্রতিষ্ঠান/ব্যবসায়ী: ব্যাপারি/Middleman/পাইকারি/আড়ৎদার/মিলার/কসাইখানা/গোডাউন/প্রসেসিং প্রতিষ্ঠানের জন্য প্রযোজ্য',
      items: module3ModelList,
    );
    notifyListeners();
  }

  PayloadModel payloadModel = PayloadModel();

  void saveTempData() {
    initializeFirstData(providerHelper);
    secondStepClick(providerSaveData.dashboardCount!.totalCount + 1);
  }

  void saveFormData(SaveDataProvider provider, Function callback, bool statusForm) async {
    metaDataStart.submissionDate = DateTime.now().toIso8601String();
    payloadModel = PayloadModel(
      metaData: metaDataStart,
      module01Identification: module01Identification,
      module02GeneralInfo: module02GeneralInfo,
      module03ProductionActivity: module03ProductionActivity,
      timeStamp: DateTime.now().toIso8601String(),
      isDoneAll: statusForm,
      psuNumber: psuValue,
      amonDhanModel: providerAmonDhan.member,
      boroDhanModel: providerBoroDhan.member,
      ausDhanModel: providerAusDhan.member,
      dhanModel: providerDhan.member,
      calModel: providerCal.member,
      mosurModel: providerMosur.member,
      sorisaModel: providerSorisha.member,
      mangoModel: providerMango.member,
      cingriModel: providerCingri.member,
      carpModel: providerCarp.member,
      meetCowModel: providerCow.member,
      meetHenModel: providerHen.member,
      aluModel: providerAlu.member,
      peyajModel: providerPeyaj.member,
      uniqueID: isFromUpdate == false ? DateTime.now().microsecondsSinceEpoch.toString() : retrivePayloadModel.uniqueID,
    );
    notifyListeners();
    await saveJsonToFile(payloadModel.toJson());
    provider.addSurveyData(payloadModel);
    clearAllData();
    notifyListeners();

    callback(true);
  }

  int index = -1;
  bool isFromUpdate = false;
  bool isFromTemporarySave = false;

  void changeFromTrue() {
    isFromUpdate = true;
    notifyListeners();
  }

  void changeFromTemporarySaveTrue() {
    isFromTemporarySave = true;
  }

  void clearAllData() {
    // Clear all data and reset to initial state
    index = -1;
    isFromUpdate = false;
    isFromTemporarySave = false;
    selectedConductTypes.clear();
    module3ModelList.clear();
    selectedHouseType = null;
    selectedKitchenType = null;
    otherHouseType = '';
    otherKitchenType = '';
    selectedKookingFuelType = null;
    otherKookingFuelType = '';
    selectedElectricitySourceType = null;
    otherElectricitySourceType = '';
    selectedDrinkingWaterType = null;
    otherDrinkingWaterType = '';
    selectedToiletType = null;
    otherToiletType = '';
    otherBusinessType = '';
    otherMachineUse = '';
    otherMachineLossReasonUse = '';

    khanaHeadNameController.clear();
    khanaHeadFatherController.clear();
    khanaHeadHoldingNumber.clear();
    khanaHeadMobileNumber.clear();
    answerPersonLineNumber.clear();
    answerPersonMobileNumber.clear();
    otherHouseTypeController.clear();
    otherKitchenTypeController.clear();
    otherKookingFuelTypeController.clear();
    otherElectricitySourceTypeController.clear();
    otherDrinkingWaterTypeController.clear();
    otherToiletTypeController.clear();
    organizationOwnerNameController.clear();
    organizationOwnerAgeController.clear();
    organizationHoldingNumberController.clear();
    organizationAddressController.clear();
    organizationPhoneController.clear();
    organizationEstablishedYearController.clear();
    organizationDailyWorkedMan.clear();
    organizationDailyWorkedWomen.clear();
    organizationDailyWorkedOther.clear();
    organizationDailyIrregularWorkedMan.clear();
    organizationDailyIrregularWorkedWomen.clear();
    organizationDailyIrregularWorkedOther.clear();
    otherBusinessTypeController.clear();
    psuCotroller.clear();
    psuController.clear();

    memberListCount = null;
    for (var member in khanaMemberList) {
      member.dispose();
    }
    khanaMemberList.clear();

    selectGender = null;
    selectedOrganizationType = null;
    selectedBusinessType = null;
    uddesshoType = null;
    transportUseOrNo = null;
    startTimeSurvey = DateTime.now();
    module01Identification = Module01Identification();
    metaDataStart = MetaDataStart();
    module02GeneralInfo = Module02GeneralInfo();
    farmerProductionData = FarmerProductionData();
    module03ProductionActivity = Module03ProductionActivity();
    payloadModel = PayloadModel();
    selectedTottoType = OtherStaticModel(id: '-1', description: 'নির্বাচন করুন');
    unitSelect = -1;
    selectedPageIndex = 0;
    formTypeSelect == -1;
    for (var module in module3ModelList) {
      module.dispose();
    }
    module3ModelList.clear();

    psuCotroller.clear();
    answerPersonName8_3 = '';
    psuValue = '';
    isClickNoButtonFinally = false;
    psuText = '';
    providerAmonDhan.clearMember();
    providerBoroDhan.clearMember();
    providerAusDhan.clearMember();
    providerDhan.clearMember();
    providerCal.clearMember();
    providerMosur.clearMember();
    providerMango.clearMember();
    providerPeyaj.clearMember();
    providerAlu.clearMember();
    providerSorisha.clearMember();
    providerCarp.clearMember();
    providerCingri.clearMember();
    providerCow.clearMember();
    providerHen.clearMember();
    notifyListeners();
  }

  bool isClickNoButtonFinally = false;

  void changeClickNoButtonFinally(bool val) {
    isClickNoButtonFinally = val;
    notifyListeners();
  }

  TextEditingController psuCotroller = TextEditingController();
  FocusNode psuFocusNode = FocusNode();
  String psuValue = '';

  void changePsuValue(String val) {
    psuValue = val;
    notifyListeners();
  }

  TextEditingController psuController = TextEditingController();
  String psuText = '';

  void changePSUText(String value) {
    psuText = value;
    notifyListeners();
  }

  // TODO: Retrive Payload Data from Cash
  PayloadModel retrivePayloadModel = PayloadModel();

  void initializeRetrivePayloadData(PayloadModel payload, int i) {
    retrivePayloadModel = payload;
    index = i;
    notifyListeners();
  }

  void setAllValue() {
    formTypeSelect = 1;
    psuValue = retrivePayloadModel.psuNumber ?? '';
    psuText = retrivePayloadModel.psuNumber ?? '';
    psuCotroller.text = retrivePayloadModel.psuNumber ?? '';
    selectedConductTypes.clear();
    unitSelect = (retrivePayloadModel.module01Identification?.respondentType ?? -1) as int;
    selectedTottoType = retrivePayloadModel.module02GeneralInfo?.informationLevel ?? OtherStaticModel(id: '-1', description: 'নির্বাচন করুন');
    retrivePayloadModel.module02GeneralInfo?.typeOfProductOrFoodConduct?.forEach((item) {
      selectedConductTypes.add(item);
    });
    notifyListeners();
    if (retrivePayloadModel.module02GeneralInfo?.householdDetails != null) {
      var hh = retrivePayloadModel.module02GeneralInfo!.householdDetails!;
      khanaHeadNameController.text = hh.khanaHeadName ?? '';
      khanaHeadFatherController.text = hh.fatherHusbandName ?? '';
      khanaHeadHoldingNumber.text = hh.addressHoldingNo ?? '';
      khanaHeadMobileNumber.text = hh.respondentMobile ?? '';
      answerPersonLineNumber.text = hh.answerPersonLineNumber ?? '';
      answerPersonMobileNumber.text = hh.answerPersonPhoneNumber ?? '';
      selectedHouseType = hh.houseType;
      selectedKitchenType = hh.kitchenStatus;
      selectedKookingFuelType = hh.fuelSource;
      selectedElectricitySourceType = hh.electricitySource;
      selectedDrinkingWaterType = hh.waterSource;
      selectedToiletType = hh.toiletFacility;
      khanaMemberList =
          hh.members
              ?.map(
                (m) => KhanaMemberModel(
                  lineNumber: m.lineNo?.toString() ?? '',
                  memberName: m.name ?? '',
                  memberRelation: m.relationship,
                  memberGender: m.gender,
                  memberAge: m.age?.toString() ?? '',
                  religion: m.religion,
                  marriageStatus: m.maritalStatus,
                  educationLevel: m.educationCode,
                  agricultureRelative: m.isInvolvedAgri,
                  incomeSource: m.incomeSource,
                ),
              )
              .toList() ??
          [];
      answerPersonName8_3 = hh.members?.firstWhere((member) => member.lineNo == int.tryParse(hh.answerPersonLineNumber ?? ''), orElse: () => Members()).name ?? '';
      memberListCount = khanaMemberList.length;

      otherHouseType = hh.houseTypeOthers ?? '';
      otherHouseTypeController.text = hh.houseTypeOthers ?? '';
      otherKitchenType = hh.kitchenStatusOthers ?? '';
      otherKitchenTypeController.text = hh.kitchenStatusOthers ?? '';
      otherKookingFuelType = hh.fuelSourceOthers ?? '';
      otherKookingFuelTypeController.text = hh.fuelSourceOthers ?? '';
      otherElectricitySourceType = hh.electricitySourceOthers ?? '';
      otherElectricitySourceTypeController.text = hh.electricitySourceOthers ?? '';
      otherDrinkingWaterType = hh.waterSourceOthers ?? '';
      otherDrinkingWaterTypeController.text = hh.waterSourceOthers ?? '';
      otherToiletType = hh.toiletFacilityOthers ?? '';
      otherToiletTypeController.text = hh.toiletFacilityOthers ?? '';
    }

    // Institution details
    if (retrivePayloadModel.module02GeneralInfo?.institutionDetails != null) {
      var inst = retrivePayloadModel.module02GeneralInfo!.institutionDetails!;
      organizationOwnerNameController.text = inst.ownerName ?? '';
      organizationOwnerAgeController.text = inst.ownerAge ?? '';
      organizationHoldingNumberController.text = inst.organizationHoldingNo ?? '';
      organizationAddressController.text = inst.organizationAddress ?? '';
      organizationPhoneController.text = inst.organizationPhone ?? '';
      organizationEstablishedYearController.text = inst.establishmentYear ?? '';
      organizationDailyWorkedMan.text = inst.manpowerRegular?.male?.toString() ?? '';
      organizationDailyWorkedWomen.text = inst.manpowerRegular?.female?.toString() ?? '';
      organizationDailyWorkedOther.text = inst.manpowerRegular?.hijra?.toString() ?? '';
      organizationDailyIrregularWorkedMan.text = inst.manpowerIrregular?.male?.toString() ?? '';
      organizationDailyIrregularWorkedWomen.text = inst.manpowerIrregular?.female?.toString() ?? '';
      organizationDailyIrregularWorkedOther.text = inst.manpowerIrregular?.hijra?.toString() ?? '';
      selectGender = inst.ownerGender; // Assuming id
      selectedOrganizationType = inst.ownershipType;
      selectedBusinessType = inst.institutionType;
    }

    // Module 3
    module3ModelList = retrivePayloadModel.module03ProductionActivity?.items?.map((item) => Module3Model.fromJson(item.toJson())).toList() ?? [];

    providerAmonDhan.initializeValue(retrivePayloadModel.amonDhanModel ?? Module3Model());
    providerBoroDhan.initializeValue(retrivePayloadModel.boroDhanModel ?? Module3Model());
    providerAusDhan.initializeValue(retrivePayloadModel.ausDhanModel ?? Module3Model());
    providerDhan.initializeValue(retrivePayloadModel.dhanModel ?? Module3Model());
    providerCal.initializeValue(retrivePayloadModel.calModel ?? Module3Model());
    providerMosur.initializeValue(retrivePayloadModel.mosurModel ?? Module3Model());
    providerSorisha.initializeValue(retrivePayloadModel.sorisaModel ?? Module3Model());
    providerMango.initializeValue(retrivePayloadModel.mangoModel ?? Module3Model());
    providerCingri.initializeValue(retrivePayloadModel.cingriModel ?? Module3Model());
    providerCarp.initializeValue(retrivePayloadModel.carpModel ?? Module3Model());
    providerCow.initializeValue(retrivePayloadModel.meetCowModel ?? Module3Model());
    providerHen.initializeValue(retrivePayloadModel.meetHenModel ?? Module3Model());
    providerAlu.initializeValue(retrivePayloadModel.aluModel ?? Module3Model());
    providerPeyaj.initializeValue(retrivePayloadModel.peyajModel ?? Module3Model());
    notifyListeners();
  }
}
