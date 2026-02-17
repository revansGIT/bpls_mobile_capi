import 'package:bpls_mobile/main.dart';

class OtherStaticModel {
  final String id;
  final String description;

  OtherStaticModel({required this.id, required this.description});

  Map<String, dynamic> toJson() {
    return {'id': id, 'description': description};
  }

  OtherStaticModel.fromJson(Map<String, dynamic> json) : id = json['id'].toString(), description = json['description'].toString();

  @override
  bool operator ==(Object other) => other is OtherStaticModel && id == other.id;

  @override
  int get hashCode => id.hashCode;
}

dynamic getLossReasonList(String key) {
  switch (key) {
    case 'lossReasonList1':
      return lossReasonList1;
    case 'lossReasonList2':
      return lossReasonList2;
    case 'lossReasonList3':
      return lossReasonList3;
    case 'lossReasonList4':
      return lossReasonList4;
    case 'lossReasonList5':
      return lossReasonList5;
    case 'lossReasonList6':
      return lossReasonList6;
    case 'lossReasonList7':
      return lossReasonList7;
    case 'lossReasonList8':
      return lossReasonList8;
    case 'lossReasonList9':
      return lossReasonList9;
    case 'lossReasonList10':
      return lossReasonList10;
    case 'lossReasonListPartTwo1':
      return lossReasonListPartTwo1;
    case 'lossReasonListPartTwo2':
      return lossReasonListPartTwo2;
    case 'lossReasonListPartTwo3':
      return lossReasonListPartTwo3;
    case 'lossReasonListPartTwo4':
      return lossReasonListPartTwo4;
    case 'lossReasonListPartTwo5':
      return lossReasonListPartTwo5;
    case 'lossReasonListPartTwo6':
      return lossReasonListPartTwo6;
    case 'lossReasonListPartTwo7':
      return lossReasonListPartTwo7;
    case 'lossReasonListPartTwo8':
      return lossReasonListPartTwo8;
    case 'lossReasonListPartThree1':
      return lossReasonListPartThree1;
    case 'lossReasonListPartThree2':
      return lossReasonListPartThree2;
    case 'lossReasonListPartThree3':
      return lossReasonListPartThree3;
    case 'lossReasonListPartThree4':
      return lossReasonListPartThree4;
    case 'lossReasonListPartThree5':
      return lossReasonListPartThree5;
    case 'lossReasonListPartFive1':
      return lossReasonListPartFive1;
    case 'lossReasonListPartFive2':
      return lossReasonListPartFive2;
    case 'lossReasonListPartFive3':
      return lossReasonListPartFive3;
    case 'lossReasonListPartFive4':
      return lossReasonListPartFive4;
    case 'lossReasonListPartFive5':
      return lossReasonListPartFive5;
    case 'lossReasonListPartFive6':
      return lossReasonListPartFive6;
    case 'lossReasonListPartFive7':
      return lossReasonListPartFive7;
    case 'lossReasonListPartFive8':
      return lossReasonListPartFive8;
    case 'lossReasonListPartFive9':
      return lossReasonListPartFive9;
    case 'lossReasonListPartFive10':
      return lossReasonListPartFive10;
    case 'lossReasonListPartFive11':
      return lossReasonListPartFive11;
    case 'lossReasonListPartFive12':
      return lossReasonListPartFive12;
    case 'lossReasonListPartFive13':
      return lossReasonListPartFive13;
    case 'lossReasonListPartFive14':
      return lossReasonListPartFive14;
    case 'lossReasonListPartFive15':
      return lossReasonListPartFive15;
    case 'lossReasonListPartFour1':
      return lossReasonListPartFour1;
    case 'lossReasonListPartFour2':
      return lossReasonListPartFour2;
    case 'lossReasonListPartFour3':
      return lossReasonListPartFour3;
    case 'lossReasonListPartFour4':
      return lossReasonListPartFour4;
    case 'lossReasonListPartFour5':
      return lossReasonListPartFour5;
    case 'lossReasonListPartFour6':
      return lossReasonListPartFour6;
    case 'lossReasonListPartFour7':
      return lossReasonListPartFour7;
    case 'lossReasonListPartFour8':
      return lossReasonListPartFour8;
    case 'lossReasonListPartFour9':
      return lossReasonListPartFour9;
    case 'lossReasonListPartFour10':
      return lossReasonListPartFour10;
    case 'lossReasonListPartFour11':
      return lossReasonListPartFour11;
    case 'storageLocationList':
      return storageLocationList;
    case 'cultivationLocationList1':
      return cultivationLocationList1;
    case 'lossReasonListMangoPartOneFirst':
      return lossReasonListMangoPartOneFirst;
    case 'lossReasonListMangoPartOneSecond':
      return lossReasonListMangoPartOneSecond;
    case 'lossReasonListMangoPartOneThird':
      return lossReasonListMangoPartOneThird;
    case 'lossReasonListMangoPartOneFourth':
      return lossReasonListMangoPartOneFourth;
    case 'lossReasonListMangoPartOneFifth':
      return lossReasonListMangoPartOneFifth;
    case 'lossReasonListMangoPartOneSixth':
      return lossReasonListMangoPartOneSixth;
    case 'lossReasonListMangoPartOneSeventh':
      return lossReasonListMangoPartOneSeventh;
    case 'lossReasonListMangoPartOneEighth':
      return lossReasonListMangoPartOneEighth;
    case 'lossReasonListMangoPartOneNinth':
      return lossReasonListMangoPartOneNinth;
    case 'lossReasonListMangoPartOneTenth':
      return lossReasonListMangoPartOneTenth;
    case 'lossReasonListMangoPartOneEleventh':
      return lossReasonListMangoPartOneEleventh;
    case 'lossReasonListMangoPartTwoFirst':
      return lossReasonListMangoPartTwoFirst;
    case 'lossReasonListMangoPartTwoSecond':
      return lossReasonListMangoPartTwoSecond;
    case 'lossReasonListMangoPartTwoThird':
      return lossReasonListMangoPartTwoThird;
    case 'lossReasonListMangoPartTwoFourth':
      return lossReasonListMangoPartTwoFourth;
    case 'lossReasonListMangoPartTwoFifth':
      return lossReasonListMangoPartTwoFifth;
    case 'lossReasonListMangoPartTwoSixth':
      return lossReasonListMangoPartTwoSixth;
    case 'lossReasonListMangoPartTwoSeventh':
      return lossReasonListMangoPartTwoSeventh;
    case 'lossReasonListMangoPartTwoEighth':
      return lossReasonListMangoPartTwoEighth;
    case 'lossReasonListMangoPartTwoNinth':
      return lossReasonListMangoPartTwoNinth;
    case 'lossReasonListMangoPartTwoTenth':
      return lossReasonListMangoPartTwoTenth;
    case 'lossReasonListMangoPartThreeFirst':
      return lossReasonListMangoPartThreeFirst;
    case 'lossReasonListMangoPartThreeSecond':
      return lossReasonListMangoPartThreeSecond;
    case 'lossReasonListMangoPartThreeThird':
      return lossReasonListMangoPartThreeThird;
    case 'lossReasonListMangoPartThreeFourth':
      return lossReasonListMangoPartThreeFourth;
    case 'lossReasonListMangoPartThreeFifth':
      return lossReasonListMangoPartThreeFifth;
    case 'lossReasonListMangoPartFourFirst':
      return lossReasonListMangoPartFourFirst;
    case 'lossReasonListMangoPartFourSecond':
      return lossReasonListMangoPartFourSecond;
    case 'lossReasonListMangoPartFourThird':
      return lossReasonListMangoPartFourThird;
    case 'lossReasonListMangoPartFourFourth':
      return lossReasonListMangoPartFourFourth;
    case 'lossReasonListMangoPartFourFifth':
      return lossReasonListMangoPartFourFifth;
    case 'lossReasonListMangoPartFourSixth':
      return lossReasonListMangoPartFourSixth;
    case 'lossReasonListMangoPartFourSeventh':
      return lossReasonListMangoPartFourSeventh;
    case 'lossReasonListMangoPartFourEighth':
      return lossReasonListMangoPartFourEighth;
    case 'lossReasonListMangoPartFourNinth':
      return lossReasonListMangoPartFourNinth;
    case 'lossReasonListMangoPartFourTenth':
      return lossReasonListMangoPartFourTenth;
    case 'lossReasonListMangoPartFourEleventh':
      return lossReasonListMangoPartFourEleventh;
    case 'lossReasonListMangoPartFourTwelfth':
      return lossReasonListMangoPartFourTwelfth;
    case 'lossReasonListCarpCingripPartOneFirst':
      return lossReasonListCarpCingripPartOneFirst;
    case 'lossReasonListCarpCingripPartOneSecond':
      return lossReasonListCarpCingripPartOneSecond;
    case 'lossReasonListCarpCingripPartOneThird':
      return lossReasonListCarpCingripPartOneThird;
    case 'lossReasonListCarpCingripPartOneFourth':
      return lossReasonListCarpCingripPartOneFourth;
    case 'lossReasonListCarpCingripPartOneFifth':
      return lossReasonListCarpCingripPartOneFifth;
    case 'lossReasonListCarpCingripPartOneSixth':
      return lossReasonListCarpCingripPartOneSixth;
    case 'lossReasonListCarpCingripPartOneSeventh':
      return lossReasonListCarpCingripPartOneSeventh;
    case 'lossReasonListCarpCingripPartOneEighth':
      return lossReasonListCarpCingripPartOneEighth;
    case 'lossReasonListCarpCingripPartOneNinth':
      return lossReasonListCarpCingripPartOneNinth;
    case 'lossReasonListCarpCingripPartOneTenth':
      return lossReasonListCarpCingripPartOneTenth;
    case 'lossReasonListCarpCingripPartOneEleventh':
      return lossReasonListCarpCingripPartOneEleventh;
    case 'lossReasonListCarpCingripPartOneTwelfth':
      return lossReasonListCarpCingripPartOneTwelfth;
    case 'lossReasonListCarpCingripPartTwoFirst':
      return lossReasonListCarpCingripPartTwoFirst;
    case 'lossReasonListCarpCingripPartTwoSecond':
      return lossReasonListCarpCingripPartTwoSecond;
    case 'lossReasonListCarpCingripPartTwoThird':
      return lossReasonListCarpCingripPartTwoThird;
    case 'lossReasonListCarpCingripPartTwoFourth':
      return lossReasonListCarpCingripPartTwoFourth;
    case 'lossReasonListCarpCingripPartTwoFifth':
      return lossReasonListCarpCingripPartTwoFifth;
    case 'lossReasonListCarpCingripPartTwoSixth':
      return lossReasonListCarpCingripPartTwoSixth;
    case 'lossReasonListCarpCingripPartTwoSeventh':
      return lossReasonListCarpCingripPartTwoSeventh;
    case 'lossReasonListCarpCingripPartTwoEighth':
      return lossReasonListCarpCingripPartTwoEighth;
    case 'lossReasonListCarpCingripPartTwoNinth':
      return lossReasonListCarpCingripPartTwoNinth;
    case 'lossReasonListCarpCingripPartTwoTenth':
      return lossReasonListCarpCingripPartTwoTenth;
    case 'lossReasonListCarpCingripPartTwoEleventh':
      return lossReasonListCarpCingripPartTwoEleventh;
    case 'lossReasonListCarpCingripPartThreeFirst':
      return lossReasonListCarpCingripPartThreeFirst;
    case 'lossReasonListCarpCingripPartThreeSecond':
      return lossReasonListCarpCingripPartThreeSecond;
    case 'lossReasonListCarpCingripPartThreeThird':
      return lossReasonListCarpCingripPartThreeThird;
    case 'lossReasonListCarpCingripPartThreeFourth':
      return lossReasonListCarpCingripPartThreeFourth;
    case 'lossReasonListCarpCingripPartThreeFifth':
      return lossReasonListCarpCingripPartThreeFifth;
    case 'lossReasonListCarpCingripPartThreeSixth':
      return lossReasonListCarpCingripPartThreeSixth;
    case 'lossReasonListCarpCingripPartThreeSeventh':
      return lossReasonListCarpCingripPartThreeSeventh;
    case 'lossReasonListCarpCingripPartThreeEighth':
      return lossReasonListCarpCingripPartThreeEighth;
    case 'lossReasonListCarpCingripPartThreeNinth':
      return lossReasonListCarpCingripPartThreeNinth;
    case 'lossReasonListAluOrionPartOneFirst':
      return lossReasonListAluOrionPartOneFirst;
    case 'lossReasonListAluOrionPartOneSecond':
      return lossReasonListAluOrionPartOneSecond;
    case 'lossReasonListAluOrionPartOneThird':
      return lossReasonListAluOrionPartOneThird;
    case 'lossReasonListAluOrionPartOneFourth':
      return lossReasonListAluOrionPartOneFourth;
    case 'lossReasonListAluOrionPartOneFifth':
      return lossReasonListAluOrionPartOneFifth;
    case 'lossReasonListAluOrionPartOneSixth':
      return lossReasonListAluOrionPartOneSixth;
    case 'lossReasonListAluOrionPartOneSeventh':
      return lossReasonListAluOrionPartOneSeventh;
    case 'lossReasonListAluOrionPartOneEighth':
      return lossReasonListAluOrionPartOneEighth;
    case 'lossReasonListAluOrionPartOneNinth':
      return lossReasonListAluOrionPartOneNinth;
    case 'lossReasonListAluOrionPartOneTenth':
      return lossReasonListAluOrionPartOneTenth;
    case 'lossReasonListAluOrionPartOneEleventh':
      return lossReasonListAluOrionPartOneEleventh;
    case 'lossReasonListAluOrionPartOneTwelfth':
      return lossReasonListAluOrionPartOneTwelfth;
    case 'lossReasonListAluOrionPartOneThirteenth':
      return lossReasonListAluOrionPartOneThirteenth;
    case 'lossReasonListAluOrionPartOneFourteenth':
      return lossReasonListAluOrionPartOneFourteenth;
    case 'lossReasonListAluOrionPartTwoFirst':
      return lossReasonListAluOrionPartTwoFirst;
    case 'lossReasonListAluOrionPartTwoSecond':
      return lossReasonListAluOrionPartTwoSecond;
    case 'lossReasonListAluOrionPartTwoThird':
      return lossReasonListAluOrionPartTwoThird;
    case 'lossReasonListAluOrionPartTwoFourth':
      return lossReasonListAluOrionPartTwoFourth;
    case 'lossReasonListAluOrionPartTwoFifth':
      return lossReasonListAluOrionPartTwoFifth;
    case 'lossReasonListAluOrionPartTwoSixth':
      return lossReasonListAluOrionPartTwoSixth;
    case 'lossReasonListAluOrionPartTwoSeventh':
      return lossReasonListAluOrionPartTwoSeventh;
    case 'lossReasonListAluOrionPartTwoEighth':
      return lossReasonListAluOrionPartTwoEighth;
    case 'lossReasonListAluOrionPartTwoNinth':
      return lossReasonListAluOrionPartTwoNinth;
    case 'lossReasonListAluOrionPartTwoTenth':
      return lossReasonListAluOrionPartTwoTenth;
    case 'lossReasonListAluOrionPartTwoEleventh':
      return lossReasonListAluOrionPartTwoEleventh;
    case 'lossReasonListAluOrionPartThreeFirst':
      return lossReasonListAluOrionPartThreeFirst;
    case 'lossReasonListAluOrionPartThreeSecond':
      return lossReasonListAluOrionPartThreeSecond;
    case 'lossReasonListAluOrionPartThreeThird':
      return lossReasonListAluOrionPartThreeThird;
    case 'lossReasonListAluOrionPartThreeFourth':
      return lossReasonListAluOrionPartThreeFourth;
    case 'lossReasonListAluOrionPartThreeFifth':
      return lossReasonListAluOrionPartThreeFifth;
    case 'lossReasonListAluOrionPartThreeSixth':
      return lossReasonListAluOrionPartThreeSixth;
    case 'lossReasonListAluOrionPartThreeSeventh':
      return lossReasonListAluOrionPartThreeSeventh;
    case 'lossReasonListAluOrionPartThreeEighth':
      return lossReasonListAluOrionPartThreeEighth;
    case 'lossReasonListAluOrionPartFourFirst':
      return lossReasonListAluOrionPartFourFirst;
    case 'lossReasonListAluOrionPartFourSecond':
      return lossReasonListAluOrionPartFourSecond;
    case 'lossReasonListAluOrionPartFourThird':
      return lossReasonListAluOrionPartFourThird;
    case 'lossReasonListAluOrionPartFourFourth':
      return lossReasonListAluOrionPartFourFourth;
    case 'lossReasonListAluOrionPartFourFifth':
      return lossReasonListAluOrionPartFourFifth;
    case 'lossReasonListAluOrionPartFourSixth':
      return lossReasonListAluOrionPartFourSixth;
    case 'lossReasonListAluOrionPartFourSeventh':
      return lossReasonListAluOrionPartFourSeventh;
    case 'lossReasonListAluOrionPartFourEighth':
      return lossReasonListAluOrionPartFourEighth;
    case 'lossReasonListAluOrionPartFourNinth':
      return lossReasonListAluOrionPartFourNinth;
    case 'lossReasonListAluOrionPartFourTenth':
      return lossReasonListAluOrionPartFourTenth;
    case 'lossReasonListAluOrionPartFourEleventh':
      return lossReasonListAluOrionPartFourEleventh;
    case 'lossReasonListAluOrionPartFourTwelfth':
      return lossReasonListAluOrionPartFourTwelfth;
    case 'lossReasonListAluOrionPartFourThirteenth':
      return lossReasonListAluOrionPartFourThirteenth;
    case 'lossReasonListAluOrionPartFourFourteenth':
      return lossReasonListAluOrionPartFourFourteenth;
    case 'lossReasonListAluOrionPartFourFifteenth':
      return lossReasonListAluOrionPartFourFifteenth;
    case 'lossReasonListCowHenPartOneFirst':
      return lossReasonListCowHenPartOneFirst;
    case 'lossReasonListCowHenPartOneSecond':
      return lossReasonListCowHenPartOneSecond;
    case 'lossReasonListCowHenPartOneThird':
      return lossReasonListCowHenPartOneThird;
    case 'lossReasonListCowHenPartOneFourth':
      return lossReasonListCowHenPartOneFourth;
    case 'lossReasonListCowHenPartOneFifth':
      return lossReasonListCowHenPartOneFifth;
    case 'lossReasonListCowHenPartOneSixth':
      return lossReasonListCowHenPartOneSixth;
    case 'lossReasonListCowHenPartOneSeventh':
      return lossReasonListCowHenPartOneSeventh;
    case 'lossReasonListCowHenPartTwoFirst':
      return lossReasonListCowHenPartTwoFirst;
    case 'lossReasonListCowHenPartTwoSecond':
      return lossReasonListCowHenPartTwoSecond;
    case 'lossReasonListCowHenPartTwoThird':
      return lossReasonListCowHenPartTwoThird;
    case 'lossReasonListCowHenPartTwoFourth':
      return lossReasonListCowHenPartTwoFourth;
    case 'lossReasonListCowHenPartTwoFifth':
      return lossReasonListCowHenPartTwoFifth;
    case 'lossReasonListCowHenPartTwoSixth':
      return lossReasonListCowHenPartTwoSixth;
    case 'lossReasonListCowHenPartTwoSeventh':
      return lossReasonListCowHenPartTwoSeventh;
    case 'lossReasonListCowHenPartTwoEighth':
      return lossReasonListCowHenPartTwoEighth;
    case 'lossReasonListCowHenPartTwoNinth':
      return lossReasonListCowHenPartTwoNinth;
    case 'lossReasonListCowHenPartTwoTenth':
      return lossReasonListCowHenPartTwoTenth;
    case 'lossReasonListCowHenPartThreeFirst':
      return lossReasonListCowHenPartThreeFirst;
    case 'lossReasonListCowHenPartThreeSecond':
      return lossReasonListCowHenPartThreeSecond;
    case 'lossReasonListCowHenPartThreeThird':
      return lossReasonListCowHenPartThreeThird;
    case 'lossReasonListCowHenPartThreeFourth':
      return lossReasonListCowHenPartThreeFourth;
    case 'lossReasonListCowHenPartThreeFifth':
      return lossReasonListCowHenPartThreeFifth;
    case 'lossReasonListCowHenPartThreeSixth':
      return lossReasonListCowHenPartThreeSixth;
    case 'lossReasonListCowHenPartThreeSeventh':
      return lossReasonListCowHenPartThreeSeventh;
    case 'lossReasonListCowHenPartThreeEighth':
      return lossReasonListCowHenPartThreeEighth;
    case 'lossReasonListCowHenPartThreeNinth':
      return lossReasonListCowHenPartThreeNinth;
    case 'lossReasonListCowHenPartThreeTenth':
      return lossReasonListCowHenPartThreeTenth;
    case 'lossReasonListCowHenPartThreeEleventh':
      return lossReasonListCowHenPartThreeEleventh;

    case 'lossReasonList96':
      return lossReasonList96;
    default:
      return null;
  }
}

