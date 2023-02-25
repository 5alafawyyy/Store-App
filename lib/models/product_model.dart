import 'package:store_app/models/rating_model.dart';

class ProductModel {
  final dynamic id;
  final String title;
  final String price;
  final String description;
  final String category;
  final String image;
  final RatingModel? rating;

  const ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'] as String,
      price: json['price'].toString(),
      description: json['description'] as String,
      category: json['category'] as String,
      image: json['image'] as String,
      rating:
          json['rating'] == null ? null : RatingModel.fromJson(json['rating']),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
      'rating': rating!.toJson(),
    };
  }
}
