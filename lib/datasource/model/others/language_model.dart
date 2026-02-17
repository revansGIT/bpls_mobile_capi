class LanguageModel {
  String imageUrl;
  String languageName;
  String languageCode;
  String countryCode;

  LanguageModel({this.imageUrl='', this.languageName='', this.countryCode='', this.languageCode=''});
}

class Locales {
  Locales({
    this.language,
    this.name,
    this.description,
    this.messagesForCustomers,
  });

  Locales.fromJson(dynamic json) {
    language = json['language'];
    name = json['name'];
    description = json['description'];
    messagesForCustomers = json['messagesForCustomers'];
  }

  String? language;
  String? name;
  String? description;
  String? messagesForCustomers;
}