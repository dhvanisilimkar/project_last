class Product {
  final int id;
  final String title;
  final String description;
  final String thumbnail;
  final int price;
  final String like;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbnail,
    required this.price,
    required this.like,
  });
  factory Product.fromeMap({required Map data}) {
    return Product(
      id: data['id'],
      title: data['title'],
      description: data['description'],
      thumbnail: data['thumbnail'],
      price: data['price'],
      like: data['like'],
    );
  }
}

class Cart {
  final int cartPro;

  Cart({
    required this.cartPro,
  });
}