List<OtherStaticModel> tottoTypes = [
  // OtherStaticModel(id: '1', description: 'খানা '),
  OtherStaticModel(id: '2', description: 'প্রাতিষ্ঠানিক কৃষি খামার '),
  OtherStaticModel(id: '3', description: 'ব্যাপারি (Middleman) '),
  OtherStaticModel(id: '4', description: 'পাইকারি/আড়ৎদার '),
  OtherStaticModel(id: '5', description: 'মিলার/কসাইখানা'),
  OtherStaticModel(id: '6', description: 'গোডাউন '),
  OtherStaticModel(id: '7', description: 'প্রসেসিং ইউনিট'),
];

List<OtherStaticModel> conductTypes1_2 = [
  OtherStaticModel(id: '1', description: 'আমন ধান'),
  OtherStaticModel(id: '2', description: 'বোরো ধান'),
  OtherStaticModel(id: '3', description: 'আউশ ধান'),
  OtherStaticModel(id: '5', description: 'চাল'),
  OtherStaticModel(id: '6', description: 'মসুর'),
  OtherStaticModel(id: '7', description: 'আম'),
  OtherStaticModel(id: '8', description: 'পেঁয়াজ'),
  OtherStaticModel(id: '9', description: 'আলু'),
  OtherStaticModel(id: '10', description: 'সরিষা'),
  OtherStaticModel(id: '11', description: 'কার্প জাতীয় মাছ (রুই, কাতলা, কালবাউশ, মৃগেল, অন্যান্য কার্প)'),
  OtherStaticModel(id: '12', description: 'চিংড়ি'),
  OtherStaticModel(id: '13', description: 'গরুর মাংস'),
  OtherStaticModel(id: '14', description: 'মুরগির মাংস (পোল্ট্রি/ব্রয়লারসহ সব ধরনের মুরগী)'),
];

List<OtherStaticModel> conductTypesOther = [
  OtherStaticModel(id: '4', description: 'ধান (সকল ধরনের ধান)'),
  OtherStaticModel(id: '5', description: 'চাল'),
  OtherStaticModel(id: '6', description: 'মসুর'),
  OtherStaticModel(id: '7', description: 'আম'),
  OtherStaticModel(id: '8', description: 'পেঁয়াজ'),
  OtherStaticModel(id: '9', description: 'আলু'),
  OtherStaticModel(id: '10', description: 'সরিষা'),
  OtherStaticModel(id: '12', description: 'চিংড়ি'),
  OtherStaticModel(id: '13', description: 'গরুর মাংস'),
  OtherStaticModel(id: '11', description: 'কার্প জাতীয় মাছ (রুই, কাতলা, কালিবাউশ, মৃগেল, অন্যান্য কার্প)'),
  OtherStaticModel(id: '14', description: 'মুরগির মাংস (পোল্ট্রি/ব্রয়লারসহ সব ধরনের মুরগী)'),
];

List<OtherStaticModel> houseTypeList = [
  OtherStaticModel(id: '1', description: 'পাকা'),
  OtherStaticModel(id: '2', description: 'আধা পাকা'),
  OtherStaticModel(id: '3', description: 'কাঁচা'),
  OtherStaticModel(id: '4', description: 'ঝুপড়ি'),
];

List<OtherStaticModel> kitchenTypeList = [
  OtherStaticModel(id: '1', description: 'ঘরের মধ্যে (একই ঘর)'),
  OtherStaticModel(id: '2', description: 'ঘরের মধ্যে (আলাদা করা)'),
  OtherStaticModel(id: '3', description: 'পৃথক রান্না ঘর'),
  OtherStaticModel(id: '96', description: 'অন্যান্য উল্লেখ করুন'),
];

List<OtherStaticModel> cookingFuelList = [
  OtherStaticModel(id: '1', description: 'খড়/পাতা/তুষ/ভুষি'),
  OtherStaticModel(id: '2', description: 'কাঠ/বাঁশ/পাটখড়ি/লাকড়ি'),
  OtherStaticModel(id: '3', description: 'চারকোল/গোবর/ঘুটে/বোড়ে/ঘষি'),
  OtherStaticModel(id: '4', description: 'সাপ্লাই গ্যাস'),
  OtherStaticModel(id: '5', description: 'বায়োগ্যাস/এলপি গ্যাস'),
  OtherStaticModel(id: '6', description: 'সৌরচুল্লি'),
  OtherStaticModel(id: '7', description: 'কেরোসিন'),
  OtherStaticModel(id: '8', description: 'বিদ্যুৎ'),
  OtherStaticModel(id: '96', description: 'অন্যান্য (উল্লেখ করুন...)'),
];

List<OtherStaticModel> electricitySourceList = [
  OtherStaticModel(id: '1', description: 'জাতীয় গ্রিড'),
  OtherStaticModel(id: '2', description: 'সৌরবিদ্যুৎ'),
  OtherStaticModel(id: '3', description: 'বিদ্যুৎ সুবিধা নেই'),
  OtherStaticModel(id: '96', description: 'অন্যান্য (উল্লেখ করুন...)'),
];

List<OtherStaticModel> drinkingWaterSourceList = [
  OtherStaticModel(id: '1', description: 'সাপ্লাই'),
  OtherStaticModel(id: '2', description: 'টিউবওয়েল (গভীর/অগভীর/সাবমার্সিবল)'),
  OtherStaticModel(id: '3', description: 'বোতলজাত পানি/পানির জার'),
  OtherStaticModel(id: '4', description: 'সুরক্ষিত: কূপ/কুয়া/ইদারা/রিংওয়েল'),
  OtherStaticModel(id: '5', description: 'অরক্ষিত: কূপ/কুয়া/ইদারা/রিংওয়েল'),
  OtherStaticModel(id: '6', description: 'পুকুর/নদী/খাল/লেক'),
  OtherStaticModel(id: '7', description: 'ঝরনা/ছড়া/ঝিরি'),
  OtherStaticModel(id: '8', description: 'সংগৃহীত বৃষ্টির পানি'),
  OtherStaticModel(id: '9', description: 'ওয়াটার কিওস্ক: এটিএম কার্ড দিয়ে পানি সংগ্রহ'),
  OtherStaticModel(id: '96', description: 'অন‌্যান‌্য (উল্লেখ করুন...)'),
];

List<OtherStaticModel> toiletFacilityList = [
  OtherStaticModel(id: '1', description: 'ফ্লাশ করে পাইপের মাধ্যমে সুয়ারেজ সিস্টেমে অপসারণ'),
  OtherStaticModel(id: '2', description: 'ফ্লাশ করে নিরাপদ ট্যাংকে ধারণ'),
  OtherStaticModel(id: '3', description: 'ফ্লাশ করে উন্মুক্ত নালায় অপসারণ'),
  OtherStaticModel(id: '4', description: 'স্ল‍্যাবসহ পিট ল্যাট্রিন'),
  OtherStaticModel(id: '5', description: 'স্ল‍্যাবছাড়া পিট/উন্মুক্ত পিট ল্যাট্রিন'),
  OtherStaticModel(id: '6', description: 'কাঁচা/খোলা/ঝুলন্ত ল্যাট্রিন (স্থায়ী/অস্থায়ী)'),
  OtherStaticModel(id: '96', description: 'অন্যান্য (উল্লেখ করুন...)'),
];

List<OtherStaticModel> khanaHeadRelationListOne = [OtherStaticModel(id: '1', description: 'খানা প্রধান')];
List<OtherStaticModel> khanaHeadRelationList = [
  OtherStaticModel(id: '2', description: 'স্ত্রী/স্বামী'),
  OtherStaticModel(id: '3', description: 'সন্তান'),
  OtherStaticModel(id: '4', description: 'মা/বাবা'),
  OtherStaticModel(id: '5', description: 'ভাই/বোন'),
  OtherStaticModel(id: '6', description: 'পুত্রবধূ/জামাতা'),
  OtherStaticModel(id: '7', description: 'নাতি/নাতনি'),
  OtherStaticModel(id: '8', description: 'গৃহকর্মী'),
  OtherStaticModel(id: '9', description: 'অন্যান্য আত্মীয়'),
  OtherStaticModel(id: '10', description: 'অন্যান্য অনাত্মীয়'),
];

List<OtherStaticModel> genderList = [
  OtherStaticModel(id: '1', description: 'পুরুষ'),
  OtherStaticModel(id: '2', description: 'মহিলা'),
  OtherStaticModel(id: '3', description: 'হিজড়া'),
];

List<OtherStaticModel> religionList = [
  OtherStaticModel(id: '1', description: 'মুসলমান'),
  OtherStaticModel(id: '2', description: 'হিন্দু'),
  OtherStaticModel(id: '3', description: 'খ্রিষ্টান'),
  OtherStaticModel(id: '4', description: 'বৌদ্ধ'),
  OtherStaticModel(id: '96', description: 'অন্যান্য'),
];

List<OtherStaticModel> maritalStatusList = [
  OtherStaticModel(id: '1', description: 'অবিবাহিত'),
  OtherStaticModel(id: '2', description: 'বিবাহিত'),
  OtherStaticModel(id: '3', description: 'বিধবা/বিপত্নীক'),
  OtherStaticModel(id: '4', description: 'তালাকপ্রাপ্ত'),
  OtherStaticModel(id: '5', description: 'পৃথক বসবাস'),
  OtherStaticModel(id: '96', description: 'অন্যান্য (উল্লেখ করুন...)'),
];

List<OtherStaticModel> educationLevelList = [
  OtherStaticModel(id: '25', description: 'প্লে/ নার্সারি/কেজি/ প্রাক.প্রাথমিক শ্রেণির শিক্ষার্থী'),
  OtherStaticModel(id: '26', description: '১ম শ্রেণির শিক্ষার্থী'),
  OtherStaticModel(id: '1', description: '১ম শ্রেণি পাশ'),
  OtherStaticModel(id: '2', description: '২য় শ্রেণি পাশ'),
  OtherStaticModel(id: '3', description: '৩য় শ্রেণি পাশ'),
  OtherStaticModel(id: '4', description: '৪র্থ শ্রেণি পাশ'),
  OtherStaticModel(id: '5', description: '৫ম শ্রেণি/পিইসি/ইবতেদায়ী/সমমান পাশ'),
  OtherStaticModel(id: '6', description: '৬ষ্ঠ শ্রেণি পাশ'),
  OtherStaticModel(id: '7', description: '৭ম শ্রেণি পাশ'),
  OtherStaticModel(id: '8', description: '৮ম শ্রেণি/জেএসসি/ জেডিসি/সমমান পাশ'),
  OtherStaticModel(id: '9', description: '৯ম শ্রেণি পাশ'),
  OtherStaticModel(id: '10', description: 'এসএসসি/দাখিল/ও.লেভেল/সমমান পাশ'),
  OtherStaticModel(id: '12', description: 'এইচএসসি/আলিম/এ.লেভেল/সমমান পাশ'),
  OtherStaticModel(id: '15', description: 'বিএ/বিএসসি/বিকম/বিবিএ/ফাজিল (পাসকোর্স) পাশ'),
  OtherStaticModel(id: '16', description: 'বিএ/বিএসসি/বিকম/বিবিএ (সম্মান) পাশ'),
  OtherStaticModel(id: '17', description: 'এমএ/এমএসসি/এমকম/এমবিএ/কামিল/সমমান পাশ'),
  OtherStaticModel(id: '18', description: 'পিএইচডি সম্পন্ন'),
  OtherStaticModel(id: '19', description: 'এমবিবিএস/বিডিএস পাশ'),
  OtherStaticModel(id: '20', description: 'নার্সিং/মিডওয়াইফারি পাশ'),
  OtherStaticModel(id: '21', description: 'ইঞ্জিনিয়ারিং (বিএসসি ও তদূর্ধ্ব) পাশ'),
  OtherStaticModel(id: '22', description: 'ডিপ্লোমা পাশ'),
  OtherStaticModel(id: '23', description: 'উপানুষ্ঠানিক (Non-Formal)/অপ্রাতিষ্ঠানিক'),
  OtherStaticModel(id: '24', description: 'কোনো শিক্ষা নেই'),
  OtherStaticModel(id: '96', description: 'অন্যান্য (উল্লেখ করুন...)'),
];

List<OtherStaticModel> yesNoList = [OtherStaticModel(id: '1', description: 'হ্যাঁ'), OtherStaticModel(id: '2', description: 'না')];

List<OtherStaticModel> mainIncomeSourceList = [
  OtherStaticModel(id: '1', description: 'কৃষি'),
  OtherStaticModel(id: '2', description: 'মজুরি'),
  OtherStaticModel(id: '3', description: 'চাকরি'),
  OtherStaticModel(id: '4', description: 'ব্যবসা'),
  OtherStaticModel(id: '5', description: 'প্রবাসী আয়'),
  OtherStaticModel(id: '6', description: 'প্রযোজ্য নয়'),
  OtherStaticModel(id: '96', description: 'অন্যান্য (উল্লেখ করুন...)'),
];

List<int> totalMemberList = List<int>.generate(30, (index) => index + 1);

List<OtherStaticModel> residenceTypeList = [
  OtherStaticModel(id: '1', description: 'স্থায়ী'),
  OtherStaticModel(id: '2', description: 'অস্থায়ী'),
  OtherStaticModel(id: '3', description: 'ভ্রাম্যমাণ'),
];

List<OtherStaticModel> organizationTypeList = [
  OtherStaticModel(id: '1', description: 'একক/ব্যক্তিগত'),
  OtherStaticModel(id: '2', description: 'অংশীদারি'),
  OtherStaticModel(id: '3', description: 'প্রাইভেট লিমিটেড'),
  OtherStaticModel(id: '4', description: 'সরকারি'),
  OtherStaticModel(id: '5', description: 'স্বায়ত্তশাসিত'),
  OtherStaticModel(id: '96', description: 'অন্যান্য'),
];

List<OtherStaticModel> productionPurposeList = [
  OtherStaticModel(id: '1', description: 'বিক্রয়ের জন্য'),
  OtherStaticModel(id: '2', description: 'প্রধানত বিক্রয়ের জন্য'),
  OtherStaticModel(id: '3', description: 'প্রধানত নিজের ব্যবহারের জন্য'),
  OtherStaticModel(id: '4', description: 'নিজের ব্যবহারের জন্য'),
  OtherStaticModel(id: '5', description: 'বিক্রয় ও নিজের ব্যবহারের জন্য'),
];

List<OtherStaticModel> productionLocationList = [
  OtherStaticModel(id: '1', description: 'ক্ষেতে'),
  OtherStaticModel(id: '2', description: 'বাড়ির আঙ্গিনায়'),
  OtherStaticModel(id: '3', description: 'খামার বাড়ি'),
  OtherStaticModel(id: '4', description: 'প্রযোজ্য নয়'),
];

