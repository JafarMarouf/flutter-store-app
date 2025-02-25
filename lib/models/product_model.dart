class ProductModel {
  final int id;
  final String title;
  final dynamic price;
  final String description;
  final String image;
  final String category;
  final RatingModel rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory ProductModel.fromJson(dynamic jsonData) {
    return ProductModel(
        id: jsonData['id'],
        title: jsonData['title'],
        price: jsonData['price'],
        description: jsonData['description'],
        image: jsonData['image'],
        category: jsonData['category'],
        rating: RatingModel.fromJson(jsonData['rating']));
  }
}

class RatingModel {
  final dynamic rate;
  final dynamic count;

  RatingModel({
    required this.rate,
    required this.count,
  });

  factory RatingModel.fromJson(dynamic data) {
    return RatingModel(
      rate: data['rate'],
      count: data['count'],
    );
  }
}
