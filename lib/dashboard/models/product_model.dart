
class ProductModel {
  final String title;
  final String desc;
  final String id;

  ProductModel({required this.title, required this.desc, required this.id});

  factory ProductModel.fromJson(Map<String,dynamic> json, [String? id]) {
    return ProductModel(
      title: json['title'] ?? "XX",
      desc: json['desc'] ?? "XXXX",
      id: json['id'],
    );
  }
}