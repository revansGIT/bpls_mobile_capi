import 'package:bpls_mobile/main.dart';

class OtherStaticModel {
  final String id;
  final String description;

  OtherStaticModel({required this.id, required this.description});

  Map<String, dynamic> toJson() {
    return {'id': id, 'description': description};
  }

  OtherStaticModel.fromJson(Map<String, dynamic> json)
      : id = json['id'].toString(),
        description = json['description'].toString();

  @override
  bool operator ==(Object other) => other is OtherStaticModel && id == other.id;

  @override
  int get hashCode => id.hashCode;
}

// ==========================================
// ১. মডিউল-০১ গণনা এলাকার পরিচিতি (খানা ও প্রতিষ্ঠান)
// ==========================================

List<OtherStaticModel> institutionTypeList = [
  OtherStaticModel(id: '1', description: 'রেস্তোরাঁ/রেস্টুরেন্ট'),
  OtherStaticModel(id: '2', description: 'হোটেল'),
  OtherStaticModel(id: '3', description: 'কমিউনিটি সেন্টার'),
  OtherStaticModel(id: '4', description: 'হাসপাতাল'),
  OtherStaticModel(id: '5', description: 'সুপারশপ'),
  OtherStaticModel(id: '6', description: 'খুচরা বিক্রেতা'),
];

// ==========================================
// ২. মডিউল-০২ (খানার সাধারণ তথ্য)
// ==========================================

List<OtherStaticModel> houseTypeList = [
  OtherStaticModel(id: '1', description: 'পাকা'),
  OtherStaticModel(id: '2', description: 'আধাপাঁকা'),
  OtherStaticModel(id: '3', description: 'কাঁচা'),
  OtherStaticModel(id: '4', description: 'ঝুপরি'),
];

List<OtherStaticModel> kitchenConditionList = [
  OtherStaticModel(id: '1', description: 'ঘরের মধ্যে (একই ঘর)'),
  OtherStaticModel(id: '2', description: 'ঘরের মধ্যে (আলাদা করা)'),
  OtherStaticModel(id: '3', description: 'পৃথক রান্না ঘর'),
  OtherStaticModel(id: '96', description: 'অন্যান্য উল্লেখ করুন'),
];

List<OtherStaticModel> cookingFuelList = [
  OtherStaticModel(id: '1', description: 'খড়/পাতা/তুষ/ভূষি'),
  OtherStaticModel(id: '2', description: 'কাঠ/বাঁশ/পাটখড়ি/লাকড়ি'),
  OtherStaticModel(id: '3', description: 'চারকোল/ গোবর/ঘুটে/বোড়ে/ঘষি'),
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
  OtherStaticModel(id: '2', description: 'টিউবওয়েল (গভীর/অগভীর/ সাবমার্সিবল)'),
  OtherStaticModel(id: '3', description: 'বোতলজাত পানি/পানির জার'),
  OtherStaticModel(id: '4', description: 'সুরক্ষিত: কূপ/কুয়া/ইদারা/রিংওয়েল'),
  OtherStaticModel(id: '5', description: 'অরক্ষিত: কুপ/কুয়া/ইদারা/রিংওয়েল'),
  OtherStaticModel(id: '6', description: 'পুকুর/নদী/খাল/লেক/ঝিরি'),
  OtherStaticModel(id: '7', description: 'ঝরনা/ছড়া'),
  OtherStaticModel(id: '8', description: 'সংগৃহিত বৃষ্টির পানি'),
  OtherStaticModel(id: '9', description: 'ওয়াটার কিওস্ক: এটিএম কার্ড দিয়ে পানি সংগ্রহ'),
  OtherStaticModel(id: '96', description: 'অন্যান্য (উল্লেখ করুন...)'),
];

List<OtherStaticModel> toiletFacilityList = [
  OtherStaticModel(id: '1', description: 'ফ্লাশ করে পাইপের মাধ্যমে সুয়ারেজ সিস্টেমে অপসারণ'),
  OtherStaticModel(id: '2', description: 'ফ্লাশ করে নিরাপদ ট্যাংকে ধারণ'),
  OtherStaticModel(id: '3', description: 'ফ্লাশ করে উন্মুক্ত নালায় অপসারণ'),
  OtherStaticModel(id: '4', description: 'স্ল্যাবসহ পিট ল্যাট্রিন'),
  OtherStaticModel(id: '5', description: 'স্ল্যাবছাড়া পিট/উন্মুক্ত পিট ল্যাট্রিন'),
  OtherStaticModel(id: '6', description: 'কাঁচা/খোলা/ঝুলন্ত ল্যাট্রিন (স্থায়ী/অস্থায়ী)'),
  OtherStaticModel(id: '96', description: 'অন্যান্য (উল্লেখ করুন...)'),
];

