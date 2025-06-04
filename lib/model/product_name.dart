class ProductName {
  final String name;
  final String email;
  final String product;

  ProductName({required this.email, required this.name, required this.product});

  factory ProductName.fromJson(Map<String, dynamic> json) {
    return ProductName(
        email: json["email"], name: json["name"], product: json["product"]);
  }
}
