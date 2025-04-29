class CountryModel {
  String? name;
  String? code;

  CountryModel({required this.name, required this.code});

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(name: json['name'], code: json['code']);
  }
}
