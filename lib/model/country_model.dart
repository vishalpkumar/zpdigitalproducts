
List<CountryModel> fromJsonToCountry(var json){
  List jsonData =  json;
  return jsonData.map((map) => CountryModel.fromJson(map)).toList();
}

class CountryModel {

  String? code;
  String? name;
  List<CountryLanguages>? countryLanguages;

  CountryModel({this.code, this.name, this.countryLanguages});

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
       code: json['code'] ?? "",
       name: json['name'] ?? "",
        countryLanguages: json['languages'] != null ? List<CountryLanguages>.from(json['languages'].map((x) => CountryLanguages.fromJson(x))) : [],
    );
  }

}

class CountryLanguages {
  String? code;
  String? name;

  CountryLanguages({this.code, this.name});

  factory CountryLanguages.fromJson(Map<String, dynamic> json) {
    return CountryLanguages(
        code: json['code'] ?? "",
        name: json['name'] ?? ""
    );
  }
}