import 'package:bpls_mobile/datasource/model/payload_model.dart';
import 'package:flutter/material.dart';

import '../../datasource/static_data/static_data.dart';

class HelperProvider with ChangeNotifier {
  AddressStaticDataModel? selectedDivision;
  AddressStaticDataModel? selectedDistrict;
  AddressStaticDataModel? selectedUpazilas;
  AddressStaticDataModel? selectedCityCorporations;
  AddressStaticDataModel? selectedWards;
  AddressStaticDataModel? selectedPorosonas;
  AddressStaticDataModel? selectedMoujas;
  AddressStaticDataModel? selectedVillages;
  AddressStaticDataModel? selectedUnions;
  AddressStaticDataModel? selectedEA;
  AddressStaticDataModel? selectedSurveyVillages;
  AddressStaticDataModel? selectedSurveyRmoTypes;

  void updateStaticData(int type, {AddressStaticDataModel? data}) {
    switch (type) {
      case 1:
        selectedDivision = data;
        selectedDistrict = null;
        selectedUpazilas = null;
        selectedCityCorporations = null;
        selectedWards = null;
        selectedPorosonas = null;
        selectedMoujas = null;
        selectedVillages = null;
        selectedSurveyVillages = null;
        selectedSurveyRmoTypes = null;
        break;
      case 2:
        selectedDistrict = data;
        selectedUpazilas = null;
        selectedCityCorporations = null;
        selectedWards = null;
        selectedPorosonas = null;
        selectedMoujas = null;
        selectedVillages = null;
        selectedSurveyVillages = null;
        selectedSurveyRmoTypes = null;

        break;
      case 3:
        selectedUpazilas = data;
        selectedCityCorporations = null;
        selectedWards = null;
        selectedPorosonas = null;
        selectedMoujas = null;
        selectedVillages = null;
        selectedSurveyVillages = null;
        selectedSurveyRmoTypes = null;

        break;
      case 4:
        selectedCityCorporations = data;
        selectedWards = null;
        selectedPorosonas = null;
        selectedMoujas = null;
        selectedVillages = null;
        selectedSurveyVillages = null;
        selectedSurveyRmoTypes = null;
        break;
      case 5:
        selectedWards = data;
        selectedPorosonas = null;
        selectedMoujas = null;
        selectedVillages = null;
        selectedSurveyVillages = null;
        selectedSurveyRmoTypes = null;
        break;
      case 6:
        selectedPorosonas = data;
        selectedMoujas = null;
        selectedVillages = null;
        selectedSurveyVillages = null;
        selectedSurveyRmoTypes = null;
        break;
      case 7:
        selectedMoujas = data;
        selectedVillages = null;
        selectedSurveyVillages = null;
        selectedSurveyRmoTypes = null;
        break;
      case 8:
        selectedVillages = data;
        selectedSurveyVillages = null;
        selectedSurveyRmoTypes = null;
        break;
      case 9:
        selectedSurveyVillages = data;
        selectedSurveyRmoTypes = null;
        break;
      case 10:
        selectedSurveyRmoTypes = data;
        break;
    }
    notifyListeners();
  }

  void clearSelections() {
    selectedDivision = null;
    selectedDistrict = null;
    selectedUpazilas = null;
    selectedCityCorporations = null;
    selectedWards = null;
    selectedPorosonas = null;
    selectedMoujas = null;
    selectedVillages = null;
    selectedSurveyVillages = null;
    selectedSurveyRmoTypes = null;
    notifyListeners();
  }

  GeoCode geoCode=GeoCode();
  void updateMetaData(){
    geoCode=GeoCode(
      divisionCode: selectedDivision==null?"":selectedDivision!.code,
      districtCode: selectedDistrict==null?"":selectedDistrict!.code,
      upazilaCode: selectedUpazilas==null?"":selectedUpazilas!.code,
      cityCorpCode: selectedCityCorporations==null?"":selectedCityCorporations!.code,
      pourashavaCode: selectedPorosonas==null?"":selectedPorosonas!.code,
      unionCode: selectedUnions==null?"":selectedUnions!.code,
      wardCode: selectedWards==null?"":selectedWards!.code,
      mouzaCode: selectedMoujas==null?"":selectedMoujas!.code,
      villageCode: selectedVillages==null?"":selectedVillages!.code,
      eaCode: selectedEA==null?"":selectedEA!.code,
      rmoCode: selectedSurveyRmoTypes==null?"":selectedSurveyRmoTypes!.code,
    );
    notifyListeners();
  }


}