List<OtherStaticModel> relationToHeadList = [
  OtherStaticModel(id: '1', description: 'খানা প্রধান'),
  OtherStaticModel(id: '2', description: 'স্ত্রী/স্বামী'),
  OtherStaticModel(id: '3', description: 'সন্তান'),
  OtherStaticModel(id: '4', description: 'মা/বাবা'),
  OtherStaticModel(id: '5', description: 'ভাইবোন/ অন্যান্য'),
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
  OtherStaticModel(id: '25', description: 'প্লে/ নার্সারি/কেজি/ প্রাক প্রাথমিক শ্রেণির শিক্ষার্থী'),
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
  OtherStaticModel(id: '10', description: 'এসএসসি/দাখিল/ও. লেভেল/সমমান পাশ'),
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

List<OtherStaticModel> yesNoList = [
  OtherStaticModel(id: '1', description: 'হ্যাঁ'),
  OtherStaticModel(id: '2', description: 'না'),
];

List<OtherStaticModel> mainIncomeSourceList = [
  OtherStaticModel(id: '1', description: 'কৃষি'),
  OtherStaticModel(id: '2', description: 'মজুরি'),
  OtherStaticModel(id: '3', description: 'চাকরি'),
  OtherStaticModel(id: '4', description: 'ব্যবসা'),
  OtherStaticModel(id: '5', description: 'প্রবাসী আয়'),
  OtherStaticModel(id: '6', description: 'প্রযোজ্য নয়'),
  OtherStaticModel(id: '96', description: 'অন্যান্য (উল্লেখ করুন...)'),
];

List<OtherStaticModel> institutionDurabilityList = [
  OtherStaticModel(id: '1', description: 'স্থায়ী'),
  OtherStaticModel(id: '2', description: 'অস্থায়ী'),
  OtherStaticModel(id: '3', description: 'ভ্রাম্যমান'),
];

List<OtherStaticModel> institutionOwnershipList = [
  OtherStaticModel(id: '1', description: 'একক/ব্যক্তিগত'),
  OtherStaticModel(id: '2', description: 'অংশীদারী'),
  OtherStaticModel(id: '3', description: 'প্রাইভেট লিমিটেড'),
  OtherStaticModel(id: '4', description: 'সরকারী'),
  OtherStaticModel(id: '5', description: 'স্বায়ত্ত্বশাসিত'),
  OtherStaticModel(id: '6', description: 'অন্যান্য'),
];

// ==========================================
// ৩. মডিউল-০৩ (খানায় খাদ্যের অপচয় সংক্রান্ত)
// ==========================================

List<OtherStaticModel> foodPurchaseSourceList = [
  OtherStaticModel(id: '1', description: 'স্থানীয় খুচরা বাজার'),
  OtherStaticModel(id: '2', description: 'স্থানীয় পাইকারি বাজার'),
  OtherStaticModel(id: '3', description: 'সুপার মার্কেট/শপ'),
  OtherStaticModel(id: '4', description: 'কৃষক হতে সরাসরি ক্রয় (খামার থেকে)'),
  OtherStaticModel(id: '5', description: 'অনলাইন/ভ্রাম্যমাণ'),
  OtherStaticModel(id: '96', description: 'অন্যান্য (উল্লেখ করুন)'),
];

List<OtherStaticModel> foodPurchaseFrequencyList = [
  OtherStaticModel(id: '1', description: 'সপ্তাহে ১-২ বার'),
  OtherStaticModel(id: '2', description: 'সপ্তাহে ৩-৪ বার'),
  OtherStaticModel(id: '3', description: 'সপ্তাহে ৫-৬ বার'),
  OtherStaticModel(id: '4', description: 'প্রতিদিন (সপ্তাহে ৭ দিন)'),
  OtherStaticModel(id: '5', description: 'মাসে ১-২ বার'),
  OtherStaticModel(id: '96', description: 'অন্যান্য (উল্লেখ করুন)'),
];

List<OtherStaticModel> expenditureSourceList = [
  OtherStaticModel(id: '1', description: 'খাদ্য'),
  OtherStaticModel(id: '2', description: 'কৃষিজ উৎপাদন ব্যয় (সার/বীজ/কিটনাশক/জমি চাষ/কৃষি শ্রমিক মজুরি)'),
  OtherStaticModel(id: '3', description: 'বস্ত্র'),
  OtherStaticModel(id: '4', description: 'বাসস্থান সংক্রান্ত'),
  OtherStaticModel(id: '5', description: 'শিক্ষা'),
  OtherStaticModel(id: '6', description: 'চিকিৎসা'),
  OtherStaticModel(id: '7', description: 'যোগাযোগ/পরিবহন'),
  OtherStaticModel(id: '8', description: 'সামাজিক অনুষ্ঠান/বিনোদন খাতে ব্যয়'),
  OtherStaticModel(id: '96', description: 'অন্যান্য (উল্লেখ করুন)'),
];

List<OtherStaticModel> incomeSourceList = [
  OtherStaticModel(id: '1', description: 'মজুরি ও বেতনভিত্তিক আয়'),
  OtherStaticModel(id: '2', description: 'কৃষিজ আয় (কৃষি পণ্য/প্রাণি/মৎস্য এবং বিভিন্ন উপজাত থেকে আয়)'),
  OtherStaticModel(id: '3', description: 'অকৃষি স্ব-কর্মসংস্থান / ব্যবসা'),
  OtherStaticModel(id: '4', description: 'শিল্প ও উৎপাদন খাতের আয়'),
  OtherStaticModel(id: '5', description: 'সেবা খাত থেকে আয়'),
  OtherStaticModel(id: '6', description: 'ভাড়া ও সম্পত্তি থেকে আয়'),
  OtherStaticModel(id: '7', description: 'রেমিট্যান্স ও স্থানান্তর আয়'),
  OtherStaticModel(id: '96', description: 'অন্যান্য (উল্লেখ করুন)'),
];

List<OtherStaticModel> specialOfferList = [
  OtherStaticModel(id: '1', description: 'ছাড়কৃত দামে ক্রয়'),
  OtherStaticModel(id: '2', description: 'অর্ধেক দামে ক্রয়'),
  OtherStaticModel(id: '3', description: 'একটি কিনলে একটি ফ্রী'),
  OtherStaticModel(id: '4', description: 'কিনলে অন্য কিছু ফ্রী'),
  OtherStaticModel(id: '96', description: 'অন্যান্য (উল্লেখ করুন)'),
];

List<OtherStaticModel> expiryDateMeaningList = [
  OtherStaticModel(id: '1', description: 'খাবারটি নির্ধারিত তারিখের মধ্যে খেতে হবে'),
  OtherStaticModel(id: '2', description: 'নির্ধারিত তারিখের পর খাদ্য গ্রহণ নিরাপদ যতদিন পর্যন্ত খাদ্যগুলোর মানের অবনতি হয় বা বিনষ্ট হয়'),
  OtherStaticModel(id: '3', description: 'নির্ধারিত তারিখের পর খাদ্য দ্রব্য ফেলে দিতে হবে'),
  OtherStaticModel(id: '96', description: 'অন্যান্য (উল্লেখ করুন)'),
];

List<OtherStaticModel> foodHabitFrequencyList = [
  OtherStaticModel(id: '1', description: 'সব সময় খাওয়া হয়'),
  OtherStaticModel(id: '2', description: 'একবারের কম খাওয়া হয়'),
  OtherStaticModel(id: '3', description: '১-২ বার খাওয়া হয়'),
  OtherStaticModel(id: '4', description: '৩-৬ বার খাওয়া হয়'),
  OtherStaticModel(id: '5', description: '৭-১০ বার খাওয়া হয়'),
  OtherStaticModel(id: '6', description: '১০ বারের বেশি খাওয়া হয়'),
  OtherStaticModel(id: '7', description: 'কখনো খাওয়া হয় না'),
];

List<OtherStaticModel> foodHabitTypeList = [
  OtherStaticModel(id: '1', description: 'প্রয়োজনীয় খাদ্য উপাদান দিয়ে প্রতিদিনের প্রধান খাবার প্রতিদিন রান্না করে'),
  OtherStaticModel(id: '2', description: 'আগের দিনের রান্না করা প্রধান খাবারের উদ্বৃত্ত অংশ থেকে'),
  OtherStaticModel(id: '3', description: 'প্রধান খাবার রেস্টুরেন্ট থেকে আনিয়ে'),
  OtherStaticModel(id: '4', description: 'দোকান থেকে কেনা খাবার; যেমন: বিভিন্ন ধরনের ফ্রোজেন ফুড'),
  OtherStaticModel(id: '96', description: 'অন্যান্য (উল্লেখ করুন)'),
];

List<OtherStaticModel> wasteFrequencyList = [
  OtherStaticModel(id: '1', description: 'প্রতিদিন'),
  OtherStaticModel(id: '2', description: 'সপ্তাহে ১-২ বার'),
  OtherStaticModel(id: '3', description: 'সপ্তাহে ৩-৪ বার'),
  OtherStaticModel(id: '4', description: 'কখনোই না'),
];

List<OtherStaticModel> rawFoodGroupList = [
  OtherStaticModel(id: '1', description: 'তরল দুধ ও দুগ্ধজাত খাদ্য (দুধ, দই, পনির, ছানা, পুডিং, শেক ইত্যাদি)'),
  OtherStaticModel(id: '2', description: 'তেল ও চর্বি জাতীয় খাদ্য (বিভিন্ন ধরনের ভোজ্য তেল, ঘি, মাখন, মাছের তেল ইত্যাদি)'),
  OtherStaticModel(id: '3', description: 'ঠান্ডা জাতীয় খাদ্য (বিভিন্ন ধরনের আইসক্রিম, শরবত ইত্যাদি)'),
  OtherStaticModel(id: '4', description: 'ফল ও শাকসবজি জাতীয় খাদ্য (তাজা এবং প্রক্রিয়াজাতকৃত ফল-মূল ও শাকসবজি ইত্যাদি)'),
  OtherStaticModel(id: '5', description: 'কনফেকশনারি আইটেম (কোকো প্রোডাক্ট, চকোলেট, ক্যান্ডি, চুইংগাম, ডেকোরেশন টপিং এর জন্য ব্যবহৃত প্রোডাক্ট)'),
  OtherStaticModel(id: '6', description: 'দানাদার খাদ্য (চাল, গম, আটা, বিভিন্ন ধরনের ডাল, ফ্রেশ নাট ইত্যাদি)'),
  OtherStaticModel(id: '7', description: 'বেকারি জাতীয় খাদ্য (কেক, পাউরুটি, কুকিজ, ডোনাটস ইত্যাদি)'),
  OtherStaticModel(id: '8', description: 'মাংস ও মাংসজাত খাদ্য (কাঁচা ও হিমায়িত ব্রয়লার চিকেন মাংস, হিমায়িত মাংস, লাল মাংস, বিভিন্ন ধরনের মাংস)'),
  OtherStaticModel(id: '9', description: 'মৎস্য ও মৎস্যজাত খাদ্য (কাঁচা মাছ, হিমায়িত মাছ, শুটকি মাছ, মাছের তৈরি খাদ্য ও ইত্যাদি)'),
  OtherStaticModel(id: '10', description: 'ডিম (ডিম ও ডিম থেকে তৈরী খাবার)'),
  OtherStaticModel(id: '11', description: 'মধু ও মিষ্টান্ন জাতীয় খাদ্য (মধু, চিনি, সিরাপ, গুড়, মিষ্টি)'),
  OtherStaticModel(id: '12', description: 'সস, স্যুপ, সালাদ এবং মশলাজাতীয় খাদ্য (লবণ, স্যুপ, রেডি ও মিক্সড স্যুপ, সস, মিক্সড সস, মশলা, হার্ব, ভিনেগার, সালাদ, ঈস্ট প্রোডাক্ট)'),
  OtherStaticModel(id: '13', description: 'বিশেষ পুষ্টির জন্য তৈরিকৃত খাদ্য (শিশুখাদ্য, রোগীর পথ্য হিসেবে ব্যবহৃত খাদ্য, পুষ্টির ঘাটতিজনিত কারণে গ্রহণকৃত বিশেষ খাদ্য ইত্যাদি)'),
  OtherStaticModel(id: '14', description: 'পানীয় (চা, কফি, বিভিন্ন ধরনের ফ্রুট জুস, ভেজিটেবল জুস, হারবাল টি, গ্রিণ টি ইত্যাদি)'),
  OtherStaticModel(id: '15', description: 'প্রস্তুতকৃত স্ন্যাকস জাতীয় খাবার (বিভিন্ন ধরনের নাট, কোটেড বা আবরণযুক্ত নাট এবং নাট মিক্সড; প্রস্তুতকৃত স্ন্যাকস)'),
  OtherStaticModel(id: '96', description: 'অন্যান্য (উল্লেখ করুন)'),
];

List<OtherStaticModel> cookedFoodGroupList = [
  OtherStaticModel(id: '1', description: 'খাদ্য শস্য (সাদাভাত, খিচুড়ি, বিরিয়ানি ইত্যাদি)'),
  OtherStaticModel(id: '2', description: 'ডাল (তরল, ভাজি, ভর্তা)'),
  OtherStaticModel(id: '3', description: 'ফল (ফল থেকে প্রস্তুতকৃত খাবার, কাস্টার্ড, আচার, জেলি, ফালুদা)'),
  OtherStaticModel(id: '4', description: 'শাক-সবজি (সকল প্রকার শাক ও সকল প্রকার সবজি)'),
  OtherStaticModel(id: '5', description: 'মূল এবং কন্দ (আলু, ওল ও কচুর মুখী)'),
  OtherStaticModel(id: '6', description: 'মাছ ও মাছের পণ্য (কার্প মাছ, ছোট মাছ, সামুদ্রিক মাছ, শুটকি মাছ, ও অন্যান্য মাছ)'),
  OtherStaticModel(id: '7', description: 'মাংস এবং মাংস পণ্য (গরু/মহিষ/ছাগলের মাংস, হিমায়িত মাংস, হাঁস/মুরগির মাংস ও অন্যান্য মাংস)'),
  OtherStaticModel(id: '8', description: 'দুধ ও দুগ্ধজাত দ্রব্য (দুধ, মাঠা, দই, বোরহানি ও অন্যান্য উল্লেখ করুন)'),
  OtherStaticModel(id: '9', description: 'ডিম এবং ডিম পণ্য (অমলেট ও তরকারি)'),
  OtherStaticModel(id: '10', description: 'মিষ্টি (সকল প্রকার মিষ্টি)'),
  OtherStaticModel(id: '11', description: 'সালাদ (সকল প্রকার সালাদ)'),
  OtherStaticModel(id: '96', description: 'অন্যান্য (উল্লেখ করুন)'),
];

List<OtherStaticModel> surplusFoodActionList = [
  OtherStaticModel(id: '1', description: 'ময়লার ঝুড়ি/গর্তে ফেলে দেই'),
  OtherStaticModel(id: '2', description: 'দান করে দেই'),
  OtherStaticModel(id: '3', description: 'কমপোস্ট তৈরি করি'),
  OtherStaticModel(id: '4', description: 'পশুখাদ্য হিসেবে ব্যবহার করি'),
  OtherStaticModel(id: '5', description: 'মাটির নিচে পুঁতে ফেলা'),
  OtherStaticModel(id: '96', description: 'অন্যান্য (উল্লেখ করুন)'),
];

List<OtherStaticModel> householdWasteReasonList = [
  OtherStaticModel(id: '1', description: 'খাদ্য মেয়াদোত্তীর্ণ হয়ে গেলে'),
  OtherStaticModel(id: '2', description: 'অতিরিক্ত খাদ্য ক্রয়'),
  OtherStaticModel(id: '3', description: 'অতিরিক্ত খাদ্য রান্না করা'),
  OtherStaticModel(id: '4', description: 'খাবার দেখতে ভালো/ পছন্দ না হলে'),
  OtherStaticModel(id: '5', description: 'খাদ্যের ভালো গন্ধ ও স্বাদ না থাকলে/ রান্নায় দুর্বল দক্ষতা'),
  OtherStaticModel(id: '6', description: 'ফ্রিজে দীর্ঘ সময়ের জন্য সংরক্ষিত থাকলে'),
  OtherStaticModel(id: '7', description: 'ভুল খাবার ক্রয় পরিকল্পনা'),
  OtherStaticModel(id: '8', description: 'সঠিকভাবে খাদ্যের প্যাকেজিং করা না হলে/লেবেলিং-এ সন্দেহের উদ্রেক হলে'),
  OtherStaticModel(id: '9', description: 'খাদ্যে ছত্রাক (আবরণ) জমে গেলে'),
  OtherStaticModel(id: '10', description: 'ভুল পদ্ধতিতে সংরক্ষণ করা হলে'),
  OtherStaticModel(id: '11', description: 'খাদ্য প্লেটে নেয়ার পর উদ্বৃত্ত থেকে গেলে'),
  OtherStaticModel(id: '13', description: 'রান্নায় ব্যবহৃত কোন উপাদান পছন্দ না হলে'),
  OtherStaticModel(id: '96', description: 'অন্যান্য (উল্লেখ করুন)'),
];

List<OtherStaticModel> opinionOnWasteList = [
  OtherStaticModel(id: '1', description: 'খাদ্য অপচয়ের ব্যাপারে আমি অবগত আছি এবং যতদূর সম্ভব অপচয় না করার চেষ্টা করি'),
  OtherStaticModel(id: '2', description: 'খাদ্য অপচয় সমস্যার ব্যাপারে আমি অবগত কিন্তু আমার মনে হয় না নিকট ভবিষ্যতে আমি অপচয়ের ব্যাপারে কোন পরিবর্তন করতে পারব'),
  OtherStaticModel(id: '3', description: 'অতীতে আমি খাদ্য অপচয় রোধে সচেতন ছিলাম কিন্তু এখন এ বিষয়ে গুরুত্ব দেই না'),
  OtherStaticModel(id: '4', description: 'খাদ্য অপচয়কে আমি কোনো সমস্যা বলে মনে করি না'),
  OtherStaticModel(id: '5', description: 'খাদ্য অপচয়কে গুরুত্বপূর্ণ সমস্যা বলে মনে করি এবং অপচয় বন্ধ করা উচিৎ বলে মনে করি'),
  OtherStaticModel(id: '96', description: 'অন্যান্য (উল্লেখ করুন)'),
];

List<OtherStaticModel> knowledgeToReduceWasteList = [
  OtherStaticModel(id: '1', description: 'সঠিক পরিকল্পনা/পরিমাণ'),
  OtherStaticModel(id: '2', description: 'খাদ্যের অপচয় পরিবেশকে দুষিত করে'),
  OtherStaticModel(id: '3', description: 'খাদ্যের অপচয় অর্থনীতির উপর বিরূপ প্রভাব ফেলে'),
  OtherStaticModel(id: '4', description: 'যদি বেশি দামে ক্রয় করা হতো'),
  OtherStaticModel(id: '5', description: 'অপচয়ের জন্য যদি জরিমানা দিতে হতো'),
  OtherStaticModel(id: '6', description: 'খাদ্যের লেবেলিং যদি আরও বোধগম্য হতো/চোখে পড়ার মতো জায়গায় ও লেখা বড় হতো'),
  OtherStaticModel(id: '7', description: 'খাদ্যের প্যাকেজিং যদি আরও উপযুক্ত হতো'),
  OtherStaticModel(id: '96', description: 'অন্যান্য (উল্লেখ করুন)'),
];

List<OtherStaticModel> informationNeededToReduceWasteList = [
  OtherStaticModel(id: '1', description: 'খাদ্য ভালোভাবে সংরক্ষণ সম্পর্কিত তথ্য'),
  OtherStaticModel(id: '2', description: 'উদ্বৃত্ত খাদ্যের পুনরায় ব্যবহার সংক্রান্ত তথ্য'),
  OtherStaticModel(id: '3', description: 'খাদ্যের সতেজতা বজায় রাখা সংক্রান্ত তথ্য'),
  OtherStaticModel(id: '4', description: 'খাদ্য অপচয় রোধে জনসচেতনতামূলক কাজ করে এমন প্রতিষ্ঠান, কার্যক্রম ও প্রচারণা অনুসরণ করা'),
  OtherStaticModel(id: '96', description: 'অন্যান্য (উল্লেখ করুন)'),
];

// ==========================================
// মডিউল-০৩ (পার্ট-২) প্রতিষ্ঠানে খাদ্যের অপচয়
// ==========================================

List<OtherStaticModel> eventTypeList = [
  OtherStaticModel(id: '1', description: 'বিয়ের অনুষ্ঠান'),
  OtherStaticModel(id: '2', description: 'সভা/সেমিনার/সিম্পোজিয়াম/সম্মেলন'),
  OtherStaticModel(id: '3', description: 'অফিসিয়াল প্রোগ্রাম'),
  OtherStaticModel(id: '4', description: 'সুন্নাতে খতনা/অন্নপ্রাশন/জন্মদিন/জিয়ারত'),
  OtherStaticModel(id: '96', description: 'অন্যান্য (উল্লেখ করুন)'),
];

List<OtherStaticModel> leaveFoodTendencyList = [
  OtherStaticModel(id: '1', description: 'সবসময়'),
  OtherStaticModel(id: '2', description: 'মাঝে মাঝে'),
  OtherStaticModel(id: '3', description: 'কখনোই না'),
];

List<OtherStaticModel> howFoodWastedList = [
  OtherStaticModel(id: '1', description: 'প্লেটে অবশিষ্টাংশ'),
  OtherStaticModel(id: '2', description: 'পরিবেশন করা হয়েছে কিন্তু স্পর্শ করা হয়নি'),
  OtherStaticModel(id: '3', description: 'অবশিষ্ট এবং অস্পর্শ উভয়ই'),
  OtherStaticModel(id: '4', description: 'উচ্ছিষ্টাংশ'),
  OtherStaticModel(id: '96', description: 'অন্যান্য (উল্লেখ করুন)'),
];

List<OtherStaticModel> institutionWasteReasonList = [
  OtherStaticModel(id: '1', description: 'কাস্টমার/ভোক্তার স্বাদের অভাব'),
  OtherStaticModel(id: '2', description: 'কাস্টমার/ভোক্তার সামর্থ্যের চেয়ে বেশি অর্ডার করা'),
  OtherStaticModel(id: '3', description: 'বেশি নিতে পছন্দ করা'),
  OtherStaticModel(id: '4', description: 'সকল খাবারের স্বাদ নেয়ার চেষ্টা করা'),
  OtherStaticModel(id: '5', description: 'খাদ্যাভ্যাসের পার্থক্য'),
  OtherStaticModel(id: '6', description: 'ভোক্তাকে খাবারের জন্য অর্থ দিতে হয় না (শুধুমাত্র কমিউনিটি সেন্টারের জন্য প্রযোজ্য)'),
  OtherStaticModel(id: '96', description: 'অন্যান্য (অনুগ্রহ করে উল্লেখ করুন)'),
];

List<OtherStaticModel> whoWastesMoreList = [
  OtherStaticModel(id: '1', description: 'পুরুষ'),
  OtherStaticModel(id: '2', description: 'মহিলা'),
  OtherStaticModel(id: '3', description: 'শিশু'),
  OtherStaticModel(id: '4', description: 'হিজড়া'),
];

List<OtherStaticModel> wastefulServiceTypeList = [
  OtherStaticModel(id: '1', description: 'ওয়েটার দ্বারা পরিবেশিত'),
  OtherStaticModel(id: '2', description: 'বুফে হিসাবে পরিবেশন করা'),
  OtherStaticModel(id: '3', description: 'সেলফ সার্ভিস'),
];

List<OtherStaticModel> wastefulEventTypeList = [
  OtherStaticModel(id: '1', description: 'বিয়ের অনুষ্ঠান'),
  OtherStaticModel(id: '2', description: 'জন্মদিনের অনুষ্ঠান'),
  OtherStaticModel(id: '3', description: 'সুন্নাতে খতনা/অন্নপ্রাশন/জিয়ারত/ইত্যাদি'),
  OtherStaticModel(id: '4', description: 'সভা/সেমিনার/সিম্পোজিয়াম/সম্মেলন'),
  OtherStaticModel(id: '5', description: 'অফিসিয়াল প্রোগ্রাম'),
  OtherStaticModel(id: '6', description: 'অন্যান্য অনুষ্ঠান (উল্লেখ করুন)'),
];

List<OtherStaticModel> eventWasteMainReasonList = [
  OtherStaticModel(id: '1', description: 'অতিথির সংখ্যা সঠিকভাবে অনুমান না করা'),
  OtherStaticModel(id: '2', description: 'কম হলে সম্মান নষ্ট হবে এ ধারণা থেকে সামাজিক মর্যাদা দেখাতে প্রয়োজনের চেয়ে বেশি খাবার রান্না করা হয়'),
  OtherStaticModel(id: '3', description: 'প্রয়োজনের চেয়ে বেশি খাবার প্লেটে নেন কিন্তু শেষ পর্যন্ত সব খেতে পারেন না'),
  OtherStaticModel(id: '4', description: 'একাধিক আইটেম/মেনু থাকলে অতিথিরা অল্প অল্প করে সব নিতে গিয়ে অনেক খাবার অপচয় হয়'),
  OtherStaticModel(id: '5', description: 'দীর্ঘ সময় ধরে খাবার পরিবেশন বা দেরিতে খাওয়ার কারণে খাবারের মান নষ্ট হয়'),
  OtherStaticModel(id: '6', description: 'অনভিজ্ঞ পরিবেশনকারী খাবারের পরিমাণ ঠিকভাবে নির্ধারণ করতে পারে না'),
  OtherStaticModel(id: '7', description: 'অবশিষ্ট খাবার সংরক্ষণ বা বিতরণের ব্যবস্থা না থাকলে তা নষ্ট হয়ে যায়'),
  OtherStaticModel(id: '8', description: 'কোনো খাবার পছন্দ না হলে সেটি কম খাওয়া হয়'),
  OtherStaticModel(id: '9', description: 'আমন্ত্রিত অতিথি কম এলে খাবার অব্যবহৃত থেকে যায়'),
  OtherStaticModel(id: '10', description: 'প্রাকৃতিক দুর্যোগ বা অনিবার্য কারণবশত অনুষ্ঠান বাতিল হওয়া বা অধিক গরম খাবার নষ্ট হয়'),
  OtherStaticModel(id: '96', description: 'অন্যান্য কারণ (উল্লেখ করুন)'),
];

List<OtherStaticModel> extraOrderedFoodActionList = [
  OtherStaticModel(id: '1', description: 'অতিরিক্ত খাবার প্যাকেট করে দিয়ে দেওয়া হয়'),
  OtherStaticModel(id: '2', description: 'অতিরিক্ত খাবার গরিবদের দিয়ে দেওয়া হয়'),
  OtherStaticModel(id: '3', description: 'পরবর্তিতে অন্যদের নিকট পরিবেশন করা হয়'),
  OtherStaticModel(id: '4', description: 'কিছু ক্ষেত্রে খাবার staff meal-এর ব্যবস্থা করা হয় (food safety মেনে)'),
  OtherStaticModel(id: '5', description: 'ফেলে দেওয়া হয়'),
  OtherStaticModel(id: '96', description: 'অন্যান্য (উল্লেখ করুন)'),
];

List<OtherStaticModel> institutionExtraFoodActionList = [
  OtherStaticModel(id: '1', description: 'দাতব্য প্রতিষ্ঠানে দান করা হয়'),
  OtherStaticModel(id: '2', description: 'ফুড ব্যাংকে দান করা হয়'),
  OtherStaticModel(id: '3', description: 'ধর্মীয় সংগঠন/সংস্থায় দান করা হয়'),
  OtherStaticModel(id: '4', description: 'গরিবদের মধ্যে বিতরণ করা হয়'),
  OtherStaticModel(id: '5', description: 'ফেলে দেওয়া হয়'),
  OtherStaticModel(id: '96', description: 'অন্যান্য (উল্লেখ করুন)'),
];

List<OtherStaticModel> damageTypeList = [
  OtherStaticModel(id: '1', description: 'ব্যক্তির অর্থের ক্ষতি'),
  OtherStaticModel(id: '2', description: 'খাদ্য নিরাপত্তা বিপন্ন'),
  OtherStaticModel(id: '3', description: 'উৎপাদন কমে গেছে'),
  OtherStaticModel(id: '4', description: 'মূল্যবান প্রাকৃতিক ক্ষতি সম্পদ'),
  OtherStaticModel(id: '5', description: 'ক্ষতি হচ্ছে কৃষকদের'),
  OtherStaticModel(id: '6', description: 'এটি উন্নয়নে বাধা দেয়'),
  OtherStaticModel(id: '7', description: 'পরিবেশ দূষিত করে'),
];

List<OtherStaticModel> damageLevelList = [
  OtherStaticModel(id: '1', description: 'অধিক'),
  OtherStaticModel(id: '2', description: 'মোটামুটি'),
  OtherStaticModel(id: '3', description: 'সামান্য'),
  OtherStaticModel(id: '4', description: 'একদমই না'),
];

// ==========================================
// মডিউল-০৩ (পার্ট-৩) সুপারশপ ও খুচরা বিক্রেতা
// ==========================================

List<OtherStaticModel> supershopWasteReasonList = [
  OtherStaticModel(id: '1', description: 'পচে যাওয়া/Spoilage'),
  OtherStaticModel(id: '2', description: 'মেয়াদোত্তীর্ণ/Expired'),
  OtherStaticModel(id: '3', description: 'ক্ষতিগ্রস্ত/Damage'),
  OtherStaticModel(id: '4', description: 'অতিরিক্ত মজুত/Overstock'),
  OtherStaticModel(id: '5', description: 'চাহিদা না থাকা'),
  OtherStaticModel(id: '6', description: 'পরিবহন ও হ্যান্ডলিং ত্রুটি'),
  OtherStaticModel(id: '7', description: 'ইদুর/অন্যান্য প্রাণী দ্বারা ক্ষতিগ্রস্ত'),
  OtherStaticModel(id: '96', description: 'অন্যান্য (উল্লেখ করুন)'),
];

List<OtherStaticModel> supershopWasteActionList = [
  OtherStaticModel(id: '1', description: 'ডাস্টবিনে ফেলে দেওয়া হয়'),
  OtherStaticModel(id: '2', description: 'পশুখাদ্য হিসেবে ব্যবহার করা হয়'),
  OtherStaticModel(id: '3', description: 'রিসাইক্লিং করা হয়'),
  OtherStaticModel(id: '4', description: 'কম্পোস্ট করা হয়'),
  OtherStaticModel(id: '5', description: 'অন্যকে দেয়া হয়'),
  OtherStaticModel(id: '6', description: 'মাটির নিচে পুঁতে ফেলা হয়'),
  OtherStaticModel(id: '96', description: 'অন্যান্য (উল্লেখ করুন)'),
];

List<OtherStaticModel> supershopOfferList = [
  OtherStaticModel(id: '1', description: 'ডিসকাউন্ট সেল/অফার'),
  OtherStaticModel(id: '2', description: 'বাই-ওয়ান-গেট-ওয়ান অফার'),
  OtherStaticModel(id: '3', description: 'ডোনেশন প্রোগ্রাম'),
  OtherStaticModel(id: '4', description: 'উন্নত স্টোরেজ'),
  OtherStaticModel(id: '96', description: 'অন্যান্য (উল্লেখ করুন)'),
];

// ==========================================
// মডিউল-০৩ (পার্ট-৪) ও মডিউল-০৪ হাসপাতাল এবং বর্জ্য ব্যবস্থাপনা
// ==========================================

List<OtherStaticModel> foodWasteTypeList = [
  OtherStaticModel(id: '1', description: 'খাওয়ার অযোগ্য খাদ্যবর্জ্য (হাড়/উচ্ছিষ্ট, ডিমের খোসা, ফলের বিচি, টি ব্যাগ)'),
  OtherStaticModel(id: '2', description: 'খাওয়ার যোগ্য খাদ্যবর্জ্য (অতিরিক্ত খাবার, পচনশীল খাবার, ফল, পুরনো রুটি, সকল প্রকার সবজি ও ফলের খোসা)'),
  OtherStaticModel(id: '3', description: 'প্যাকেটজাত খাদ্য বর্জ্য (অপচনশীল খাবার, অতিরিক্ত মেয়াদ উত্তীর্ণ বা ক্ষতিগ্রস্ত খাবার)'),
  OtherStaticModel(id: '96', description: 'অন্যান্য (উল্লেখ করুন)'),
];

List<OtherStaticModel> wasteCollectorList = [
  OtherStaticModel(id: '1', description: 'পৌরসভা'),
  OtherStaticModel(id: '2', description: 'এনজিও'),
  OtherStaticModel(id: '3', description: 'প্রাইভেট কোম্পানি'),
  OtherStaticModel(id: '4', description: 'সুবিধাবঞ্চিত গোষ্ঠীর লোকেরা (যেমন: গরীব, ভিক্ষুক, টোকাই, ঝাড়ুদার ইত্যাদি)'),
  OtherStaticModel(id: '5', description: 'যারা কম্পোস্ট তৈরি করে'),
  OtherStaticModel(id: '6', description: 'নিজেরাই ময়লার ভাগাড়ে ফেলে দিই'),
  OtherStaticModel(id: '96', description: 'অন্যান্য (উল্লেখ করুন)'),
];

List<OtherStaticModel> surplusCollectorList = [
  OtherStaticModel(id: '1', description: 'দাতব্য প্রতিষ্ঠান'),
  OtherStaticModel(id: '2', description: 'ফুড ব্যাংক'),
  OtherStaticModel(id: '3', description: 'ধর্মীয় সংগঠন/সংস্থা'),
  OtherStaticModel(id: '4', description: 'যারা খাবার জোগাড় করে অসহায়দের মাঝে পৌঁছে দেয়'),
  OtherStaticModel(id: '96', description: 'অন্যান্য (উল্লেখ করুন)'),
];

List<OtherStaticModel> wasteManagementSolutionList = [
  OtherStaticModel(id: '1', description: 'প্যাকিং করে পৌরসভার ডাস্টবিনে ফেলে দেয়া হয়'),
  OtherStaticModel(id: '2', description: 'এটি বাছাই করা এবং কম্পোস্টিং এর জন্য ব্যবহার করা'),
  OtherStaticModel(id: '3', description: 'পশুর খাদ্য হিসেবে ব্যবহার করা'),
  OtherStaticModel(id: '4', description: 'গরীব লোকেদের দান করা'),
  OtherStaticModel(id: '5', description: 'মাটির নিচে পুঁতে ফেলা'),
  OtherStaticModel(id: '96', description: 'অন্যান্য (উল্লেখ করুন)'),
];

List<OtherStaticModel> wasteReductionSolutionList = [
  OtherStaticModel(id: '1', description: 'গণসচেতনতা সৃষ্টি করা'),
  OtherStaticModel(id: '2', description: 'আইনুনগ ব্যবস্থা গ্রহণ করা'),
  OtherStaticModel(id: '3', description: 'অনুষ্ঠানে খাবারের আইটেম সীমিত রাখা'),
  OtherStaticModel(id: '4', description: 'অতিথির সংখ্যা সঠিকভাবে নির্ধারণ করা'),
  OtherStaticModel(id: '5', description: 'খাবার সঠিকভাবে সংরক্ষণ করা'),
  OtherStaticModel(id: '6', description: 'প্রয়োজন ও চাহিদা অনুযায়ী রান্না করা'),
  OtherStaticModel(id: '7', description: 'উদ্বৃত্ত/বেশি পরিমাণ খাবার গরিব/অসহায়দের মাঝে বিতরণ করা'),
  OtherStaticModel(id: '96', description: 'অন্যান্য (উল্লেখ করুন)'),
];