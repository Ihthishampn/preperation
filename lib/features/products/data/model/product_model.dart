class ProductModel {
  final int id;
  final String title;
  final double price;
  final double rating;
  final String image;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    required this.rating,
  });

  // fetch

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"] ?? 0,
      title: json["title"] ?? "",
      price: json["price"] ?? 0.0,
      image: json["image"] ?? "",
      rating: json["rating"]?["rate"] ?? 0.0,
    );
  }
}


//  {
//     "id": 1,
//     "title": "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
//     "price": 109.95,
//     "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_t.png",
//     "rating": {
//       "rate": 3.9,
//       "count": 120
//     }