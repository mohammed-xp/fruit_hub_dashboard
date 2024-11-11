import 'dart:io';

import 'package:fruit_hub_dashboard/features/add_product/data/model/review_model.dart';
import 'package:fruit_hub_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';
import 'package:fruit_hub_dashboard/features/add_product/domain/entities/review_entity.dart';

class AddProductInputModel {
  final String name;
  final String description;
  final num price;
  final String code;
  final bool isFeatured;
  final File image;
  String? imageUrl;
  final int expirationMonths;
  final bool isOrganic;
  final int numOfCalories;
  final int unitAmount;
  final num averageRating = 0;
  final num ratingCount = 0;
  final List<ReviewModel> reviews;

  AddProductInputModel({
    required this.name,
    required this.description,
    required this.price,
    required this.code,
    required this.isFeatured,
    required this.image,
    this.imageUrl,
    required this.expirationMonths,
    required this.isOrganic,
    required this.numOfCalories,
    required this.unitAmount,
    required this.reviews,
  });

  factory AddProductInputModel.fromEntity(
      AddProductInputEntity addProductInputEntity) {
    return AddProductInputModel(
      name: addProductInputEntity.name,
      description: addProductInputEntity.description,
      price: addProductInputEntity.price,
      code: addProductInputEntity.code,
      isFeatured: addProductInputEntity.isFeatured,
      image: addProductInputEntity.image,
      imageUrl: addProductInputEntity.imageUrl,
      expirationMonths: addProductInputEntity.expirationMonths,
      isOrganic: addProductInputEntity.isOrganic,
      numOfCalories: addProductInputEntity.numOfCalories,
      unitAmount: addProductInputEntity.unitAmount,
      reviews: addProductInputEntity.reviews
          .map((ReviewEntity r) => ReviewModel.fromEntity(r))
          .toList(),
    );
  }

  toJson() {
    return {
      "name": name,
      "description": description,
      "price": price,
      "code": code,
      "isFeatured": isFeatured,
      "imageUrl": imageUrl,
      "expirationMonths": expirationMonths,
      "numOfCalories": numOfCalories,
      "unitAmount": unitAmount,
      "isOrganic": isOrganic,
      "reviews": reviews.map((ReviewModel r) => r.toJson()).toList(),
    };
  }
}
