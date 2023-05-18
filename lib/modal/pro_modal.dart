class Product {
  final int id;
  final String title;
  final String description;
  final String thumbnail;
  final int price;
  final String category;
  bool like = false;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbnail,
    required this.price,
    required this.category,
  });
  factory Product.fromeMap({required Map data}) {
    return Product(
      id: data['id'],
      title: data['title'],
      description: data['description'],
      thumbnail: data['thumbnail'],
      price: data['price'],
      category: data['category'],
    );
  }
}

class Cart {
  final int cartPro;

  Cart({
    required this.cartPro,
  });
}

class Contacts {
  String firstName;
  String lastName;
  String contact;
  String email;

  Contacts({
    required this.firstName,
    required this.lastName,
    required this.contact,
    required this.email,
  });
}
