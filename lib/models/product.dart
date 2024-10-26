class Product {
  String name;
  String image;
  String price;
  String? description;
  bool isFavorite;
  int quantity;

  Product({
    required this.name,
    required this.image,
    required this.price,
    this.description,
    this.isFavorite = false,
    this.quantity = 0,
  });
}
