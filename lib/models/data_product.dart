import 'package:flutter/material.dart';
import 'package:project_id_camp/models/product.dart';

class DataProduct extends ChangeNotifier {
  final List<Product> listProduct = [
    Product(
      name: "Boomber Jacket",
      image: "assets/images/boomber_jacket.jpg",
      price: "49.99",
      description:
          "Description :\nStay stylish and warm with this modern Bomber Jacket. Crafted with durable fabric, it’s perfect for both casual wear and chilly days. Features a zipper closure, ribbed cuffs, and a comfortable fit. Ideal for layering over t-shirts or sweaters. Available in multiple sizes and colors.\n\nKey Features :\n• Water-resistant fabric\n• Full-zip closure\n• Pockets for convenience\n• Machine washable",
    ),
    Product(
      name: "Sport Shoes",
      image: "assets/images/sport_shoes.jpg",
      price: "45.99",
      description:
          "Description :\nStay stylish and warm with this modern Bomber Jacket. Crafted with durable fabric, it’s perfect for both casual wear and chilly days. Features a zipper closure, ribbed cuffs, and a comfortable fit. Ideal for layering over t-shirts or sweaters. Available in multiple sizes and colors.\n\nKey Features :\n• Water-resistant fabric\n• Full-zip closure\n• Pockets for convenience\n• Machine washable",
    ),
    Product(
      name: "Citizen Watch",
      image: "assets/images/citizen_watch.jpg",
      price: "55.99",
      description:
          "Description :\nStay stylish and warm with this modern Bomber Jacket. Crafted with durable fabric, it’s perfect for both casual wear and chilly days. Features a zipper closure, ribbed cuffs, and a comfortable fit. Ideal for layering over t-shirts or sweaters. Available in multiple sizes and colors.\n\nKey Features :\n• Water-resistant fabric\n• Full-zip closure\n• Pockets for convenience\n• Machine washable",
    ),
    Product(
      name: "Winter Jacket",
      image: "assets/images/winter_jacket.jpg",
      price: "48.99",
      description:
          "Description :\nStay stylish and warm with this modern Bomber Jacket. Crafted with durable fabric, it’s perfect for both casual wear and chilly days. Features a zipper closure, ribbed cuffs, and a comfortable fit. Ideal for layering over t-shirts or sweaters. Available in multiple sizes and colors.\n\nKey Features :\n• Water-resistant fabric\n• Full-zip closure\n• Pockets for convenience\n• Machine washable",
    ),
    Product(
      name: "Men Jeans",
      image: "assets/images/men_jeans.jpg",
      price: "38.99",
      description:
          "Description :\nStay stylish and warm with this modern Bomber Jacket. Crafted with durable fabric, it’s perfect for both casual wear and chilly days. Features a zipper closure, ribbed cuffs, and a comfortable fit. Ideal for layering over t-shirts or sweaters. Available in multiple sizes and colors.\n\nKey Features :\n• Water-resistant fabric\n• Full-zip closure\n• Pockets for convenience\n• Machine washable",
    ),
    Product(
      name: "Denim Jacket",
      image: "assets/images/denim_jacket.jpg",
      price: "42.99",
      description:
          "Description :\nStay stylish and warm with this modern Bomber Jacket. Crafted with durable fabric, it’s perfect for both casual wear and chilly days. Features a zipper closure, ribbed cuffs, and a comfortable fit. Ideal for layering over t-shirts or sweaters. Available in multiple sizes and colors.\n\nKey Features :\n• Water-resistant fabric\n• Full-zip closure\n• Pockets for convenience\n• Machine washable",
    ),
    Product(
      name: "Sneakers",
      image: "assets/images/sneakers.jpg",
      price: "44.99",
      description:
          "Description :\nStay stylish and warm with this modern Bomber Jacket. Crafted with durable fabric, it’s perfect for both casual wear and chilly days. Features a zipper closure, ribbed cuffs, and a comfortable fit. Ideal for layering over t-shirts or sweaters. Available in multiple sizes and colors.\n\nKey Features :\n• Water-resistant fabric\n• Full-zip closure\n• Pockets for convenience\n• Machine washable",
    ),
    Product(
      name: "Women Jeans",
      image: "assets/images/women_jeans.jpg",
      price: "39.99",
      description:
          "Description :\nStay stylish and warm with this modern Bomber Jacket. Crafted with durable fabric, it’s perfect for both casual wear and chilly days. Features a zipper closure, ribbed cuffs, and a comfortable fit. Ideal for layering over t-shirts or sweaters. Available in multiple sizes and colors.\n\nKey Features :\n• Water-resistant fabric\n• Full-zip closure\n• Pockets for convenience\n• Machine washable",
    ),
    Product(
      name: "Leather Shoes",
      image: "assets/images/leather_shoes.jpg",
      price: "47.99",
      description:
          "Description :\nStay stylish and warm with this modern Bomber Jacket. Crafted with durable fabric, it’s perfect for both casual wear and chilly days. Features a zipper closure, ribbed cuffs, and a comfortable fit. Ideal for layering over t-shirts or sweaters. Available in multiple sizes and colors.\n\nKey Features :\n• Water-resistant fabric\n• Full-zip closure\n• Pockets for convenience\n• Machine washable",
    ),
  ];

  final List<Product> _cart = [];
  List<Product> get cart => _cart;

  void addToCart(Product product, int quantity) {
    final existingProduct = _cart.firstWhere(
      (item) => item.name == product.name,
      orElse: () => Product(name: "", image: "", price: "0", quantity: 0),
    );

    if (existingProduct.name.isNotEmpty) {
      existingProduct.quantity += quantity;
    } else {
      _cart.add(Product(
        name: product.name,
        image: product.image,
        price: product.price,
        description: product.description,
        quantity: quantity,
      ));
    }
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cart.remove(product);
    notifyListeners();
  }

  void toggleFavoriteStatus(Product product) {}
}
