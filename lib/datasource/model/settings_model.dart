class SettingsModel {
  SettingsModel({this.perKmCharge1, this.riderPerimeters});

  SettingsModel.fromJson(dynamic json) {
    perKmCharge1 = json['per_km_charge_1'] != null ? PerKmCharge1.fromJson(json['per_km_charge_1']) : null;
    riderPerimeters = json['rider_perimeters'];
  }

  PerKmCharge1? perKmCharge1;
  num? riderPerimeters;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (perKmCharge1 != null) {
      map['per_km_charge_1'] = perKmCharge1?.toJson();
    }
    map['rider_perimeters'] = riderPerimeters;
    return map;
  }
}

class PerKmCharge1 {
  PerKmCharge1({this.km, this.charge});

  PerKmCharge1.fromJson(dynamic json) {
    km = json['km'];
    charge = json['charge'] != null ? Charge.fromJson(json['charge']) : null;
  }

  dynamic km;
  Charge? charge;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['km'] = km;
    if (charge != null) {
      map['charge'] = charge?.toJson();
    }
    return map;
  }
}

class Charge {
  Charge({this.car, this.ambulance, this.micro});

  Charge.fromJson(dynamic json) {
    car = json['car'];
    ambulance = json['ambulance'];
    micro = json['micro'];
  }

  String? car;
  String? ambulance;
  String? micro;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['car'] = car;
    map['ambulance'] = ambulance;
    map['micro'] = micro;
    return map;
  }
}
