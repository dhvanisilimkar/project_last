class Product {
  final int id;
  final String title;
  final String description;
  final String thumbnail;
  final int price;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbnail,
    required this.price,
  });
  factory Product.fromeMap({required Map data}) {
    return Product(
      id: data['id'],
      title: data['title'],
      description: data['description'],
      thumbnail: data['thumbnail'],
      price: data['price'],
    );
  }
}
