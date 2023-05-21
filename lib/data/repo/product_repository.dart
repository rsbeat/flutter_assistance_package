import 'package:dartz/dartz.dart';
import 'package:flutter_assistant_package/data/model/product/product_chapters_model.dart';
import 'package:flutter_assistant_package/data/model/product/product_search_model.dart';
import 'package:flutter_assistant_package/data/model/product/product_sort_model.dart';
import 'package:flutter_assistant_package/network/failures.dart';
import 'package:flutter_assistant_package/network/safe_api_call.dart';
import 'package:flutter_assistant_package/network/urls_request.dart';

abstract class IProductRepository {
  Future<Either<Failure, ProductSearchModel>> searchProducts();
  Future<Either<Failure, ProductchaptersModel>> getProductsChapter({required int productID});
  Future<Either<Failure, ProductSearchModel>> getProductItems({required int productID});

  Future<Either<Failure, ProductSearchModel>> getProductSuperTypes();

  Future<Either<Failure, ProductSortModel>> sortProductItems({required int productID});
  Future<Either<Failure, ProductSearchModel>> searchThroughAllChapters();
}

class ProductRepository extends IProductRepository with SafeApiCall {
  final RestClient restClient;

  ProductRepository(this.restClient);
  @override
  Future<Either<Failure, ProductSearchModel>> getProductItems({required int productID}) async {
    final either = await call(
      restClient.getProductItems(
        productID.toString(),
      ),
    );
    return either.fold((l) => left(l), (r) => right(r!));
  }

  @override
  Future<Either<Failure, ProductSearchModel>> getProductSuperTypes() async {
    final either = await call(
      restClient.getProductSuperTypes(),
    );
    return either.fold((l) => left(l), (r) => right(r!));
  }

  @override
  Future<Either<Failure, ProductchaptersModel>> getProductsChapter({required int productID}) async {
    final either = await call(
      restClient.getProductsChapter(productID.toString()),
    );
    return either.fold((l) => left(l), (r) => right(r!));
  }

  @override
  Future<Either<Failure, ProductSearchModel>> searchProducts() async {
    final either = await call(
      restClient.searchProducts(),
    );
    return either.fold((l) => left(l), (r) => right(r!));
  }

  @override
  Future<Either<Failure, ProductSearchModel>> searchThroughAllChapters() async {
    final either = await call(
      restClient.searchThroughAllChapters(),
    );
    return either.fold((l) => left(l), (r) => right(r!));
  }

  @override
  Future<Either<Failure, ProductSortModel>> sortProductItems({required int productID}) async {
    final either = await call(
      restClient.sortProductItems(productID.toString()),
    );
    return either.fold((l) => left(l), (r) => right(r!));
  }
}
