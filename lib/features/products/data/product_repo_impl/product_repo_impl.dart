import 'package:inter/features/products/data/data_source/data_source.dart';
import 'package:inter/features/products/data/model/product_model.dart';
import 'package:inter/features/products/domain/repo/product_repo.dart';

class ProductRepoImpl implements ProductRepo {
  final DataSource remote;
  ProductRepoImpl(this.remote);

  @override
  Future<List<ProductModel>> fetchProducts() {
    return remote.fetchDataSouece();
  }
}
