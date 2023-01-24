class ColorsModel {
  String colorA;
  String colorB;

  ColorsModel({required this.colorA, required this.colorB});

  factory ColorsModel.fromJson(Map<String, dynamic> json) {
    return ColorsModel(
      colorA: json['color_a'] as String? ?? "",
      colorB: json['color_b'] as String? ?? "",
    );
  }

}
