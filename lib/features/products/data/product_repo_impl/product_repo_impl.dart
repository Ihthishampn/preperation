import 'package:inter/features/products/data/data_source/data_source.dart';
import 'package:inter/features/products/data/model/product_model.dart';
import 'package:inter/features/products/domain/repo/product_repo.dart';

class ProductRepoImpl implements ProductRepo {
  final DataSource dataSource;

  ProductRepoImpl(this.dataSource);

  @override
  Future<List<ProductModel>> fetchProducts() {
    return dataSource.fetchProducts();
  }
}