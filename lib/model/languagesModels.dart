class Languages {
  String? code;

  Languages({this.code});

  Languages.fromJson(Map<String, dynamic> json) {
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['code'] = code;
    return data;
  }
}
