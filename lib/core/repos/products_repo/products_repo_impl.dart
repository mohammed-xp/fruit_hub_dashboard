import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/core/errors/failures.dart';
import 'package:fruit_hub_dashboard/core/repos/products_repo/products_repo.dart';
import 'package:fruit_hub_dashboard/core/services/database_service.dart';
import 'package:fruit_hub_dashboard/core/utils/backend_endpoint.dart';
import 'package:fruit_hub_dashboard/features/add_product/data/model/product_model.dart';
import 'package:fruit_hub_dashboard/features/add_product/domain/entities/product_entity.dart';

class ProductsRepoImpl implements ProductsRepo {
  ProductsRepoImpl({required this.databaseService});

  final DatabaseService databaseService;

  @override
  Future<Either<Failure, void>> addProduct(
      ProductEntity addProductInputEntity) async {
    try {
      await databaseService.addData(
        path: BackendEndpoint.addProduct,
        data: ProductModel.fromEntity(addProductInputEntity).toJson(),
      );
      return const Right(null);
    } catch (e) {
      log(e.toString());
      return Left(
        ServerFailure('Failed to add product'),
      );
    }
  }
}
