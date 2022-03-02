import './languagesModels.dart';

class CountriesModel {
  String? code;
  String? name;
  String? native;
  String? emoji;
  String? currency;
  List<Languages>? languages;

  CountriesModel(
      {this.code,
      this.name,
      this.native,
      this.emoji,
      this.currency,
      this.languages});

  CountriesModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    native = json['native'];
    emoji = json['emoji'];
    currency = json['currency'];
    if (json['languages'] != null) {
      languages = <Languages>[];
      json['languages'].forEach((v) {
        languages!.add(Languages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['name'] = name;
    data['native'] = native;
    data['emoji'] = emoji;
    data['currency'] = currency;
    if (languages != null) {
      data['languages'] = languages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