List<OtherStaticModel> packagingTypeList = [
  OtherStaticModel(id: '1', description: 'ঝুড়ি'),
  OtherStaticModel(id: '2', description: 'বস্তা'),
  OtherStaticModel(id: '3', description: 'ট্রে'),
  OtherStaticModel(id: '4', description: 'কচকেট/কর্কশীট'),
  OtherStaticModel(id: '5', description: 'ডালা'),
  OtherStaticModel(id: '6', description: 'হাড়ি'),
  OtherStaticModel(id: '7', description: 'জাল'),
  OtherStaticModel(id: '8', description: 'নেট'),
  OtherStaticModel(id: '9', description: 'খাঁচা'),
  OtherStaticModel(id: '10', description: 'কাপড়'),
  OtherStaticModel(id: '11', description: 'ঝাঁকা'),
  OtherStaticModel(id: '12', description: 'রশি'),
  OtherStaticModel(id: '96', description: 'অন্যান্য (উল্লেখ করুন)'),
];

List<OtherStaticModel> transportTypeList = [
  OtherStaticModel(id: '1', description: 'খোলা/ঢাকনা ছাড়া যানবাহন (ট্রাক, মিনি ট্রাক, ট্রলি)'),
  OtherStaticModel(id: '2', description: 'শীতাতপ নিয়ন্ত্রিত সিস্টেম/ফ্রিজিং গাড়ী'),
  OtherStaticModel(id: '3', description: 'শীতাতপ নিয়ন্ত্রিত ব্যবস্থা/ফ্রিজিং ছাড়াই ঢাকনাযুক্ত গাড়ি'),
  OtherStaticModel(id: '4', description: 'অন্যান্য (রিক্সা, ভ্যান, পশু চালিত গাড়ি, নৌকা ইত্যাদি)'),
  OtherStaticModel(id: '5', description: 'জীবন্ত মাছ ড্রামে'),
  OtherStaticModel(id: '96', description: 'উপরিউক্ত ব্যবস্থা ছাড়া যদি থাকে তা (উল্লেখ করুন …)'),
];

