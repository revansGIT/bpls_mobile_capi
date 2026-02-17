class AddressStaticDataModel{
  String name;
  String code;
  String parentCode;
  AddressStaticDataModel({required this.name, required this.code, this.parentCode = ''});
}

List<AddressStaticDataModel> divisions = [
  AddressStaticDataModel(name: 'ঢাকা', code: '01'),
  AddressStaticDataModel(name: 'চট্টগ্রাম', code: '02'),
  AddressStaticDataModel(name: 'রাজশাহী', code: '03'),
  AddressStaticDataModel(name: 'খুলনা', code: '04'),
  AddressStaticDataModel(name: 'বরিশাল', code: '05'),
  AddressStaticDataModel(name: 'সিলেট', code: '06'),
  AddressStaticDataModel(name: 'রংপুর', code: '07'),
  AddressStaticDataModel(name: 'ময়মনসিংহ', code: '08'),
];

List<AddressStaticDataModel> districts = [
  AddressStaticDataModel(name: 'ঢাকা', code: '0101', parentCode: '01'),
  AddressStaticDataModel(name: 'গাজীপুর', code: '0102', parentCode: '01'),
  AddressStaticDataModel(name: 'চট্টগ্রাম', code: '0201', parentCode: '02'),
  AddressStaticDataModel(name: 'কুমিল্লা', code: '0202', parentCode: '02'),
  AddressStaticDataModel(name: 'রাজশাহী', code: '0301', parentCode: '03'),
  AddressStaticDataModel(name: 'নওগাঁ', code: '0302', parentCode: '03'),
];

List<AddressStaticDataModel> upazilas = [
  AddressStaticDataModel(name: 'ধানমন্ডি', code: '010101', parentCode: '0101'),
  AddressStaticDataModel(name: 'সাভার', code: '010201', parentCode: '0102'),
  AddressStaticDataModel(name: 'পটিয়া', code: '020101', parentCode: '0201'),
  AddressStaticDataModel(name: 'ব্রাহ্মণবাড়িয়া সদর', code: '020201', parentCode: '0202'),
  AddressStaticDataModel(name: 'চাঁপাইনবাবগঞ্জ সদর', code: '030101', parentCode: '0301'),
  AddressStaticDataModel(name: 'নওগাঁ সদর', code: '030201', parentCode: '0302'),
];

List<AddressStaticDataModel> cityCorporations = [
  AddressStaticDataModel(name: 'ঢাকা সিটি কর্পোরেশন', code: '010101', parentCode: '0101'),
  AddressStaticDataModel(name: 'গাজীপুর সিটি কর্পোরেশন', code: '010201', parentCode: '0102'),
  AddressStaticDataModel(name: 'চট্টগ্রাম সিটি কর্পোরেশন', code: '020101', parentCode: '0201'),
  AddressStaticDataModel(name: 'কুমিল্লা সিটি কর্পোরেশন', code: '020201', parentCode: '0202'),
  AddressStaticDataModel(name: 'রাজশাহী সিটি কর্পোরেশন', code: '030101', parentCode: '0301'),
  AddressStaticDataModel(name: 'নওগাঁ পৌরসভা', code: '030201', parentCode: '0302'),
];

List<AddressStaticDataModel> wards = [
  AddressStaticDataModel(name: 'ওয়ার্ড ১', code: '01010101', parentCode: '010101'),
  AddressStaticDataModel(name: 'ওয়ার্ড ২', code: '01010102', parentCode: '010101'),
  AddressStaticDataModel(name: 'ওয়ার্ড ১', code: '01020101', parentCode: '010201'),
  AddressStaticDataModel(name: 'ওয়ার্ড ২', code: '01020102', parentCode: '010201'),
  AddressStaticDataModel(name: 'ওয়ার্ড ১', code: '02010101', parentCode: '020101'),
  AddressStaticDataModel(name: 'ওয়ার্ড ২', code: '02010102', parentCode: '020101'),
];

List<AddressStaticDataModel> porosonas = [
  AddressStaticDataModel(name: 'পাড়া ১', code: '0101010101', parentCode: '01010101'),
  AddressStaticDataModel(name: 'পাড়া ২', code: '0101010102', parentCode: '01010101'),
  AddressStaticDataModel(name: 'পাড়া ১', code: '0102010101', parentCode: '01020101'),
  AddressStaticDataModel(name: 'পাড়া ২', code: '0102010102', parentCode: '01020101'),
  AddressStaticDataModel(name: 'পাড়া ১', code: '0201010101', parentCode: '02010101'),
  AddressStaticDataModel(name: 'পাড়া ২', code: '0201010102', parentCode: '02010101'),
];

List<AddressStaticDataModel> moujas = [
  AddressStaticDataModel(name: 'মৌজা ১', code: '010101010101', parentCode: '0101010101'),
  AddressStaticDataModel(name: 'মৌজা ২', code: '010101010102', parentCode: '0101010101'),
  AddressStaticDataModel(name: 'মৌজা ১', code: '010201010101', parentCode: '0102010101'),
  AddressStaticDataModel(name: 'মৌজা ২', code: '010201010102', parentCode: '0102010101'),
  AddressStaticDataModel(name: 'মৌজা ১', code: '020101010101', parentCode: '0201010101'),
  AddressStaticDataModel(name: 'মৌজা ২', code: '020101010102', parentCode: '0201010101'),
];

List<AddressStaticDataModel> villages = [
  AddressStaticDataModel(name: 'গ্রাম ১', code: '01010101010101', parentCode: '010101010101'),
  AddressStaticDataModel(name: 'গ্রাম ২', code: '01010101010102', parentCode: '010101010101'),
  AddressStaticDataModel(name: 'গ্রাম ১', code: '01020101010101', parentCode: '010201010101'),
  AddressStaticDataModel(name: 'গ্রাম ২', code: '01020101010102', parentCode: '010201010101'),
  AddressStaticDataModel(name: 'গ্রাম ১', code: '02010101010101', parentCode: '020101010101'),
  AddressStaticDataModel(name: 'গ্রাম ২', code: '02010101010102', parentCode: '020101010101'),
];

List<AddressStaticDataModel> surveyVillages = [
  AddressStaticDataModel(name: 'সার্ভে গ্রাম ১', code: '0101010101010101', parentCode: '01010101010101'),
  AddressStaticDataModel(name: 'সার্ভে গ্রাম ২', code: '0101010101010102', parentCode: '01010101010101'),
  AddressStaticDataModel(name: 'সার্ভে গ্রাম ১', code: '0102010101010101', parentCode: '01020101010101'),
  AddressStaticDataModel(name: 'সার্ভে গ্রাম ২', code: '0102010101010102', parentCode: '01020101010101'),
  AddressStaticDataModel(name: 'সার্ভে গ্রাম ১', code: '0201010101010101', parentCode: '02010101010101'),
  AddressStaticDataModel(name: 'সার্ভে গ্রাম ২', code: '0201010101010102', parentCode: '02010101010101'),
];

List<AddressStaticDataModel> rmoTypes = [
  AddressStaticDataModel(name: 'প্রকার ১', code: 'RMO01'),
  AddressStaticDataModel(name: 'প্রকার ২', code: 'RMO02'),
  AddressStaticDataModel(name: 'প্রকার ৩', code: 'RMO03'),
];