List<OtherStaticModel> packageUnitList = [
  OtherStaticModel(id: '1', description: 'ঝুড়ি'),
  OtherStaticModel(id: '2', description: 'বস্তা'),
  OtherStaticModel(id: '3', description: 'ট্রে'),
  OtherStaticModel(id: '4', description: 'বাস্কেট'),
  OtherStaticModel(id: '5', description: 'ডালা'),
  OtherStaticModel(id: '6', description: 'হাড়ি'),
  OtherStaticModel(id: '7', description: 'জাল/নেট '),
  OtherStaticModel(id: '8', description: 'খাঁচা'),
  OtherStaticModel(id: '9', description: 'কাপড়'),
  OtherStaticModel(id: '10', description: 'ঝাঁকা'),
  OtherStaticModel(id: '96', description: 'অন্যান্য (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonList1 = [
  OtherStaticModel(id: '1', description: 'অসময়ে (ফসল অধিক/বেশি পাকা/কাঁচা অবস্থায়) কাটা'),
  OtherStaticModel(id: '2', description: 'অদক্ষ শ্রমিক/শ্রমিক সংকট'),
  OtherStaticModel(id: '3', description: 'যন্ত্রপাতির অভাব'),
  OtherStaticModel(id: '4', description: 'যন্ত্রপাতির ভুল ব্যবহার'),
  OtherStaticModel(id: '5', description: 'প্রাকৃতিক দুর্যোগ (ঝড়/বৃষ্টি/বন্যা)'),
  OtherStaticModel(id: '6', description: 'ঢিলা আঁটি/অতিরিক্ত শুকনো ফসল'),
  OtherStaticModel(id: '7', description: 'বহনের সময় আঁটি খুলে যাওয়া'),
  OtherStaticModel(id: '8', description: 'শ্রমিকের অসাবধানতা'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonList2 = [
  OtherStaticModel(id: '1', description: 'খারাপ রাস্তা'),
  OtherStaticModel(id: '2', description: 'অনুপযুক্ত বাহন'),
  OtherStaticModel(id: '3', description: 'ঝরে পড়া'),
  OtherStaticModel(id: '4', description: 'বৃষ্টিতে ভেজা'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonList3 = [
  OtherStaticModel(id: '1', description: 'অদক্ষ হাতে মাড়াই'),
  OtherStaticModel(id: '2', description: 'অতিরিক্ত চাপ'),
  OtherStaticModel(id: '3', description: 'খোলা জায়গায় মাড়াই'),
  OtherStaticModel(id: '4', description: 'অসমতল জমি'),
  OtherStaticModel(id: '5', description: 'বাতাসে দানা উড়ে যাওয়া'),
  OtherStaticModel(id: '6', description: 'মাটির সাথে মিশে যাওয়া, পাখি/পশুর আক্রমণ'),
  OtherStaticModel(id: '7', description: 'কীটপতঙ্গ/পোকার আক্রমণ'),
  OtherStaticModel(id: '8', description: 'মাড়াই শেষে খড়ের সাথে মিশে যাওয়া'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonList4 = [
  OtherStaticModel(id: '1', description: 'অতিরিক্ত বাতাস'),
  OtherStaticModel(id: '2', description: 'ভুল ঝাড়া পদ্ধতি'),
  OtherStaticModel(id: '3', description: 'যন্ত্রের অভাব'),
  OtherStaticModel(id: '4', description: 'ভালো দানা বাদ পড়া'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonList5 = [
  OtherStaticModel(id: '1', description: 'অপর্যাপ্ত রোদ'),
  OtherStaticModel(id: '2', description: 'অতিরিক্ত তাপ'),
  OtherStaticModel(id: '3', description: 'বৃষ্টিতে ভেজা'),
  OtherStaticModel(id: '4', description: 'পোকামাকড়/পাখির আক্রমণ'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonList6 = [
  OtherStaticModel(id: '1', description: 'ঝরে পড়া'),
  OtherStaticModel(id: '2', description: 'ত্রুটিপূর্ণ ওজন যন্ত্র'),
  OtherStaticModel(id: '3', description: 'বারবার স্থানান্তর'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonList7 = [
  OtherStaticModel(id: '1', description: 'নিম্নমানের বস্তা'),
  OtherStaticModel(id: '2', description: 'অতিরিক্ত চাপ'),
  OtherStaticModel(id: '3', description: 'ছেঁড়া প্যাকেট'),
  OtherStaticModel(id: '4', description: 'আর্দ্রতা'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonList8 = [
  OtherStaticModel(id: '1', description: 'অসাবধানভাবে ফেলা'),
  OtherStaticModel(id: '2', description: 'উচ্চতা থেকে ছোড়া'),
  OtherStaticModel(id: '3', description: 'বস্তা ছেঁড়া'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonList9 = [
  OtherStaticModel(id: '1', description: 'দীর্ঘ সময় পরিবহন'),
  OtherStaticModel(id: '2', description: 'খোলা গাড়ি'),
  OtherStaticModel(id: '3', description: 'ঝাঁকুনি'),
  OtherStaticModel(id: '4', description: 'বৃষ্টি'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonList10 = [
  OtherStaticModel(id: '1', description: 'পোকামাকড়/ইঁদুর'),
  OtherStaticModel(id: '2', description: 'আর্দ্রতা'),
  OtherStaticModel(id: '3', description: 'বায়ুচলাচলের অভাব'),
  OtherStaticModel(id: '4', description: 'দীর্ঘদিন সংরক্ষণ'),
  OtherStaticModel(id: '5', description: 'বিদ্যুৎ বিভ্রাট'),
  OtherStaticModel(id: '6', description: 'যন্ত্র বিকল'),
  OtherStaticModel(id: '7', description: 'অগ্নিকাণ্ড'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonList96 = [OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)')];

List<OtherStaticModel> lossReasonListPartTwo1 = [
  OtherStaticModel(id: '1', description: 'অনুপযুক্ত বাহন'),
  OtherStaticModel(id: '2', description: 'খোলা গাড়ি'),
  OtherStaticModel(id: '3', description: 'ঝাঁকুনি ও কম্পন'),
  OtherStaticModel(id: '4', description: 'দূরত্ব বেশি'),
  OtherStaticModel(id: '5', description: 'বৃষ্টি/আর্দ্রতা'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListPartTwo2 = [
  OtherStaticModel(id: '1', description: 'অতিরিক্ত বাতাসে দানা উড়ে যাওয়া'),
  OtherStaticModel(id: '2', description: 'ভুল পদ্ধতি পরিষ্কার করা'),
  OtherStaticModel(id: '3', description: 'যন্ত্রের অভাব'),
  OtherStaticModel(id: '4', description: 'তাড়াহুড়া'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListPartTwo3 = [
  OtherStaticModel(id: '1', description: 'ঝরে পড়া'),
  OtherStaticModel(id: '2', description: 'ত্রুটিপূর্ণ ওজন যন্ত্র'),
  OtherStaticModel(id: '3', description: 'বারবার স্থানান্তর'),
  OtherStaticModel(id: '4', description: 'খোলা পাত্রে ওজন'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListPartTwo4 = [
  OtherStaticModel(id: '1', description: 'অতিরিক্ত হাতবদল'),
  OtherStaticModel(id: '2', description: 'স্তূপ করে রাখা'),
  OtherStaticModel(id: '3', description: 'চাপ পড়ে ক্ষতি'),
  OtherStaticModel(id: '4', description: 'প্যাকেট ছেঁড়া'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListPartTwo5 = [
  OtherStaticModel(id: '1', description: 'অসাবধানভাবে ফেলা'),
  OtherStaticModel(id: '2', description: 'উচ্চতা থেকে নামানো'),
  OtherStaticModel(id: '3', description: 'শ্রমিকের অদক্ষতা'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListPartTwo6 = [
  OtherStaticModel(id: '1', description: 'নিম্নমানের বস্তা/কার্টন'),
  OtherStaticModel(id: '2', description: 'অতিরিক্ত চাপ'),
  OtherStaticModel(id: '3', description: 'ছেঁড়া প্যাকেট'),
  OtherStaticModel(id: '4', description: 'আর্দ্রতা'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListPartTwo7 = [
  OtherStaticModel(id: '1', description: 'খোলা যানবাহন'),
  OtherStaticModel(id: '2', description: 'দীর্ঘ সময় যাত্রা'),
  OtherStaticModel(id: '3', description: 'ঝাঁকুনি'),
  OtherStaticModel(id: '4', description: 'আবহাওয়ার প্রভাব'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListPartTwo8 = [
  OtherStaticModel(id: '1', description: 'পোকামাকড়/ইঁদুর'),
  OtherStaticModel(id: '2', description: 'আর্দ্রতা'),
  OtherStaticModel(id: '3', description: 'বায়ুচলাচলের অভাব'),
  OtherStaticModel(id: '4', description: 'দীর্ঘদিন সংরক্ষণ'),
  OtherStaticModel(id: '5', description: 'বিদ্যুৎ বিভ্রাট'),
  OtherStaticModel(id: '6', description: 'যন্ত্র বিকল'),
  OtherStaticModel(id: '7', description: 'অগ্নিকাণ্ড'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListPartThree1 = [
  OtherStaticModel(id: '1', description: 'অনুপযুক্ত বাহন'),
  OtherStaticModel(id: '2', description: 'খোলা গাড়ি'),
  OtherStaticModel(id: '3', description: 'ঝাঁকুনি'),
  OtherStaticModel(id: '4', description: 'দীর্ঘ সময় পরিবহন'),
  OtherStaticModel(id: '5', description: 'বৃষ্টি/আর্দ্রতা'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListPartThree2 = [
  OtherStaticModel(id: '1', description: 'প্যাকেজ ছেঁড়া'),
  OtherStaticModel(id: '2', description: 'খারাপ রাস্তা'),
  OtherStaticModel(id: '3', description: 'অতিরিক্ত বোঝা'),
  OtherStaticModel(id: '4', description: 'বারবার হাতবদল'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListPartThree3 = [
  OtherStaticModel(id: '1', description: 'নিম্নমানের বস্তা'),
  OtherStaticModel(id: '2', description: 'অতিরিক্ত চাপ'),
  OtherStaticModel(id: '3', description: 'ছেঁড়া প্যাকেট'),
  OtherStaticModel(id: '4', description: 'আর্দ্রতা'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListPartThree4 = [
  OtherStaticModel(id: '1', description: 'অসাবধানভাবে ফেলা'),
  OtherStaticModel(id: '2', description: 'উচ্চতা থেকে নামানো'),
  OtherStaticModel(id: '3', description: 'শ্রমিকের অদক্ষতা'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListPartThree5 = [
  OtherStaticModel(id: '1', description: 'পোকামাকড়/ইঁদুর'),
  OtherStaticModel(id: '2', description: 'আর্দ্রতা'),
  OtherStaticModel(id: '3', description: 'বায়ুচলাচলের অভাব'),
  OtherStaticModel(id: '4', description: 'দীর্ঘদিন সংরক্ষণ'),
  OtherStaticModel(id: '5', description: 'বিদ্যুৎ বিভ্রাট'),
  OtherStaticModel(id: '6', description: 'যন্ত্র বিকল'),
  OtherStaticModel(id: '7', description: 'অগ্নিকাণ্ড'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListPartFive1 = [
  OtherStaticModel(id: '1', description: 'নিম্নমানের কাঁচামাল'),
  OtherStaticModel(id: '2', description: 'অতিরিক্ত পাকা/কাঁচা পণ্য'),
  OtherStaticModel(id: '3', description: 'পরিবহনজনিত আঘাত'),
  OtherStaticModel(id: '4', description: 'দেরিতে সরবরাহ'),
  OtherStaticModel(id: '5', description: 'আর্দ্রতা বা তাপমাত্রা নিয়ন্ত্রণের অভাব'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListPartFive2 = [
  OtherStaticModel(id: '1', description: 'ভুল হ্যান্ডলিং'),
  OtherStaticModel(id: '2', description: 'ত্রুটিপূর্ণ ওজন যন্ত্র'),
  OtherStaticModel(id: '3', description: 'খোলা পাত্রে ওজন'),
  OtherStaticModel(id: '4', description: 'উচ্চতা থেকে ফেলা'),
  OtherStaticModel(id: '5', description: 'যান্ত্রিক আঘাত'),
  OtherStaticModel(id: '6', description: 'শ্রমিকের অদক্ষতা'),
  OtherStaticModel(id: '96', description: 'অন্যান্য কারণ (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListPartFive3 = [
  OtherStaticModel(id: '1', description: 'অতিরিক্ত পানি ব্যবহার'),
  OtherStaticModel(id: '2', description: 'দীর্ঘ সময় ভিজিয়ে রাখা'),
  OtherStaticModel(id: '3', description: 'অপরিষ্কার পানি'),
  OtherStaticModel(id: '4', description: 'পচন বা ছত্রাক সংক্রমণ'),
  OtherStaticModel(id: '96', description: 'অন্যান্য কারণ (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListPartFive4 = [
  OtherStaticModel(id: '1', description: 'অতিরিক্ত কাটা'),
  OtherStaticModel(id: '2', description: 'ভুল গ্রেডিং মানদণ্ড'),
  OtherStaticModel(id: '3', description: 'শ্রমিকের অসাবধানতা'),
  OtherStaticModel(id: '4', description: 'ধারালো যন্ত্রের অভাব'),
  OtherStaticModel(id: '96', description: 'অন্যান্য কারণ (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListPartFive5 = [
  OtherStaticModel(id: '1', description: 'মেশিনের ত্রুটি'),
  OtherStaticModel(id: '2', description: 'ক্যালিব্রেশন সমস্যা'),
  OtherStaticModel(id: '3', description: 'বিদ্যুৎ বিভ্রাট'),
  OtherStaticModel(id: '4', description: 'অতিরিক্ত চাপ বা তাপ'),
  OtherStaticModel(id: '96', description: 'অন্যান্য কারণ (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListPartFive6 = [
  OtherStaticModel(id: '1', description: 'অতিরিক্ত বা অপর্যাপ্ত তাপ'),
  OtherStaticModel(id: '2', description: 'সময় নিয়ন্ত্রণের অভাব'),
  OtherStaticModel(id: '3', description: 'অসম শুকানো'),
  OtherStaticModel(id: '96', description: 'অন্যান্য কারণ (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListPartFive7 = [
  OtherStaticModel(id: '1', description: 'ধীরগতির কুলিং'),
  OtherStaticModel(id: '2', description: 'পর্যাপ্ত কোল্ড স্টোরেজের অভাব'),
  OtherStaticModel(id: '3', description: 'তাপমাত্রা ওঠানামা'),
  OtherStaticModel(id: '96', description: 'অন্যান্য কারণ (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListPartFive8 = [
  OtherStaticModel(id: '1', description: 'নিম্নমানের প্যাকেট'),
  OtherStaticModel(id: '2', description: 'ভুল সিলিং'),
  OtherStaticModel(id: '3', description: 'বাতাস ঢুকে যাওয়া'),
  OtherStaticModel(id: '4', description: 'ওজন ভুল'),
  OtherStaticModel(id: '96', description: 'অন্যান্য কারণ (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListPartFive9 = [
  OtherStaticModel(id: '1', description: 'প্যাকেট ছেঁড়া'),
  OtherStaticModel(id: '2', description: 'ভুল তথ্য'),
  OtherStaticModel(id: '3', description: 'বারবার হ্যান্ডলিং'),
  OtherStaticModel(id: '96', description: 'অন্যান্য কারণ (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListPartFive10 = [
  OtherStaticModel(id: '1', description: 'সঠিক তাপমাত্রা/আর্দ্রতা না থাকা'),
  OtherStaticModel(id: '2', description: 'কীটপতঙ্গ/ইঁদুর আক্রমণ'),
  OtherStaticModel(id: '96', description: 'অন্যান্য কারণ (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListPartFive11 = [
  OtherStaticModel(id: '1', description: 'পোকামাকড়/ইঁদুর'),
  OtherStaticModel(id: '2', description: 'আর্দ্রতা'),
  OtherStaticModel(id: '3', description: 'বায়ুচলাচলের অভাব'),
  OtherStaticModel(id: '4', description: 'দীর্ঘদিন সংরক্ষণ'),
  OtherStaticModel(id: '5', description: 'বিদ্যুৎ বিভ্রাট'),
  OtherStaticModel(id: '6', description: 'যন্ত্র বিকল'),
  OtherStaticModel(id: '7', description: 'অগ্নিকাণ্ড'),
  OtherStaticModel(id: '8', description: 'গুদামের অপরিচ্ছন্নতা'),
  OtherStaticModel(id: '9', description: 'দীর্ঘদিন সংরক্ষণ'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListPartFive12 = [
  OtherStaticModel(id: '1', description: 'অনুপযুক্ত যানবাহন'),
  OtherStaticModel(id: '2', description: 'প্যাকেট ক্ষতি'),
  OtherStaticModel(id: '3', description: 'অতিরিক্ত লোড'),
  OtherStaticModel(id: '96', description: 'অন্যান্য কারণ (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListPartFive13 = [
  OtherStaticModel(id: '1', description: 'চাহিদা কম'),
  OtherStaticModel(id: '2', description: 'বাজারমূল্য কমে যাওয়া'),
  OtherStaticModel(id: '3', description: 'বিক্রি না হওয়া'),
  OtherStaticModel(id: '96', description: 'অন্যান্য কারণ (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListPartFive14 = [
  OtherStaticModel(id: '1', description: 'সঠিক FIFO অনুসরণ না করা'),
  OtherStaticModel(id: '2', description: 'দুর্বল স্টক ব্যবস্থাপনা'),
  OtherStaticModel(id: '96', description: 'অন্যান্য কারণ (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListPartFive15 = [
  OtherStaticModel(id: '1', description: 'তাপদাহ'),
  OtherStaticModel(id: '2', description: 'অতিবৃষ্টি'),
  OtherStaticModel(id: '3', description: 'বিদ্যুৎ সংকট'),
  OtherStaticModel(id: '4', description: 'ধর্মঘট/লজিস্টিক সমস্যা'),
  OtherStaticModel(id: '96', description: 'অন্যান্য কারণ (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListPartFour1 = [
  OtherStaticModel(id: '1', description: 'অনুপযুক্ত বাহন'),
  OtherStaticModel(id: '2', description: 'খোলা গাড়ি'),
  OtherStaticModel(id: '3', description: 'ঝাঁকুনি'),
  OtherStaticModel(id: '4', description: 'দীর্ঘ সময় পরিবহন'),
  OtherStaticModel(id: '5', description: 'বৃষ্টি/আর্দ্রতা'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListPartFour2 = [
  OtherStaticModel(id: '1', description: 'অতিরিক্ত বাতাসে দানা উড়ে যাওয়া'),
  OtherStaticModel(id: '2', description: 'যন্ত্রের ত্রুটি'),
  OtherStaticModel(id: '3', description: 'অদক্ষ অপারেটর'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListPartFour3 = [
  OtherStaticModel(id: '1', description: 'ঝরে পড়া'),
  OtherStaticModel(id: '2', description: 'ত্রুটিপূর্ণ ওজন যন্ত্র'),
  OtherStaticModel(id: '3', description: 'বারবার স্থানান্তর'),
  OtherStaticModel(id: '4', description: 'খোলা পাত্রে ওজন'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListPartFour4 = [
  OtherStaticModel(id: '1', description: 'নিম্নমানের বস্তা'),
  OtherStaticModel(id: '2', description: 'অতিরিক্ত চাপ'),
  OtherStaticModel(id: '3', description: 'ছেঁড়া প্যাকেট'),
  OtherStaticModel(id: '4', description: 'আর্দ্রতা প্রবেশ '),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListPartFour5 = [
  OtherStaticModel(id: '1', description: 'পোকামাকড়/ইঁদুর'),
  OtherStaticModel(id: '2', description: 'আর্দ্রতা'),
  OtherStaticModel(id: '3', description: 'বায়ুচলাচলের অভাব'),
  OtherStaticModel(id: '4', description: 'দীর্ঘদিন সংরক্ষণ'),
  OtherStaticModel(id: '5', description: 'বিদ্যুৎ বিভ্রাট'),
  OtherStaticModel(id: '6', description: 'যন্ত্র বিকল'),
  OtherStaticModel(id: '7', description: 'অগ্নিকাণ্ড'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListPartFour6 = [
  OtherStaticModel(id: '1', description: 'যন্ত্রের ভুল সেটিং'),
  OtherStaticModel(id: '2', description: 'অতিরিক্ত চাপ'),
  OtherStaticModel(id: '3', description: 'পুরনো যন্ত্রপাতি'),
  OtherStaticModel(id: '4', description: 'অদক্ষ অপারেটর '),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListPartFour7 = [
  OtherStaticModel(id: '1', description: 'অতিরিক্ত পলিশিংয়ে দানা ভাঙ্গা'),
  OtherStaticModel(id: '2', description: 'যন্ত্রের গতি বেশি'),
  OtherStaticModel(id: '3', description: 'ঘর্ষণ'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListPartFour8 = [
  OtherStaticModel(id: '1', description: 'ভুল গ্রেডিং মানদণ্ড'),
  OtherStaticModel(id: '2', description: 'অভিজ্ঞতার অভাব'),
  OtherStaticModel(id: '3', description: 'ভালো দানা বাদ পড়া'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListPartFour9 = [
  OtherStaticModel(id: '1', description: 'অসাবধানভাবে ফেলা '),
  OtherStaticModel(id: '2', description: 'উচ্চতা থেকে নামানো'),
  OtherStaticModel(id: '3', description: 'শ্রমিকের অদক্ষতা'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListPartFour10 = [
  OtherStaticModel(id: '1', description: 'প্যাকেজ ছেঁড়া'),
  OtherStaticModel(id: '2', description: 'খারাপ রাস্তা'),
  OtherStaticModel(id: '3', description: 'অতিরিক্ত বোঝা'),
  OtherStaticModel(id: '4', description: 'বারবার হাতবদল'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListPartFour11 = [
  OtherStaticModel(id: '1', description: 'পোকামাকড়/ইঁদুর'),
  OtherStaticModel(id: '2', description: 'আর্দ্রতা'),
  OtherStaticModel(id: '3', description: 'বায়ুচলাচলের অভাব'),
  OtherStaticModel(id: '4', description: 'দীর্ঘদিন সংরক্ষণ'),
  OtherStaticModel(id: '5', description: 'বিদ্যুৎ বিভ্রাট'),
  OtherStaticModel(id: '6', description: 'যন্ত্র বিকল'),
  OtherStaticModel(id: '7', description: 'অগ্নিকাণ্ড'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> storageLocationList = [
  OtherStaticModel(id: '1', description: 'বাড়ির আঙ্গিনায়'),
  OtherStaticModel(id: '2', description: 'খামার বাড়ি'),
  OtherStaticModel(id: '3', description: 'নির্দিষ্ট সংরক্ষণাগার'),
  OtherStaticModel(id: '4', description: 'প্রযোজ্য নয়'),
];

List<OtherStaticModel> cultivationLocationList1 = [
  OtherStaticModel(id: '1', description: 'ক্ষেতে'),
  OtherStaticModel(id: '2', description: 'বাড়ির আঙ্গিনায়'),
  OtherStaticModel(id: '3', description: 'খামার'),
  OtherStaticModel(id: '4', description: 'প্রতিষ্ঠানের নির্দিষ্ট জায়গায়'),
  OtherStaticModel(id: '5', description: 'প্রযোজ্য নয়'),
];

List<OtherStaticModel> lossReasonListMangoPartOneFirst = [
  OtherStaticModel(id: '1', description: 'অসময়ে সংগ্রহ'),
  OtherStaticModel(id: '2', description: 'অপরিপক্ব বা অতিপক্ব আম সংগ্রহ'),
  OtherStaticModel(id: '3', description: 'অদক্ষ শ্রমিক'),
  OtherStaticModel(id: '4', description: 'যন্ত্রপাতির ভুল ব্যবহার'),
  OtherStaticModel(id: '5', description: 'ঝড়–বৃষ্টি'),
  OtherStaticModel(id: '6', description: 'সংগ্রহের সময় আম মাটিতে পড়ে ফেটে যাওয়া'),
  OtherStaticModel(id: '7', description: 'একসাথে অনেক আম বহন করা'),
  OtherStaticModel(id: '8', description: 'শ্রমিকের তাড়াহুড়া ও অসতর্কতা'),
  OtherStaticModel(id: '9', description: 'কাটিং যন্ত্র/নেট ব্যবহার না করা'),
  OtherStaticModel(id: '96', description: 'অন্যান্য কারণ উল্লেখ করুন'),
];

List<OtherStaticModel> lossReasonListMangoPartOneSecond = [
  OtherStaticModel(id: '1', description: 'ভুল পদ্ধতিতে পরিষ্কার করা'),
  OtherStaticModel(id: '2', description: 'পানির ভুল প্রয়োগ'),
  OtherStaticModel(id: '3', description: 'আমের আঠা ঠিক মতো পরিষ্কার না করা'),
  OtherStaticModel(id: '4', description: 'আমের বোটা (ডাটা) কেটে দেবার সময় অসর্তকতা'),
  OtherStaticModel(id: '96', description: 'অন্যান্য কারণ উল্লেখ করুন'),
];

List<OtherStaticModel> lossReasonListMangoPartOneThird = [
  OtherStaticModel(id: '1', description: 'আঘাতপ্রাপ্ত আম আলাদা করা'),
  OtherStaticModel(id: '2', description: 'দাগ/পোকা আক্রান্ত আম বাতিল'),
  OtherStaticModel(id: '3', description: 'গ্রেডিং/বাছাই পর্বের ক্ষতি'),
  OtherStaticModel(id: '4', description: 'অভিজ্ঞতার অভাব'),
  OtherStaticModel(id: '5', description: 'তাড়াহুড়া'),
  OtherStaticModel(id: '96', description: 'অন্যান্য কারণ উল্লেখ করুন'),
];

List<OtherStaticModel> lossReasonListMangoPartOneFourth = [
  OtherStaticModel(id: '1', description: 'আঘাতজনিত'),
  OtherStaticModel(id: '2', description: 'ত্রুটিপূর্ণ ওজন যন্ত্র'),
  OtherStaticModel(id: '3', description: 'বারবার স্থানান্তর'),
  OtherStaticModel(id: '96', description: 'অন্যান্য কারণ উল্লেখ করুন'),
];

List<OtherStaticModel> lossReasonListMangoPartOneFifth = [
  OtherStaticModel(id: '1', description: 'ছায়াযুক্ত জায়গার অভাব'),
  OtherStaticModel(id: '2', description: 'অতিরিক্ত তাপ ও রোদে রাখা'),
  OtherStaticModel(id: '3', description: 'বাতাস চলাচল না থাকা'),
  OtherStaticModel(id: '4', description: 'পোকামাকড়/ইঁদুর জনিত ক্ষতি'),
  OtherStaticModel(id: '96', description: 'অন্যান্য কারণ উল্লেখ করুন'),
];

List<OtherStaticModel> lossReasonListMangoPartOneSixth = [
  OtherStaticModel(id: '1', description: 'অতিরিক্ত চাপ দিয়ে ঝুড়ি/বস্তা ভরা'),
  OtherStaticModel(id: '2', description: 'অনুপযুক্ত প্যাকিং উপকরণ ব্যবহার'),
  OtherStaticModel(id: '3', description: 'প্যাকিংয়ের সময় অসাবধানতা'),
  OtherStaticModel(id: '4', description: 'নিম্নমানের বস্তা'),
  OtherStaticModel(id: '96', description: 'অন্যান্য কারণ উল্লেখ করুন'),
];

List<OtherStaticModel> lossReasonListMangoPartOneSeventh = [
  OtherStaticModel(id: '1', description: 'যানবাহন আসতে বিলম্ব'),
  OtherStaticModel(id: '2', description: 'দীর্ঘ সময় খোলা জায়গায় রাখা'),
  OtherStaticModel(id: '3', description: 'বৃষ্টি বা ধুলাবালির সংস্পর্শ'),
  OtherStaticModel(id: '4', description: 'দীর্ঘ সময় পরিবহন করা'),
  OtherStaticModel(id: '5', description: 'খোলা/ক্রটিপূর্ণ গাড়ি'),
  OtherStaticModel(id: '6', description: 'ঝাঁকুনি'),
  OtherStaticModel(id: '96', description: 'অন্যান্য কারণ উল্লেখ করুন'),
];

List<OtherStaticModel> lossReasonListMangoPartOneEighth = [
  OtherStaticModel(id: '1', description: 'অসাবধানভাবে ফেলা'),
  OtherStaticModel(id: '2', description: 'উচ্চতা থেকে ফেলে দেয়া'),
  OtherStaticModel(id: '96', description: 'অন্যান্য কারণ উল্লেখ করুন'),
];

List<OtherStaticModel> lossReasonListMangoPartOneNinth = [
  OtherStaticModel(id: '1', description: 'বিদ্যুৎ বিভ্রাট'),
  OtherStaticModel(id: '2', description: 'অগ্নিকাণ্ড'),
  OtherStaticModel(id: '3', description: 'পচে যাওয়া'),
  OtherStaticModel(id: '4', description: 'পোকামাকড় ও ইঁদুর'),
  OtherStaticModel(id: '5', description: 'আর্দ্রতা'),
  OtherStaticModel(id: '6', description: 'বাতাস চলাচল না থাকা'),
  OtherStaticModel(id: '7', description: 'গুদামের অপরিচ্ছন্নতা'),
  OtherStaticModel(id: '8', description: 'অতিরিক্ত রাসায়নিক/কেমিক্যাল ব্যবহার'),
  OtherStaticModel(id: '9', description: 'অধিক মাত্রায় কার্বাইডের ব্যবহার'),
  OtherStaticModel(id: '10', description: 'অতিমাত্রায় ইথিলিনের প্রয়োগ'),
  OtherStaticModel(id: '11', description: 'প্রাকৃতিক দুর্যোগ'),
  OtherStaticModel(id: '12', description: 'চুরি'),
  OtherStaticModel(id: '13', description: 'চাহিদা/মূল্য হ্রাসের কারণের ফসল বিনষ্টকরণজনিত ক্ষতি (কারণজনিত ক্ষতি)'),
  OtherStaticModel(id: '14', description: 'সংরক্ষণ সুবিধার অভাব'),
  OtherStaticModel(id: '96', description: 'অন্যান্য কারণ উল্লেখ করুন'),
];

List<OtherStaticModel> lossReasonListMangoPartOneTenth = [
  OtherStaticModel(id: '1', description: 'বাজারে চাহিদা কম'),
  OtherStaticModel(id: '2', description: 'দরপতন বা মূল্য নিয়ে দরকষাকষি'),
  OtherStaticModel(id: '3', description: 'ক্রেতা আসতে দেরি'),
  OtherStaticModel(id: '4', description: 'অতিরিক্ত পেকে যাওয়া'),
  OtherStaticModel(id: '5', description: 'পচন ও নরম হয়ে যাওয়া'),
  OtherStaticModel(id: '6', description: 'সংরক্ষণের সুযোগ না থাকা'),
  OtherStaticModel(id: '96', description: 'অন্যান্য কারণ উল্লেখ করুন'),
];

List<OtherStaticModel> lossReasonListMangoPartOneEleventh = [OtherStaticModel(id: '96', description: 'অন্যান্য কারণ উল্লেখ করুন')];

List<OtherStaticModel> lossReasonListMangoPartTwoFirst = [
  OtherStaticModel(id: '1', description: 'অনুপযুক্ত বাহন'),
  OtherStaticModel(id: '2', description: 'খোলা গাড়ি'),
  OtherStaticModel(id: '3', description: 'ঝাঁকুনি ও কম্পন'),
  OtherStaticModel(id: '4', description: 'দূরত্ব বেশি'),
  OtherStaticModel(id: '5', description: 'বৃষ্টি/আর্দ্রতা'),
  OtherStaticModel(id: '6', description: 'দীর্ঘ সময় পরিবহন'),
  OtherStaticModel(id: '7', description: 'রাস্তাঘাট খারাপ'),
  OtherStaticModel(id: '96', description: 'অন্যান্য কারণ উল্লেখ করুন'),
];

List<OtherStaticModel> lossReasonListMangoPartTwoSecond = [
  OtherStaticModel(id: '1', description: 'ত্রুটিপূর্ণ ওজন যন্ত্র'),
  OtherStaticModel(id: '2', description: 'বারবার স্থানান্তর'),
  OtherStaticModel(id: '3', description: 'খোলা পাত্রে ওজন'),
  OtherStaticModel(id: '4', description: 'আঘাতজনিত'),
  OtherStaticModel(id: '96', description: 'অন্যান্য কারণ উল্লেখ করুন'),
];

List<OtherStaticModel> lossReasonListMangoPartTwoThird = [
  OtherStaticModel(id: '1', description: 'অসাবধানভাবে নামানো ও সাজানো'),
  OtherStaticModel(id: '2', description: 'ছুঁড়ে ফেলা বা টেনে নেওয়া'),
  OtherStaticModel(id: '3', description: 'ভিড় ও তাড়াহুড়ার চাপ'),
  OtherStaticModel(id: '4', description: 'উচ্চতা থেকে নামানো'),
  OtherStaticModel(id: '5', description: 'শ্রমিকের অদক্ষতা'),
  OtherStaticModel(id: '6', description: 'নিম্নমানের বস্তা/ঝুড়ি'),
  OtherStaticModel(id: '96', description: 'অন্যান্য কারণ উল্লেখ করুন'),
];

List<OtherStaticModel> lossReasonListMangoPartTwoFourth = [
  OtherStaticModel(id: '1', description: 'ভুল গ্রেডিং'),
  OtherStaticModel(id: '2', description: 'মান নির্ধারণে অস্পষ্টতা'),
  OtherStaticModel(id: '3', description: 'অভিজ্ঞতার অভাব'),
  OtherStaticModel(id: '4', description: 'ভালো পণ্য বাদ পড়া'),
  OtherStaticModel(id: '5', description: 'আকার/রঙে ভিন্নতার কারণে বাতিল'),
  OtherStaticModel(id: '6', description: 'দাগযুক্ত/আঘাতপ্রাপ্ত আম বাদ'),
  OtherStaticModel(id: '96', description: 'অন্যান্য কারণ উল্লেখ করুন'),
];

List<OtherStaticModel> lossReasonListMangoPartTwoFifth = [
  OtherStaticModel(id: '1', description: 'সরাসরি রোদ ও তাপের প্রভাব'),
  OtherStaticModel(id: '2', description: 'ধুলাবালি ও দূষণ'),
  OtherStaticModel(id: '3', description: 'বাতাস চলাচল না থাকা'),
  OtherStaticModel(id: '4', description: 'পাখি/পোকামাকড়ের আক্রমণ'),
  OtherStaticModel(id: '5', description: 'অতিরিক্ত তাপ ও রোদে রাখা'),
  OtherStaticModel(id: '6', description: 'পোকামাকড়/ইঁদুর'),
  OtherStaticModel(id: '96', description: 'অন্যান্য কারণ উল্লেখ করুন'),
];

List<OtherStaticModel> lossReasonListMangoPartTwoSixth = [
  OtherStaticModel(id: '1', description: 'নিম্নমানের কার্টন/ক্যারেট/ঝুড়ি'),
  OtherStaticModel(id: '2', description: 'অতিরিক্ত চাপ'),
  OtherStaticModel(id: '3', description: 'ছেঁড়া প্যাকেট'),
  OtherStaticModel(id: '4', description: 'আর্দ্রতা'),
  OtherStaticModel(id: '5', description: 'অভিজ্ঞতার অভাব'),
  OtherStaticModel(id: '96', description: 'অন্যান্য কারণ উল্লেখ করুন'),
];

List<OtherStaticModel> lossReasonListMangoPartTwoSeventh = [
  OtherStaticModel(id: '1', description: 'খোলা যানবাহন'),
  OtherStaticModel(id: '2', description: 'দীর্ঘ সময় যাত্রা'),
  OtherStaticModel(id: '3', description: 'ঝাঁকুনি'),
  OtherStaticModel(id: '4', description: 'আবহাওয়ার প্রভাব'),
  OtherStaticModel(id: '5', description: 'বারবার ওঠানামায় আঘাত'),
  OtherStaticModel(id: '6', description: 'ঝুড়ি/ক্যারেট ঘর্ষণ'),
  OtherStaticModel(id: '7', description: 'পুনঃপ্যাকিংয়ে অসতর্কতা'),
  OtherStaticModel(id: '96', description: 'অন্যান্য কারণ উল্লেখ করুন'),
];

List<OtherStaticModel> lossReasonListMangoPartTwoEighth = [
  OtherStaticModel(id: '1', description: 'বাজারে চাহিদা কম'),
  OtherStaticModel(id: '2', description: 'দরপতন বা মূল্য নিয়ে দরকষাকষি'),
  OtherStaticModel(id: '3', description: 'ক্রেতা আসতে দেরি'),
  OtherStaticModel(id: '4', description: 'অতিরিক্ত পেকে যাওয়া'),
  OtherStaticModel(id: '5', description: 'পচন ও নরম হয়ে যাওয়া'),
  OtherStaticModel(id: '6', description: 'সংরক্ষণের সুযোগ না থাকা'),
  OtherStaticModel(id: '96', description: 'অন্যান্য কারণ উল্লেখ করুন'),
];

List<OtherStaticModel> lossReasonListMangoPartTwoNinth = [
  OtherStaticModel(id: '1', description: 'পোকামাকড় ও ইঁদুর'),
  OtherStaticModel(id: '2', description: 'আর্দ্রতা'),
  OtherStaticModel(id: '3', description: 'বাতাস চলাচল না থাকা'),
  OtherStaticModel(id: '4', description: 'গুদামের অপরিচ্ছন্নতা'),
  OtherStaticModel(id: '5', description: 'বিদ্যুৎ সমস্যায় নষ্ট হওয়া'),
  OtherStaticModel(id: '96', description: 'অন্যান্য কারণ উল্লেখ করুন'),
];

List<OtherStaticModel> lossReasonListMangoPartTwoTenth = [OtherStaticModel(id: '96', description: 'অন্যান্য কারণ উল্লেখ করুন')];

List<OtherStaticModel> lossReasonListMangoPartThreeFirst = [
  OtherStaticModel(id: '1', description: 'অনুপযুক্ত বাহন'),
  OtherStaticModel(id: '2', description: 'খোলা গাড়ি'),
  OtherStaticModel(id: '3', description: 'ঝাঁকুনি ও কম্পন'),
  OtherStaticModel(id: '4', description: 'দূরত্ব বেশি'),
  OtherStaticModel(id: '5', description: 'বৃষ্টি/আর্দ্রতা'),
  OtherStaticModel(id: '6', description: 'দীর্ঘ সময় পরিবহন'),
  OtherStaticModel(id: '7', description: 'রাস্তাঘাট খারাপ'),
  OtherStaticModel(id: '96', description: 'অন্যান্য কারণ উল্লেখ করুন'),
];

List<OtherStaticModel> lossReasonListMangoPartThreeSecond = [
  OtherStaticModel(id: '1', description: 'ঝুড়ি/ক্রেট ছুঁড়ে ফেলা'),
  OtherStaticModel(id: '2', description: 'অসাবধানভাবে নামানোর সময় আঘাত'),
  OtherStaticModel(id: '3', description: 'প্রশিক্ষিত শ্রমিকের অভাব'),
  OtherStaticModel(id: '4', description: 'উচ্চতা থেকে নামানো'),
  OtherStaticModel(id: '5', description: 'অতিরিক্ত ওজনের চাপ'),
  OtherStaticModel(id: '96', description: 'অন্যান্য কারণ উল্লেখ করুন'),
];

List<OtherStaticModel> lossReasonListMangoPartThreeThird = [
  OtherStaticModel(id: '1', description: 'ভুল গ্রেডিং মানদণ্ড'),
  OtherStaticModel(id: '2', description: 'অভিজ্ঞতার অভাব'),
  OtherStaticModel(id: '3', description: 'ভালো পণ্য বাদ পড়া'),
  OtherStaticModel(id: '4', description: 'আকার/রঙে ভিন্নতার কারণে বাতিল'),
  OtherStaticModel(id: '5', description: 'দাগযুক্ত/আঘাতপ্রাপ্ত আম বাদ'),
  OtherStaticModel(id: '96', description: 'অন্যান্য কারণ উল্লেখ করুন'),
];

List<OtherStaticModel> lossReasonListMangoPartThreeFourth = [
  OtherStaticModel(id: '1', description: 'পোকামাকড়/ইঁদুর'),
  OtherStaticModel(id: '2', description: 'অনিয়ন্ত্রিত তাপমাত্রা'),
  OtherStaticModel(id: '3', description: 'বিদ্যুৎ বিভ্রাট'),
  OtherStaticModel(id: '4', description: 'যন্ত্র বিকল'),
  OtherStaticModel(id: '5', description: 'দীর্ঘদিন সংরক্ষণ'),
  OtherStaticModel(id: '6', description: 'বায়ু/ আর্দ্রতার কারণে ক্ষতি'),
  OtherStaticModel(id: '7', description: 'স্তূপে বাতাস চলাচল বাধাগ্রস্ত'),
  OtherStaticModel(id: '8', description: 'ইথিলিন গ্যাস জমা'),
  OtherStaticModel(id: '9', description: 'সংরক্ষণকাল কমে যাওয়া'),
  OtherStaticModel(id: '10', description: 'নরম হয়ে যাওয়া ও পচন'),
  OtherStaticModel(id: '96', description: 'অন্যান্য কারণ উল্লেখ করুন'),
];

List<OtherStaticModel> lossReasonListMangoPartThreeFifth = [OtherStaticModel(id: '96', description: 'অন্যান্য কারণ উল্লেখ করুন')];

List<OtherStaticModel> lossReasonListMangoPartFourFirst = [
  OtherStaticModel(id: '1', description: 'নিম্নমানের কাঁচামাল'),
  OtherStaticModel(id: '2', description: 'অতিরিক্ত পাকা বা কাঁচা আম গ্রহণ'),
  OtherStaticModel(id: '3', description: 'আঘাতপ্রাপ্ত বা পচন ধরা আম বাছাই না করা'),
  OtherStaticModel(id: '4', description: 'পরিবহনজনিত চাপ ও তাপের কারণে গুণগত অবনতি'),
  OtherStaticModel(id: '5', description: 'দেরিতে সরবরাহ'),
  OtherStaticModel(id: '6', description: 'দীর্ঘ সময় খোলা অবস্থায় রাখায় ফারমেন্টেশন শুরু'),
  OtherStaticModel(id: '96', description: 'অন্যান্য কারণ উল্লেখ করুন'),
];

List<OtherStaticModel> lossReasonListMangoPartFourSecond = [
  OtherStaticModel(id: '1', description: 'ত্রুটিপূর্ণ ওজন যন্ত্র'),
  OtherStaticModel(id: '2', description: 'বারবার স্থানান্তর'),
  OtherStaticModel(id: '3', description: 'খোলা পাত্রে ওজন'),
  OtherStaticModel(id: '96', description: 'অন্যান্য কারণ উল্লেখ করুন'),
];

List<OtherStaticModel> lossReasonListMangoPartFourThird = [
  OtherStaticModel(id: '1', description: 'অতিরিক্ত পানি ব্যবহার'),
  OtherStaticModel(id: '2', description: 'দীর্ঘ সময় ভিজিয়ে রাখা'),
  OtherStaticModel(id: '3', description: 'অপরিষ্কার বা দূষিত পানি ব্যবহার'),
  OtherStaticModel(id: '4', description: 'অতিরিক্ত ঘষামাজায় খোসা ও শাঁস ক্ষতিগ্রস্ত হওয়া'),
  OtherStaticModel(id: '5', description: 'পচন বা ছত্রাক সংক্রমণ'),
  OtherStaticModel(id: '6', description: 'পর্যাপ্ত শ্রমিক বা যন্ত্রের অভাব'),
  OtherStaticModel(id: '96', description: 'অন্যান্য কারণ উল্লেখ করুন'),
];

List<OtherStaticModel> lossReasonListMangoPartFourFourth = [
  OtherStaticModel(id: '1', description: 'ভুল গ্রেডিং মানদণ্ড'),
  OtherStaticModel(id: '2', description: 'অভিজ্ঞতার অভাব'),
  OtherStaticModel(id: '3', description: 'ভালো পণ্য বাদ পড়া'),
  OtherStaticModel(id: '4', description: 'আকার/রঙে ভিন্নতার কারণে বাতিল'),
  OtherStaticModel(id: '5', description: 'দাগযুক্ত/আঘাতপ্রাপ্ত আম বাদ'),
  OtherStaticModel(id: '96', description: 'অন্যান্য কারণ উল্লেখ করুন'),
];

List<OtherStaticModel> lossReasonListMangoPartFourFifth = [
  OtherStaticModel(id: '1', description: 'অদক্ষ শ্রমিকের কারণে বেশি শাঁস নষ্ট হওয়া'),
  OtherStaticModel(id: '2', description: 'ধারালো/অনুপযুক্ত যন্ত্র ব্যবহার'),
  OtherStaticModel(id: '3', description: 'দ্রুত কাজের চাপে অপচয় বৃদ্ধি'),
  OtherStaticModel(id: '4', description: 'যন্ত্রের ভুল সেটিং বা রক্ষণাবেক্ষণের অভাব'),
  OtherStaticModel(id: '5', description: 'অক্সিডেশনের কারণে রঙ ও মান নষ্ট হওয়া'),
  OtherStaticModel(id: '6', description: 'অতিরিক্ত চাপ প্রয়োগে রস/শাঁস নষ্ট'),
  OtherStaticModel(id: '96', description: 'অন্যান্য কারণ উল্লেখ করুন'),
];

List<OtherStaticModel> lossReasonListMangoPartFourSixth = [
  OtherStaticModel(id: '1', description: 'মেশিনের ত্রুটি'),
  OtherStaticModel(id: '2', description: 'ক্যালিব্রেশন সমস্যা'),
  OtherStaticModel(id: '3', description: 'বিদ্যুৎ বিভ্রাট'),
  OtherStaticModel(id: '4', description: 'অতিরিক্ত চাপ বা তাপ'),
  OtherStaticModel(id: '96', description: 'অন্যান্য কারণ উল্লেখ করুন'),
];

List<OtherStaticModel> lossReasonListMangoPartFourSeventh = [
  OtherStaticModel(id: '1', description: 'ধীরগতির কুলিং'),
  OtherStaticModel(id: '2', description: 'পর্যাপ্ত কোল্ড স্টোরেজের অভাব'),
  OtherStaticModel(id: '3', description: 'তাপমাত্রা ওঠানামা'),
  OtherStaticModel(id: '96', description: 'অন্যান্য কারণ উল্লেখ করুন'),
];

List<OtherStaticModel> lossReasonListMangoPartFourEighth = [
  OtherStaticModel(id: '1', description: 'নিম্নমানের বা অস্বাস্থ্যকর প্যাকেজিং উপকরণ'),
  OtherStaticModel(id: '2', description: 'সঠিক সিলিং না হওয়া'),
  OtherStaticModel(id: '3', description: 'তাপ ও আলো থেকে সুরক্ষার অভাব'),
  OtherStaticModel(id: '4', description: 'ওজন ভুল'),
  OtherStaticModel(id: '5', description: 'প্যাকেট ছেঁড়া'),
  OtherStaticModel(id: '6', description: 'বারবার হ্যান্ডলিং'),
  OtherStaticModel(id: '96', description: 'অন্যান্য কারণ উল্লেখ করুন'),
];

List<OtherStaticModel> lossReasonListMangoPartFourNinth = [
  OtherStaticModel(id: '1', description: 'বিদ্যুৎ বিভ্রাট'),
  OtherStaticModel(id: '2', description: 'সঠিক তাপমাত্রা/আর্দ্রতা না থাকা'),
  OtherStaticModel(id: '3', description: 'কীট-পতঙ্গ আক্রমণ'),
  OtherStaticModel(id: '4', description: 'বাজারমূল্য কমে যাওয়া'),
  OtherStaticModel(id: '96', description: 'অন্যান্য কারণ উল্লেখ করুন'),
];

List<OtherStaticModel> lossReasonListMangoPartFourTenth = [
  OtherStaticModel(id: '1', description: 'দীর্ঘদিন সংরক্ষণ'),
  OtherStaticModel(id: '2', description: 'গুদামের অপরিচ্ছন্নতা'),
  OtherStaticModel(id: '3', description: 'বায়ু চলাচলের অভাব'),
  OtherStaticModel(id: '4', description: 'প্রক্রিয়াজাত বিলম্ব'),
  OtherStaticModel(id: '5', description: 'বাজারজাতকরণে বিলম্ব'),
  OtherStaticModel(id: '6', description: 'মেয়াদোত্তীর্ণ (Expiry)'),
  OtherStaticModel(id: '7', description: 'দুর্বল স্টক ব্যবস্থাপনা'),
  OtherStaticModel(id: '8', description: 'সঠিক FIFO অনুসরণ না করা'),
  OtherStaticModel(id: '96', description: 'অন্যান্য কারণ উল্লেখ করুন'),
];

List<OtherStaticModel> lossReasonListMangoPartFourEleventh = [
  OtherStaticModel(id: '1', description: 'অনুপযুক্ত যানবাহন'),
  OtherStaticModel(id: '2', description: 'প্যাকেট ক্ষতি'),
  OtherStaticModel(id: '3', description: 'অতিরিক্ত লোড'),
  OtherStaticModel(id: '96', description: 'অন্যান্য কারণ উল্লেখ করুন'),
];

List<OtherStaticModel> lossReasonListMangoPartFourTwelfth = [OtherStaticModel(id: '96', description: 'অন্যান্য কারণ উল্লেখ করুন')];

List<OtherStaticModel> lossReasonListCarpCingripPartOneFirst = [
  OtherStaticModel(id: '1', description: 'কীটনাশক/গ্যাস ব্যবহার'),
  OtherStaticModel(id: '2', description: 'রোগে আক্রান্ত'),
  OtherStaticModel(id: '3', description: 'দীর্ঘ সময় জালে আটকে থাকা'),
  OtherStaticModel(id: '4', description: 'অনভিজ্ঞ শ্রমিক দ্বারা উত্তোলন'),
  OtherStaticModel(id: '5', description: 'পা, পাখনা, শুঁড় (antenna), খোলস ছিঁড়ে যাওয়া/অঙ্গহানি'),
  OtherStaticModel(id: '6', description: 'আঘাতপ্রাপ্ত বা চাপজনিত কারণে'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListCarpCingripPartOneSecond = [
  OtherStaticModel(id: '1', description: 'পা, পাখনা, শুঁড় (antenna), খোলস, লেজ, আঁশ ছিঁড়ে যাওয়া/অঙ্গহানি'),
  OtherStaticModel(id: '2', description: 'অতিরিক্ত নড়াচড়ায় গুণগত মান হ্রাস'),
  OtherStaticModel(id: '3', description: 'মাথা বিচ্ছিন্ন হয়ে যাওয়া'),
  OtherStaticModel(id: '4', description: 'অপরিষ্কার পানির কারণে দ্রুত পচন'),
  OtherStaticModel(id: '5', description: 'ময়লাযুক্ত ড্রেনে মাছ পড়ে যাওয়া'),
  OtherStaticModel(id: '6', description: 'ছত্রাক সংক্রমণ'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListCarpCingripPartOneThird = [
  OtherStaticModel(id: '1', description: 'সাইজ অনুযায়ী বাছাইকরণ'),
  OtherStaticModel(id: '2', description: 'পানির বাইরে বেশি সময় রাখা'),
  OtherStaticModel(id: '3', description: 'রুক্ষ বা ধারালো গ্রেডিং ট্রে/ঝুড়ি ব্যবহার'),
  OtherStaticModel(id: '4', description: 'অপরিষ্কার বা খসখসে গ্রেডিং টেবিল'),
  OtherStaticModel(id: '5', description: 'ভুল বা অতিরিক্ত বাছাইকরণ'),
  OtherStaticModel(id: '6', description: 'মানদণ্ড সম্পের্কে স্পষ্ট ধারনা/টুলস না থাকা'),
  OtherStaticModel(id: '7', description: 'শ্রমিকের অদক্ষতা'),
  OtherStaticModel(id: '8', description: 'স্তূপ আকারে রাখা'),
  OtherStaticModel(id: '9', description: 'পাখনা ও লেজ ভেঙে যাওয়া'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListCarpCingripPartOneFourth = [
  OtherStaticModel(id: '1', description: 'ভুল পদ্ধতিতে পরিমাপ'),
  OtherStaticModel(id: '2', description: 'হাত বদল'),
  OtherStaticModel(id: '3', description: 'আঘাত জনিত ক্ষতি'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListCarpCingripPartOneFifth = [
  OtherStaticModel(id: '1', description: 'উত্তোলনের সাথে সাথে বরফ না দেওয়া'),
  OtherStaticModel(id: '2', description: 'বরফের পরিমাণ কম বা অসমভাবে দেওয়া'),
  OtherStaticModel(id: '3', description: 'নিম্নমানের বা দূষিত বরফ ব্যবহারে গুণগত ক্ষতি'),
  OtherStaticModel(id: '4', description: 'বড় মাছ/চিংড়ির ভেতরে তাপ থেকে যাওয়া (core temperature কম না হওয়া)'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListCarpCingripPartOneSixth = [
  OtherStaticModel(id: '1', description: 'উপযুক্ত ফুড গ্রেড প্লাস্টিক ক্রেট/বক্স ব্যবহার না করা'),
  OtherStaticModel(id: '2', description: 'অতিরিক্ত চাপ'),
  OtherStaticModel(id: '3', description: 'বরফের সঠিক স্তর (layering) না মানা'),
  OtherStaticModel(id: '4', description: 'বক্স পরিষ্কার না থাকায় দূষণ'),
  OtherStaticModel(id: '5', description: 'বরফ দ্রুত গলে মাছে পচন ধরা'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListCarpCingripPartOneSeventh = [
  OtherStaticModel(id: '1', description: 'আঘাত জনিত ক্ষতি'),
  OtherStaticModel(id: '2', description: 'উচ্চতা থেকে ফেলা'),
  OtherStaticModel(id: '3', description: 'অতিরিক্ত চাপ'),
  OtherStaticModel(id: '4', description: 'অনুপযুক্ত যন্ত্রপাতি'),
  OtherStaticModel(id: '5', description: 'শ্রমিকের অদক্ষতা'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListCarpCingripPartOneEighth = [
  OtherStaticModel(id: '1', description: 'অনুপযুক্ত কন্টেইনার (প্লাস্টিক ক্রেট, অক্সিজেন ব্যাগ) ব্যবহার'),
  OtherStaticModel(id: '2', description: 'মাছ বেশি চাপ দিয়ে ভরা'),
  OtherStaticModel(id: '3', description: 'বরফের পরিমাণ কম বা অসমভাবে দেওয়া'),
  OtherStaticModel(id: '4', description: 'ব্যাগ/ড্রামের ফুটো বা লিকেজ'),
  OtherStaticModel(id: '5', description: 'রাস্তায় ঝাঁকুনি ও নড়াচড়া সময় বেশি লাগা'),
  OtherStaticModel(id: '6', description: 'অতিরিক্ত গরম আবহাওয়া'),
  OtherStaticModel(id: '7', description: 'যানবাহনে পর্যাপ্ত ছায়া ও ঠাণ্ডা ব্যবস্থা না থাকা'),
  OtherStaticModel(id: '8', description: 'ট্রাফিক জ্যাম/লোডিং–আনলোডিং বিলম্ব'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListCarpCingripPartOneNinth = [
  OtherStaticModel(id: '1', description: 'ব্যপারী দেরিতে আসা'),
  OtherStaticModel(id: '2', description: 'দরদাম নিয়ে দীর্ঘ সময় অপেক্ষা'),
  OtherStaticModel(id: '3', description: 'পর্যাপ্ত পানি/বরফ/অক্সিজেনের ব্যবস্থা না থাকা'),
  OtherStaticModel(id: '4', description: 'বরফ গলে যাওয়া'),
  OtherStaticModel(id: '5', description: 'দুর্বল/নষ্ট মাছের সংস্পর্শে ভালো মাছ/চিংড়ির মান কমে যাওয়া'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListCarpCingripPartOneTenth = [
  OtherStaticModel(id: '1', description: 'বারবার হাতবদল'),
  OtherStaticModel(id: '2', description: 'বাজার দর কম হওয়ায় বিক্রি বিলম্ব'),
  OtherStaticModel(id: '3', description: 'দেরিতে হস্তান্তর'),
  OtherStaticModel(id: '4', description: 'দায়বদ্ধতার অভাব'),
  OtherStaticModel(id: '5', description: 'তথ্যের ঘাটতি'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListCarpCingripPartOneEleventh = [
  OtherStaticModel(id: '1', description: 'তাপমাত্রা ও আর্দ্রতা নিয়ন্ত্রণের অভাব'),
  OtherStaticModel(id: '2', description: 'দীর্ঘদিন সংরক্ষণ'),
  OtherStaticModel(id: '3', description: 'স্তূপ করে রাখা'),
  OtherStaticModel(id: '4', description: 'বিদ্যুৎ বিভ্রাট'),
  OtherStaticModel(id: '5', description: 'পর্যাপ্ত বরফ বা ঠাণ্ডা ব্যবস্থার অভাব'),
  OtherStaticModel(id: '6', description: 'গলিত বরফের পানিতে দীর্ঘ সময় থাকায় কালচে দাগ (black spot)'),
  OtherStaticModel(id: '7', description: 'পানিতে পর্যাপ্ত অক্সিজেন না থাকা'),
  OtherStaticModel(id: '8', description: 'ব্যাকটেরিয়াল সংক্রমণ'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListCarpCingripPartOneTwelfth = [
  OtherStaticModel(id: '1', description: 'পানি সংকট'),
  OtherStaticModel(id: '2', description: 'শ্রমিক ঘাটতি'),
  OtherStaticModel(id: '3', description: 'বাজার চাহিদা কমে যাওয়া'),
  OtherStaticModel(id: '4', description: 'মূল্য পতন'),
  OtherStaticModel(id: '5', description: 'বিক্রি না হওয়া'),
  OtherStaticModel(id: '6', description: 'প্রাকৃতিক দুর্যোগ'),
  OtherStaticModel(id: '7', description: 'ধর্মঘট'),
  OtherStaticModel(id: '8', description: 'পরিবহন বা লজিস্টিক বিঘ্ন'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListCarpCingripPartTwoFirst = [
  OtherStaticModel(id: '1', description: 'অনুপযুক্ত যানবাহন'),
  OtherStaticModel(id: '2', description: 'অতিরিক্ত লোড'),
  OtherStaticModel(id: '3', description: 'রাস্তার ঝাঁকুনি'),
  OtherStaticModel(id: '4', description: 'দীর্ঘ পরিবহন সময়'),
  OtherStaticModel(id: '5', description: 'আবহাওয়ার প্রভাব'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListCarpCingripPartTwoSecond = [
  OtherStaticModel(id: '1', description: 'সাইজ অনুযায়ী বাছাইকরণ'),
  OtherStaticModel(id: '2', description: 'ছোট মাছ বাছাইয়ে অবহেলা'),
  OtherStaticModel(id: '3', description: 'রুক্ষ বা ধারালো গ্রেডিং ট্রে/ঝুড়ি ব্যবহার'),
  OtherStaticModel(id: '4', description: 'অপরিষ্কার বা খসখসে গ্রেডিং টেবিল'),
  OtherStaticModel(id: '5', description: 'ভুল বা অতিরিক্ত বাছাইকরণ'),
  OtherStaticModel(id: '6', description: 'মানদণ্ড সম্পের্কে স্পষ্ট ধারনা/টুলস না থাকা'),
  OtherStaticModel(id: '7', description: 'শ্রমিকের অদক্ষতা'),
  OtherStaticModel(id: '8', description: 'স্তূপ আকারে রাখা'),
  OtherStaticModel(id: '9', description: 'পাখনা ও লেজ ভেঙে যাওয়া'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListCarpCingripPartTwoThird = [
  OtherStaticModel(id: '1', description: 'পা, পাখনা, শুঁড় (antenna), খোলস, লেজ, আঁশ ছিঁড়ে যাওয়া/অঙ্গহানি'),
  OtherStaticModel(id: '2', description: 'অতিরিক্ত নড়াচড়ায় গুণগত মান হ্রাস'),
  OtherStaticModel(id: '3', description: 'মাথা বিচ্ছিন্ন হয়ে যাওয়া'),
  OtherStaticModel(id: '4', description: 'অপরিষ্কার পানির কারণে দ্রুত পচন'),
  OtherStaticModel(id: '5', description: 'ময়লাযুক্ত ড্রেনে মাছ পড়ে যাওয়া'),
  OtherStaticModel(id: '6', description: 'ছত্রাক সংক্রমণ'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListCarpCingripPartTwoFourth = [
  OtherStaticModel(id: '1', description: 'ভুল পদ্ধতিতে পরিমাপ'),
  OtherStaticModel(id: '2', description: 'হাত বদল'),
  OtherStaticModel(id: '3', description: 'আঘাত জনিত ক্ষতি'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListCarpCingripPartTwoFifth = [
  OtherStaticModel(id: '1', description: 'আঘাত জনিত ক্ষতি'),
  OtherStaticModel(id: '2', description: 'উচ্চতা থেকে ফেলা'),
  OtherStaticModel(id: '3', description: 'অতিরিক্ত চাপ'),
  OtherStaticModel(id: '4', description: 'অনুপযুক্ত যন্ত্রপাতি'),
  OtherStaticModel(id: '5', description: 'শ্রমিকের অদক্ষতা'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListCarpCingripPartTwoSixth = [
  OtherStaticModel(id: '1', description: 'উত্তোলনের সাথে সাথে বরফ না দেওয়া'),
  OtherStaticModel(id: '2', description: 'বরফের পরিমাণ কম বা অসমভাবে দেওয়া'),
  OtherStaticModel(id: '3', description: 'নিম্নমানের বা দূষিত বরফ ব্যবহারে গুণগত ক্ষতি'),
  OtherStaticModel(id: '4', description: 'বড় মাছ/চিংড়ির ভেতরে তাপ থেকে যাওয়া (core temperature কম না হওয়া)'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListCarpCingripPartTwoSeventh = [
  OtherStaticModel(id: '1', description: 'উপযুক্ত ফুড গ্রেড প্লাস্টিক ক্রেট/বক্স ব্যবহার না করা'),
  OtherStaticModel(id: '2', description: 'অতিরিক্ত চাপ'),
  OtherStaticModel(id: '3', description: 'বরফের সঠিক স্তর (layering) না মানা'),
  OtherStaticModel(id: '4', description: 'বক্স পরিষ্কার না থাকায় দূষণ'),
  OtherStaticModel(id: '5', description: 'বরফ দ্রুত গলে মাছে পচন ধরা'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListCarpCingripPartTwoEighth = [
  OtherStaticModel(id: '1', description: 'অনুপযুক্ত যানবাহন'),
  OtherStaticModel(id: '2', description: 'দীর্ঘ সময় পরিবহন'),
  OtherStaticModel(id: '3', description: 'রাস্তার ঝাঁকুনি'),
  OtherStaticModel(id: '4', description: 'তাপমাত্রা বৃদ্ধি'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListCarpCingripPartTwoNinth = [
  OtherStaticModel(id: '1', description: 'বারবার হ্যান্ডলিং'),
  OtherStaticModel(id: '2', description: 'দেরিতে হস্তান্তর'),
  OtherStaticModel(id: '3', description: 'দায়বদ্ধতার অভাব'),
  OtherStaticModel(id: '4', description: 'তথ্যের ঘাটতি'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListCarpCingripPartTwoTenth = [
  OtherStaticModel(id: '1', description: 'তাপমাত্রা ও আর্দ্রতা নিয়ন্ত্রণের অভাব'),
  OtherStaticModel(id: '2', description: 'কীট-পতঙ্গ আক্রমণ'),
  OtherStaticModel(id: '3', description: 'দীর্ঘদিন সংরক্ষণ'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListCarpCingripPartTwoEleventh = [OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)')];

List<OtherStaticModel> lossReasonListCarpCingripPartThreeFirst = [
  OtherStaticModel(id: '1', description: 'দুর্বল/আঘাতপ্রাপ্ত মাছ ক্রয় করা'),
  OtherStaticModel(id: '2', description: 'মাছ দীর্ঘ সময় পানির বাইরে থাকা'),
  OtherStaticModel(id: '3', description: 'দরদাম ও হিসাবনিকাশে দেরি'),
  OtherStaticModel(id: '4', description: 'পর্যাপ্ত পানি ও অক্সিজেনের অভাব'),
  OtherStaticModel(id: '5', description: 'অনুপযুক্ত যানবাহন'),
  OtherStaticModel(id: '6', description: 'সঠিক মানের বক্স ব্যবহার না করা'),
  OtherStaticModel(id: '7', description: 'অতিরিক্ত লোড'),
  OtherStaticModel(id: '8', description: 'দীর্ঘ সময় পরিবহন'),
  OtherStaticModel(id: '9', description: 'আবহাওয়ার প্রভাব'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListCarpCingripPartThreeSecond = [
  OtherStaticModel(id: '1', description: 'পা, পাখনা, শুঁড় (antenna), খোলস, লেজ, আঁশ ছিঁড়ে যাওয়া/অঙ্গহানি'),
  OtherStaticModel(id: '2', description: 'অতিরিক্ত নড়াচড়ায় গুণগত মান হ্রাস'),
  OtherStaticModel(id: '3', description: 'মাথা বিচ্ছিন্ন হয়ে যাওয়া'),
  OtherStaticModel(id: '4', description: 'অপরিষ্কার পানির কারণে দ্রুত পচন'),
  OtherStaticModel(id: '5', description: 'ময়লাযুক্ত ড্রেনে মাছ পড়ে যাওয়া'),
  OtherStaticModel(id: '6', description: 'ছত্রাক সংক্রমণ'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListCarpCingripPartThreeThird = [
  OtherStaticModel(id: '1', description: 'সাইজ অনুযায়ী বাছাইকরণ'),
  OtherStaticModel(id: '2', description: 'পানির বাইরে বেশি সময় রাখা'),
  OtherStaticModel(id: '3', description: 'রুক্ষ বা ধারালো গ্রেডিং ট্রে/ঝুড়ি ব্যবহার'),
  OtherStaticModel(id: '4', description: 'অপরিষ্কার বা খসখসে গ্রেডিং টেবিল'),
  OtherStaticModel(id: '5', description: 'ভুল বা অতিরিক্ত বাছাইকরণ'),
  OtherStaticModel(id: '6', description: 'মানদণ্ড সম্পের্কে স্পষ্ট ধারনা/টুলস না থাকা'),
  OtherStaticModel(id: '7', description: 'শ্রমিকের অদক্ষতা'),
  OtherStaticModel(id: '8', description: 'স্তূপ আকারে রাখা'),
  OtherStaticModel(id: '9', description: 'পাখনা ও লেজ ভেঙে যাওয়া'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListCarpCingripPartThreeFourth = [
  OtherStaticModel(id: '1', description: 'ক্রয়ের পরপরই বরফ না দেওয়া'),
  OtherStaticModel(id: '2', description: 'বরফের পরিমাণ কম বা অসমভাবে দেওয়া'),
  OtherStaticModel(id: '3', description: 'নিম্নমানের বা দূষিত বরফ ব্যবহারে গুণগত ক্ষতি'),
  OtherStaticModel(id: '4', description: 'বড় মাছ/চিংড়ির ভেতরে তাপ থেকে যাওয়া (core temperature কম না হওয়া)'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListCarpCingripPartThreeFifth = [
  OtherStaticModel(id: '1', description: 'পর্যাপ্ত বরফ/ঠাণ্ডা ব্যবস্থা না থাকা'),
  OtherStaticModel(id: '2', description: 'মাছ/চিংড়ি খোলা জায়গায় দীর্ঘ সময় রাখা'),
  OtherStaticModel(id: '3', description: 'একটি নষ্ট হলে অন্যটি দ্রুত দূষিত হওয়া'),
  OtherStaticModel(id: '4', description: 'পানির নিষ্কাশন ঠিক না থাকায় গলিত বরফে মাছ/চিংড়ি ভেজা থাকা'),
  OtherStaticModel(id: '5', description: 'ক্রেতার স্পর্শ ও বারবার উল্টানো'),
  OtherStaticModel(id: '6', description: 'দরদাম নিয়ে সময়ক্ষেপণ'),
  OtherStaticModel(id: '7', description: 'ক্রেতা কম থাকায় বিক্রি বিলম্ব'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListCarpCingripPartThreeSixth = [
  OtherStaticModel(id: '1', description: 'উপযুক্ত ফুড গ্রেড প্লাস্টিক ক্রেট/বক্স ব্যবহার না করা'),
  OtherStaticModel(id: '2', description: 'মাছ অতিরিক্ত চাপ দিয়ে ভরা'),
  OtherStaticModel(id: '3', description: 'সঠিক স্তর (layering) বজায় না রাখা'),
  OtherStaticModel(id: '4', description: 'অপরিষ্কার কন্টেইনারে রাখায় দূষণ'),
  OtherStaticModel(id: '5', description: 'পুনঃপ্যাকেজিংয়ে হ্যান্ডলিংজনিত ক্ষতি'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListCarpCingripPartThreeSeventh = [
  OtherStaticModel(id: '1', description: 'উচ্চতা থেকে ফেলা'),
  OtherStaticModel(id: '2', description: 'বস্তা টানা/ছোঁড়া'),
  OtherStaticModel(id: '3', description: 'অনুপযুক্ত যন্ত্রপাতি'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListCarpCingripPartThreeEighth = [
  OtherStaticModel(id: '1', description: 'বাজারে বিক্রয়ের জন্য অপেক্ষা অবিক্রীত মাছ'),
  OtherStaticModel(id: '2', description: 'ছায়াযুক্ত ও ঠাণ্ডা জায়গার অভাব'),
  OtherStaticModel(id: '3', description: 'মাছ/চিংড়ি স্তূপ করে রাখা'),
  OtherStaticModel(id: '4', description: 'গলিত বরফের পানিতে দীর্ঘ সময় থাকায় কালচে দাগ (black spot)'),
  OtherStaticModel(id: '5', description: 'ব্যাকটেরিয়াল সংক্রমণ'),
  OtherStaticModel(id: '6', description: 'আর্দ্রতা ও তাপমাত্রা নিয়ন্ত্রণের অভাব'),
  OtherStaticModel(id: '7', description: 'বিদ্যুৎ বিভ্রাট'),
  OtherStaticModel(id: '8', description: 'পোকামাকড়/ইঁদুর আক্রমণ'),
  OtherStaticModel(id: '9', description: 'দীর্ঘদিন সংরক্ষণ'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListCarpCingripPartThreeNinth = [
  OtherStaticModel(id: '1', description: 'পানি সংকট'),
  OtherStaticModel(id: '2', description: 'শ্রমিক ঘাটতি'),
  OtherStaticModel(id: '3', description: 'প্রাকৃতিক দুর্যোগ'),
  OtherStaticModel(id: '4', description: 'আগুন'),
  OtherStaticModel(id: '5', description: 'লজিস্টিক বা নিরাপত্তা সমস্যা'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListAluOrionPartOneFirst = [
  OtherStaticModel(id: '1', description: 'অসময়ে উত্তোলন'),
  OtherStaticModel(id: '2', description: 'অদক্ষ শ্রমিক'),
  OtherStaticModel(id: '3', description: 'যন্ত্রপাতির ভুল ব্যবহার'),
  OtherStaticModel(id: '4', description: 'ঝড়–বৃষ্টি'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListAluOrionPartOneSecond = [
  OtherStaticModel(id: '1', description: 'খারাপ রাস্তা'),
  OtherStaticModel(id: '2', description: 'অনুপযুক্ত বাহন'),
  OtherStaticModel(id: '3', description: 'গাড়ি থেকে পড়ে যাওয়া'),
  OtherStaticModel(id: '4', description: 'প্রাকৃতিক দুর্যোগ (ঝড়/বৃষ্টি/বন্যা)'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListAluOrionPartOneThird = [
  OtherStaticModel(id: '1', description: 'যন্ত্রপাতির অভাব'),
  OtherStaticModel(id: '2', description: 'অদক্ষ শ্রমিক/শ্রমিক সংকট'),
  OtherStaticModel(id: '3', description: 'পানির অপর্যাপ্ততা'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListAluOrionPartOneFourth = [
  OtherStaticModel(id: '1', description: 'ভুল গ্রেডিং'),
  OtherStaticModel(id: '2', description: 'অভিজ্ঞতার অভাব'),
  OtherStaticModel(id: '3', description: 'তাড়াহুড়া'),
  OtherStaticModel(id: '4', description: 'মান নির্ধারণে ভুল'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListAluOrionPartOneFifth = [
  OtherStaticModel(id: '1', description: 'অপর্যাপ্ত রোদ'),
  OtherStaticModel(id: '2', description: 'অতিরিক্ত তাপ'),
  OtherStaticModel(id: '3', description: 'বৃষ্টিতে ভেজা'),
  OtherStaticModel(id: '4', description: 'পোকামাকড়/পাখি'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListAluOrionPartOneSixth = [
  OtherStaticModel(id: '1', description: 'বাজারে অতিরিক্ত সরবরাহ'),
  OtherStaticModel(id: '2', description: 'কম দাম'),
  OtherStaticModel(id: '3', description: 'সংরক্ষণ সুবিধার অভাব'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListAluOrionPartOneSeventh = [
  OtherStaticModel(id: '1', description: 'ঝরে পড়া'),
  OtherStaticModel(id: '2', description: 'ত্রুটিপূর্ণ ওজন যন্ত্র'),
  OtherStaticModel(id: '3', description: 'বারবার স্থানান্তর'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListAluOrionPartOneEighth = [
  OtherStaticModel(id: '1', description: 'নিম্নমানের বস্তা'),
  OtherStaticModel(id: '2', description: 'অতিরিক্ত চাপ'),
  OtherStaticModel(id: '3', description: 'ছেঁড়া প্যাকেট'),
  OtherStaticModel(id: '4', description: 'আর্দ্রতা'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListAluOrionPartOneNinth = [
  OtherStaticModel(id: '1', description: 'অসাবধানভাবে ফেলা'),
  OtherStaticModel(id: '2', description: 'উচ্চতা থেকে ছোড়া'),
  OtherStaticModel(id: '3', description: 'বস্তা ছেঁড়া'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListAluOrionPartOneTenth = [
  OtherStaticModel(id: '1', description: 'পোকামাকড়/ইঁদুর'),
  OtherStaticModel(id: '2', description: 'আর্দ্রতা'),
  OtherStaticModel(id: '3', description: 'বাতাস চলাচলের অভাব'),
  OtherStaticModel(id: '4', description: 'অপরিচ্ছন্নতা'),
  OtherStaticModel(id: '5', description: 'চাহিদা/মূল্য হ্রাসের কারণে ক্ষতি'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListAluOrionPartOneEleventh = [
  OtherStaticModel(id: '1', description: 'দীর্ঘ সময় পরিবহন'),
  OtherStaticModel(id: '2', description: 'খোলা গাড়ি'),
  OtherStaticModel(id: '3', description: 'ঝাঁকুনি'),
  OtherStaticModel(id: '4', description: 'বৃষ্টি'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListAluOrionPartOneTwelfth = [
  OtherStaticModel(id: '1', description: 'খারাপ রাস্তা'),
  OtherStaticModel(id: '2', description: 'অনুপযুক্ত বাহন'),
  OtherStaticModel(id: '3', description: 'ঝরে পড়া'),
  OtherStaticModel(id: '4', description: 'প্রাকৃতিক দুর্যোগ (ঝড়/বৃষ্টি/বন্যা)'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListAluOrionPartOneThirteenth = [
  OtherStaticModel(id: '1', description: 'চাপ লেগে কালচে দাগ, পচন'),
  OtherStaticModel(id: '2', description: 'খারাপ রাস্তা বা দীর্ঘ সময় পরিবহন'),
  OtherStaticModel(id: '3', description: 'দীর্ঘ সময় বিক্রি না হওয়া'),
  OtherStaticModel(id: '4', description: 'মান অনুযায়ী গ্রেডিং না করা'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListAluOrionPartOneFourteenth = [OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)')];

List<OtherStaticModel> lossReasonListAluOrionPartTwoFirst = [
  OtherStaticModel(id: '1', description: 'অনুপযুক্ত বাহন'),
  OtherStaticModel(id: '2', description: 'খোলা গাড়ি'),
  OtherStaticModel(id: '3', description: 'ঝাঁকুনি ও কম্পন'),
  OtherStaticModel(id: '4', description: 'দূরত্ব বেশি'),
  OtherStaticModel(id: '5', description: 'বৃষ্টি/আর্দ্রতা'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListAluOrionPartTwoSecond = [
  OtherStaticModel(id: '1', description: 'দীর্ঘ সময় পরিবহন'),
  OtherStaticModel(id: '2', description: 'রাস্তাঘাট খারাপ'),
  OtherStaticModel(id: '3', description: 'বারবার হাতবদল'),
  OtherStaticModel(id: '4', description: 'প্যাকেট ছেঁড়া'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListAluOrionPartTwoThird = [
  OtherStaticModel(id: '1', description: 'ভুল পদ্ধতি'),
  OtherStaticModel(id: '2', description: 'যন্ত্রের অভাব'),
  OtherStaticModel(id: '3', description: 'তাড়াহুড়া'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListAluOrionPartTwoFourth = [
  OtherStaticModel(id: '1', description: 'ঝরে পড়া'),
  OtherStaticModel(id: '2', description: 'ত্রুটিপূর্ণ ওজন যন্ত্র'),
  OtherStaticModel(id: '3', description: 'বারবার স্থানান্তর'),
  OtherStaticModel(id: '4', description: 'খোলা পাত্রে ওজন'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListAluOrionPartTwoFifth = [
  OtherStaticModel(id: '1', description: 'ভুল গ্রেডিং'),
  OtherStaticModel(id: '2', description: 'মান নির্ধারণে অস্পষ্টতা'),
  OtherStaticModel(id: '3', description: 'অভিজ্ঞতার অভাব'),
  OtherStaticModel(id: '4', description: 'ভালো পণ্য বাদ পড়া'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListAluOrionPartTwoSixth = [
  OtherStaticModel(id: '1', description: 'অতিরিক্ত হাতবদল'),
  OtherStaticModel(id: '2', description: 'স্তূপ করে রাখা'),
  OtherStaticModel(id: '3', description: 'চাপ পড়ে ক্ষতি'),
  OtherStaticModel(id: '4', description: 'প্যাকেট ছেঁড়া'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListAluOrionPartTwoSeventh = [
  OtherStaticModel(id: '1', description: 'অসাবধানভাবে ফেলা'),
  OtherStaticModel(id: '2', description: 'উচ্চতা থেকে নামানো'),
  OtherStaticModel(id: '3', description: 'শ্রমিকের অদক্ষতা'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListAluOrionPartTwoEighth = [
  OtherStaticModel(id: '1', description: 'নিম্নমানের বস্তা/কার্টন'),
  OtherStaticModel(id: '2', description: 'অতিরিক্ত চাপ'),
  OtherStaticModel(id: '3', description: 'ছেঁড়া প্যাকেট'),
  OtherStaticModel(id: '4', description: 'আর্দ্রতা'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListAluOrionPartTwoNinth = [
  OtherStaticModel(id: '1', description: 'খোলা যানবাহন'),
  OtherStaticModel(id: '2', description: 'দীর্ঘ সময় যাত্রা'),
  OtherStaticModel(id: '3', description: 'ঝাঁকুনি'),
  OtherStaticModel(id: '4', description: 'আবহাওয়ার প্রভাব'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListAluOrionPartTwoTenth = [
  OtherStaticModel(id: '1', description: 'পোকামাকড় ও ইঁদুর'),
  OtherStaticModel(id: '2', description: 'আর্দ্রতা'),
  OtherStaticModel(id: '3', description: 'বাতাস চলাচল না থাকা'),
  OtherStaticModel(id: '4', description: 'গুদামের অপরিচ্ছন্নতা'),
  OtherStaticModel(id: '5', description: 'চাহিদা/মূল্য হ্রাসের কারণে ক্ষতি'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListAluOrionPartTwoEleventh = [OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)')];

List<OtherStaticModel> lossReasonListAluOrionPartThreeFirst = [
  OtherStaticModel(id: '1', description: 'অনুপযুক্ত বাহন'),
  OtherStaticModel(id: '2', description: 'খোলা গাড়ি'),
  OtherStaticModel(id: '3', description: 'ঝাঁকুনি ও কম্পন'),
  OtherStaticModel(id: '4', description: 'দূরত্ব বেশি'),
  OtherStaticModel(id: '5', description: 'বৃষ্টি/আর্দ্রতা'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListAluOrionPartThreeSecond = [
  OtherStaticModel(id: '1', description: 'প্যাকেজ ছেঁড়া'),
  OtherStaticModel(id: '2', description: 'খারাপ রাস্তা'),
  OtherStaticModel(id: '3', description: 'অতিরিক্ত বোঝা'),
  OtherStaticModel(id: '4', description: 'বারবার হাতবদল'),
  OtherStaticModel(id: '5', description: 'অনুপযুক্ত বাহন'),
  OtherStaticModel(id: '6', description: 'ঝাঁকুনি'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListAluOrionPartThreeThird = [
  OtherStaticModel(id: '1', description: 'অতিরিক্ত বাতাসে দানা উড়ে যাওয়া'),
  OtherStaticModel(id: '2', description: 'যন্ত্রের ত্রুটি'),
  OtherStaticModel(id: '3', description: 'অদক্ষ অপারেটর'),
  OtherStaticModel(id: '4', description: 'ধোয়ার সময় পানিতে ভেসে যাওয়া'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListAluOrionPartThreeFourth = [
  OtherStaticModel(id: '1', description: 'নিম্নমানের বস্তা'),
  OtherStaticModel(id: '2', description: 'অতিরিক্ত চাপ'),
  OtherStaticModel(id: '3', description: 'ছেঁড়া প্যাকেট'),
  OtherStaticModel(id: '4', description: 'আর্দ্রতা প্রবেশ'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListAluOrionPartThreeFifth = [
  OtherStaticModel(id: '1', description: 'ভুল গ্রেডিং মানদণ্ড'),
  OtherStaticModel(id: '2', description: 'অভিজ্ঞতার অভাব'),
  OtherStaticModel(id: '3', description: 'ভালো দানা বাদ পড়া'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListAluOrionPartThreeSixth = [
  OtherStaticModel(id: '1', description: 'অসাবধানভাবে ফেলা'),
  OtherStaticModel(id: '2', description: 'উচ্চতা থেকে নামানো'),
  OtherStaticModel(id: '3', description: 'শ্রমিকের অদক্ষতা'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListAluOrionPartThreeSeventh = [
  OtherStaticModel(id: '1', description: 'পোকামাকড়/ইঁদুর'),
  OtherStaticModel(id: '2', description: 'আর্দ্রতা'),
  OtherStaticModel(id: '3', description: 'বায়ুচলাচলের অভাব'),
  OtherStaticModel(id: '4', description: 'দীর্ঘদিন সংরক্ষণ'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListAluOrionPartThreeEighth = [
  OtherStaticModel(id: '1', description: 'বিদ্যুৎ বিভ্রাট'),
  OtherStaticModel(id: '2', description: 'যন্ত্র বিকল'),
  OtherStaticModel(id: '3', description: 'অগ্নিকাণ্ড'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListAluOrionPartFourFirst = [
  OtherStaticModel(id: '1', description: 'নিম্নমানের কাঁচামাল'),
  OtherStaticModel(id: '2', description: 'অতিরিক্ত পাকা/কাঁচা পণ্য'),
  OtherStaticModel(id: '3', description: 'পরিবহনজনিত আঘাত'),
  OtherStaticModel(id: '4', description: 'দেরিতে সরবরাহ'),
  OtherStaticModel(id: '5', description: 'আর্দ্রতা বা তাপমাত্রা নিয়ন্ত্রণের অভাব'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListAluOrionPartFourSecond = [
  OtherStaticModel(id: '1', description: 'ভুল হ্যান্ডলিং'),
  OtherStaticModel(id: '2', description: 'উচ্চতা থেকে ফেলা'),
  OtherStaticModel(id: '3', description: 'যান্ত্রিক আঘাত'),
  OtherStaticModel(id: '4', description: 'শ্রমিকের অদক্ষতা'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListAluOrionPartFourThird = [
  OtherStaticModel(id: '1', description: 'অতিরিক্ত পানি ব্যবহার'),
  OtherStaticModel(id: '2', description: 'দীর্ঘ সময় ভিজিয়ে রাখা'),
  OtherStaticModel(id: '3', description: 'অপরিষ্কার পানি'),
  OtherStaticModel(id: '4', description: 'পচন বা ছত্রাক সংক্রমণ'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListAluOrionPartFourFourth = [
  OtherStaticModel(id: '1', description: 'অতিরিক্ত কাটা'),
  OtherStaticModel(id: '2', description: 'ভুল গ্রেডিং মানদণ্ড'),
  OtherStaticModel(id: '3', description: 'শ্রমিকের অসাবধানতা'),
  OtherStaticModel(id: '4', description: 'ধারালো যন্ত্রের অভাব'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListAluOrionPartFourFifth = [
  OtherStaticModel(id: '1', description: 'মেশিনের ত্রুটি'),
  OtherStaticModel(id: '2', description: 'ক্যালিব্রেশন সমস্যা'),
  OtherStaticModel(id: '3', description: 'বিদ্যুৎ বিভ্রাট'),
  OtherStaticModel(id: '4', description: 'অতিরিক্ত চাপ বা তাপ'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListAluOrionPartFourSixth = [
  OtherStaticModel(id: '1', description: 'ধীরগতির কুলিং'),
  OtherStaticModel(id: '2', description: 'পর্যাপ্ত কোল্ড স্টোরেজের অভাব'),
  OtherStaticModel(id: '3', description: 'তাপমাত্রা ওঠানামা'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListAluOrionPartFourSeventh = [
  OtherStaticModel(id: '1', description: 'নিম্নমানের প্যাকেট'),
  OtherStaticModel(id: '2', description: 'ভুল সিলিং'),
  OtherStaticModel(id: '3', description: 'বাতাস ঢুকে যাওয়া'),
  OtherStaticModel(id: '4', description: 'ওজন ভুল'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListAluOrionPartFourEighth = [
  OtherStaticModel(id: '1', description: 'প্যাকেট ছেঁড়া'),
  OtherStaticModel(id: '2', description: 'ভুল তথ্য'),
  OtherStaticModel(id: '3', description: 'বারবার হ্যান্ডলিং'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListAluOrionPartFourNinth = [
  OtherStaticModel(id: '1', description: 'সঠিক তাপমাত্রা/আর্দ্রতা না থাকা'),
  OtherStaticModel(id: '2', description: 'কীট-পতঙ্গ আক্রমণ'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListAluOrionPartFourTenth = [
  OtherStaticModel(id: '1', description: 'দীর্ঘদিন সংরক্ষণ'),
  OtherStaticModel(id: '2', description: 'গুদামের অপরিচ্ছন্নতা'),
  OtherStaticModel(id: '3', description: 'বায়ু চলাচলের অভাব'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListAluOrionPartFourEleventh = [
  OtherStaticModel(id: '1', description: 'অনুপযুক্ত যানবাহন'),
  OtherStaticModel(id: '2', description: 'প্যাকেট ক্ষতি'),
  OtherStaticModel(id: '3', description: 'অতিরিক্ত লোড'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListAluOrionPartFourTwelfth = [
  OtherStaticModel(id: '1', description: 'চাহিদা কম'),
  OtherStaticModel(id: '2', description: 'বাজারমূল্য কমে যাওয়া'),
  OtherStaticModel(id: '3', description: 'বিক্রি না হওয়া'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListAluOrionPartFourThirteenth = [
  OtherStaticModel(id: '1', description: 'সঠিক FIFO অনুসরণ না করা'),
  OtherStaticModel(id: '2', description: 'দুর্বল স্টক ব্যবস্থাপনা'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListAluOrionPartFourFourteenth = [
  OtherStaticModel(id: '1', description: 'তাপদাহ'),
  OtherStaticModel(id: '2', description: 'অতিবৃষ্টি'),
  OtherStaticModel(id: '3', description: 'বিদ্যুৎ সংকট'),
  OtherStaticModel(id: '4', description: 'ধর্মঘট/লজিস্টিক সমস্যা'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListAluOrionPartFourFifteenth = [OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)')];

List<OtherStaticModel> lossReasonListCowHenPartOneFirst = [
  OtherStaticModel(id: '1', description: 'বিদ্যুৎ বিভ্রাট'),
  OtherStaticModel(id: '2', description: 'অতিরিক্ত গরম বা ঠান্ডা'),
  OtherStaticModel(id: '3', description: 'স্বাস্থ্য ব্যবস্থাপনায় ঘাটতি'),
  OtherStaticModel(id: '4', description: 'একসাথে একাধিক মুরগি/গরুর মৃত্যু'),
  OtherStaticModel(id: '5', description: 'রোগ ছড়িয়ে পড়া'),
  OtherStaticModel(id: '6', description: 'শেডে বায়ু চলাচল কম'),
  OtherStaticModel(id: '7', description: 'পানির সমস্যা'),
  OtherStaticModel(id: '8', description: 'অপর্যাপ্ত পরিচর্যা'),
  OtherStaticModel(id: '9', description: 'একাধিক মুরগি/গরুর একসাথে অসুস্থতা'),
  OtherStaticModel(id: '10', description: 'স্ট্রোকজনিত মৃত্যু'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListCowHenPartOneSecond = [
  OtherStaticModel(id: '1', description: 'ডিহাইড্রেশন'),
  OtherStaticModel(id: '2', description: 'ওজন কমে যাওয়া'),
  OtherStaticModel(id: '3', description: 'শ্বাসকষ্ট বা হিট স্ট্রেস'),
  OtherStaticModel(id: '4', description: 'মৃত্যু/আকস্মিক মারা যাওয়া'),
  OtherStaticModel(id: '5', description: 'পরিবহনের অপেক্ষায় খাঁচায়/খামারে রাখা'),
  OtherStaticModel(id: '6', description: 'পানি ও খাদ্যের সীমাবদ্ধতা'),
  OtherStaticModel(id: '7', description: 'মাংসের গুণগত মান হ্রাস'),
  OtherStaticModel(id: '8', description: 'তাপমাত্রা ও আর্দ্রতা নিয়ন্ত্রণের অভাব'),
  OtherStaticModel(id: '9', description: 'কীট-পতঙ্গ আক্রমণ'),
  OtherStaticModel(id: '10', description: 'দীর্ঘদিন সংরক্ষণ'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListCowHenPartOneThird = [
  OtherStaticModel(id: '1', description: 'ভুল বা অতিরিক্ত বাছাই'),
  OtherStaticModel(id: '2', description: 'মানদণ্ড স্পষ্ট না থাকা'),
  OtherStaticModel(id: '3', description: 'শ্রমিকের অদক্ষতা'),
  OtherStaticModel(id: '4', description: 'তাড়াহুড়ার কারণে আঘাতপ্রাপ্ত হয়ে ডানা/পা ভাঙা'),
  OtherStaticModel(id: '5', description: 'দুর্বল মুরগি বিক্রয় অযোগ্য হওয়া'),
  OtherStaticModel(id: '6', description: 'ওজন বা সাইজ অনুযায়ী আলাদা করা'),
  OtherStaticModel(id: '7', description: 'শিং/চামড়া ক্ষতিগ্রস্ত হওয়া'),
  OtherStaticModel(id: '8', description: 'স্ট্রেস ও দুর্বলতা'),
  OtherStaticModel(id: '9', description: 'সাময়িক খোঁড়ানো'),
  OtherStaticModel(id: '10', description: 'কাঙ্ক্ষিত গ্রেড অতিক্রম করা'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListCowHenPartOneFourth = [
  OtherStaticModel(id: '1', description: 'ভুল পদ্ধতিতে পরিমাপ'),
  OtherStaticModel(id: '2', description: 'হাত বদল'),
  OtherStaticModel(id: '3', description: 'আঘাত জনিত ক্ষতি'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListCowHenPartOneFifth = [
  OtherStaticModel(id: '1', description: 'অনুপযুক্ত যানবাহন'),
  OtherStaticModel(id: '2', description: 'দীর্ঘ পরিবহন সময়'),
  OtherStaticModel(id: '3', description: 'রাস্তার ঝাঁকুনি'),
  OtherStaticModel(id: '4', description: 'মৃত্যু/আকস্মিক মারা যাওয়া'),
  OtherStaticModel(id: '5', description: 'তাপমাত্রা বৃদ্ধি'),
  OtherStaticModel(id: '6', description: 'পরিবহন বা লোডিং শিডিউল বিলম্ব'),
  OtherStaticModel(id: '7', description: 'দেরিতে হস্তান্তর'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListCowHenPartOneSixth = [
  OtherStaticModel(id: '1', description: 'আঘাত জনিত ক্ষতি'),
  OtherStaticModel(id: '2', description: 'উচ্চতা থেকে ফেলা'),
  OtherStaticModel(id: '3', description: 'অতিরিক্ত চাপ'),
  OtherStaticModel(id: '4', description: 'অনুপযুক্ত যন্ত্রপাতি'),
  OtherStaticModel(id: '5', description: 'শ্রমিকের অদক্ষতা'),
  OtherStaticModel(id: '6', description: 'বারবার হ্যান্ডলিং'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListCowHenPartOneSeventh = [OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)')];

List<OtherStaticModel> lossReasonListCowHenPartTwoFirst = [
  OtherStaticModel(id: '1', description: 'অসুস্থ পশু ক্রয় করা'),
  OtherStaticModel(id: '2', description: 'দুর্বল/ আঘাতপ্রাপ্ত/কম ওজনের পশু ক্রয় করা'),
  OtherStaticModel(id: '3', description: 'দ্রুত বাছাই ও তাড়াহুড়ো'),
  OtherStaticModel(id: '4', description: 'পশুর প্রকৃত স্বাস্থ্য অবস্থা যাচাইয়ের সীমাবদ্ধতা'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListCowHenPartTwoSecond = [
  OtherStaticModel(id: '1', description: 'ক্রেতার চাহিদা অনুযায়ী আলাদা করা'),
  OtherStaticModel(id: '2', description: 'ভুল বা অতিরিক্ত বাছাই'),
  OtherStaticModel(id: '3', description: 'শারীরিক আঘাত'),
  OtherStaticModel(id: '4', description: 'দুর্বল পশু বিক্রয় অযোগ্য হওয়া'),
  OtherStaticModel(id: '5', description: 'অতিরিক্ত স্ট্রেস'),
  OtherStaticModel(id: '6', description: 'শ্রমিকের অদক্ষতা'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListCowHenPartTwoThird = [
  OtherStaticModel(id: '1', description: 'ভুল পদ্ধতিতে পরিমাপ'),
  OtherStaticModel(id: '2', description: 'হাত বদল'),
  OtherStaticModel(id: '3', description: 'আঘাত জনিত ক্ষতি'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListCowHenPartTwoFourth = [
  OtherStaticModel(id: '1', description: 'আঘাত (ডানা/পা ভাঙা, শরীরের ক্ষত)'),
  OtherStaticModel(id: '2', description: 'স্ট্রেস'),
  OtherStaticModel(id: '3', description: 'হঠাৎ মৃত্যু (বিশেষ করে মুরগি)'),
  OtherStaticModel(id: '4', description: 'অনুপযুক্ত ধরাধরি'),
  OtherStaticModel(id: '5', description: 'অতিরিক্ত চাপ ও ঠাসাঠাসি'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListCowHenPartTwoFifth = [
  OtherStaticModel(id: '1', description: 'বিক্রয়ের অপেক্ষা'),
  OtherStaticModel(id: '2', description: 'বাজারদর অনুকূলে না থাকা'),
  OtherStaticModel(id: '3', description: 'খাদ্য ও পানির ঘাটতি'),
  OtherStaticModel(id: '4', description: 'রোগ সংক্রমণ'),
  OtherStaticModel(id: '5', description: 'ওজন কমে যাওয়া'),
  OtherStaticModel(id: '6', description: 'স্ট্রেস'),
  OtherStaticModel(id: '7', description: 'দর কষাকষি'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListCowHenPartTwoSixth = [
  OtherStaticModel(id: '1', description: 'তাপমাত্রা ও আর্দ্রতা নিয়ন্ত্রণের অভাব'),
  OtherStaticModel(id: '2', description: 'কীট-পতঙ্গ আক্রমণ'),
  OtherStaticModel(id: '3', description: 'দীর্ঘদিন সংরক্ষণ'),
  OtherStaticModel(id: '4', description: 'বিদ্যুৎ বিভ্রাট'),
  OtherStaticModel(id: '5', description: 'প্রাকৃতিক দুর্যোগ'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListCowHenPartTwoSeventh = [
  OtherStaticModel(id: '1', description: 'অনুপযুক্ত যানবাহন'),
  OtherStaticModel(id: '2', description: 'বিলম্বিত পরিবহন'),
  OtherStaticModel(id: '3', description: 'অতিরিক্ত লোড'),
  OtherStaticModel(id: '4', description: 'রাস্তার ঝাঁকুনি'),
  OtherStaticModel(id: '5', description: 'দীর্ঘ পরিবহন সময়'),
  OtherStaticModel(id: '6', description: 'আবহাওয়ার প্রভাব (অতিরিক্ত গরম/ঠান্ডা)'),
  OtherStaticModel(id: '7', description: 'তাপমাত্রা নিয়ন্ত্রণের অভাব'),
  OtherStaticModel(id: '8', description: 'অপর্যাপ্ত বায়ু চলাচল'),
  OtherStaticModel(id: '9', description: 'ওজন হ্রাস'),
  OtherStaticModel(id: '10', description: 'ডিহাইড্রেশন'),
  OtherStaticModel(id: '11', description: 'আঘাত (ডানা/পা ভাঙা, শরীরের ক্ষত)'),
  OtherStaticModel(id: '12', description: 'অসুস্থতা বৃদ্ধি'),
  OtherStaticModel(id: '13', description: 'একাধিকবার লোডিং'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListCowHenPartTwoEighth = [
  OtherStaticModel(id: '1', description: 'আঘাত জনিত ক্ষতি'),
  OtherStaticModel(id: '2', description: 'উচ্চতা থেকে ফেলা'),
  OtherStaticModel(id: '3', description: 'অতিরিক্ত চাপ'),
  OtherStaticModel(id: '4', description: 'অনুপযুক্ত যন্ত্রপাতি'),
  OtherStaticModel(id: '5', description: 'শ্রমিকের অদক্ষতা'),
  OtherStaticModel(id: '6', description: 'বারবার হ্যান্ডলিং'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListCowHenPartTwoNinth = [
  OtherStaticModel(id: '1', description: 'বারবার হ্যান্ডলিং'),
  OtherStaticModel(id: '2', description: 'দেরিতে হস্তান্তর'),
  OtherStaticModel(id: '3', description: 'দায়বদ্ধতার অভাব'),
  OtherStaticModel(id: '4', description: 'তথ্য ঘাটতি'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListCowHenPartTwoTenth = [OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)')];

List<OtherStaticModel> lossReasonListCowHenPartThreeFirst = [
  OtherStaticModel(id: '1', description: 'নিম্নমানের বা আংশিক নষ্ট মাংস গ্রহণ'),
  OtherStaticModel(id: '2', description: 'পরিবহন বিলম্বে কোল্ড চেইন ভেঙে যাওয়া'),
  OtherStaticModel(id: '3', description: 'তাপমাত্রা মানদণ্ডের বাইরে থাকা'),
  OtherStaticModel(id: '4', description: 'মেয়াদোত্তীর্ণ বা সঠিকভাবে লেবেলবিহীন মাংস'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListCowHenPartThreeSecond = [
  OtherStaticModel(id: '1', description: 'আঘাত (ডানা/পা ভাঙা, শরীরের ক্ষত)'),
  OtherStaticModel(id: '2', description: 'স্ট্রেস'),
  OtherStaticModel(id: '3', description: 'হঠাৎ মৃত্যু (বিশেষ করে মুরগি)'),
  OtherStaticModel(id: '4', description: 'অনুপযুক্ত ধরাধরি'),
  OtherStaticModel(id: '5', description: 'অতিরিক্ত চাপ ও ঠাসাঠাসি'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListCowHenPartThreeThird = [
  OtherStaticModel(id: '1', description: 'অদক্ষ কর্মী'),
  OtherStaticModel(id: '2', description: 'অনুপযুক্ত বা ত্রুটিপূর্ণ কাটিং'),
  OtherStaticModel(id: '3', description: 'তাড়াহুড়া বা অসতর্কতায় হাড়ের সাথে মাংস লেগে ফেলে দেওয়া'),
  OtherStaticModel(id: '4', description: 'ভোঁতা ছুরি বা করাত ব্যবহার'),
  OtherStaticModel(id: '5', description: 'অপরিচ্ছন্ন কাটিং টেবিল বা ফ্লোর'),
  OtherStaticModel(id: '6', description: 'ব্যাকটেরিয়ার সংস্পর্শে'),
  OtherStaticModel(id: '7', description: 'দীর্ঘ সময় খোলা অবস্থায় রাখা'),
  OtherStaticModel(id: '8', description: 'দ্রুত চিলিং/ফ্রিজিং না করার ফলে গুণগত মান নষ্ট হওয়া'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListCowHenPartThreeFourth = [
  OtherStaticModel(id: '1', description: 'হাড়, অতিরিক্ত চর্বি, রক্ত জমাট অংশ কেটে বাদ দেওয়া'),
  OtherStaticModel(id: '2', description: 'মানদণ্ডের বাইরে থাকা অংশ বাতিল'),
  OtherStaticModel(id: '3', description: 'অদক্ষ শ্রমিকের কারণে অতিরিক্ত ট্রিমিং (yield loss)'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListCowHenPartThreeFifth = [
  OtherStaticModel(id: '1', description: 'অপরিষ্কার/দূষিত পানি ব্যবহার'),
  OtherStaticModel(id: '2', description: 'দীর্ঘ সময় ধোয়ার ফলে টেক্সচার ও পুষ্টিমান নষ্ট'),
  OtherStaticModel(id: '3', description: 'পানি নিষ্কাশন সঠিক না হওয়ায় দূষণ'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListCowHenPartThreeSixth = [
  OtherStaticModel(id: '1', description: 'মেশিনে আটকে থাকা'),
  OtherStaticModel(id: '2', description: 'অতিরিক্ত তাপ'),
  OtherStaticModel(id: '3', description: 'ভুল রেসিপি বা উপাদানের অনুপাত'),
  OtherStaticModel(id: '4', description: 'ব্যাচ/কোটিং অসম হলে পণ্য বাতিল'),
  OtherStaticModel(id: '5', description: 'মশলা/অ্যাডিটিভের মানগত ত্রুটি'),
  OtherStaticModel(id: '6', description: 'ভেঙে যাওয়া বা ওজন মানদণ্ড পূরণ না করা পিস বাতিল'),
  OtherStaticModel(id: '7', description: 'মেশিন ক্যালিব্রেশন সমস্যা'),
  OtherStaticModel(id: '8', description: 'অতিরিক্ত ব্রেডিং ঝরে পড়া'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListCowHenPartThreeSeventh = [
  OtherStaticModel(id: '1', description: 'সিলিং ত্রুটি (leakage)'),
  OtherStaticModel(id: '2', description: 'ভুল লেবেল (তারিখ/ব্যাচ/উপাদান)'),
  OtherStaticModel(id: '3', description: 'প্যাকেট ক্ষতিগ্রস্ত হওয়া'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListCowHenPartThreeEighth = [
  OtherStaticModel(id: '1', description: 'তাপমাত্রা ওঠানামাৎ'),
  OtherStaticModel(id: '2', description: 'FIFO নীতি না মানা'),
  OtherStaticModel(id: '3', description: 'দীর্ঘ সময় সংরক্ষণে মানহানি'),
  OtherStaticModel(id: '4', description: 'বিদ্যুৎ বিভ্রাট'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListCowHenPartThreeNinth = [
  OtherStaticModel(id: '1', description: 'রেফ্রিজারেটেড ভেহিকেল না থাকা'),
  OtherStaticModel(id: '2', description: 'পরিবহন বিলম্ব'),
  OtherStaticModel(id: '3', description: 'লোডিং–আনলোডিংয়ে তাপমাত্রা বৃদ্ধি'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListCowHenPartThreeTenth = [
  OtherStaticModel(id: '1', description: 'বাজার চাহিদার তুলনায় অতিরিক্ত উৎপাদন'),
  OtherStaticModel(id: '2', description: 'মেয়াদ শেষে অবিক্রীত পণ্য'),
  OtherStaticModel(id: '3', description: 'রিটেইলার রিটার্ন'),
  OtherStaticModel(id: '4', description: 'মূল্য কমে যাওয়া (economic loss)'),
  OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)'),
];

List<OtherStaticModel> lossReasonListCowHenPartThreeEleventh = [OtherStaticModel(id: '96', description: 'অন্যান্য ক্ষতি (উল্লেখ করুন)')];
