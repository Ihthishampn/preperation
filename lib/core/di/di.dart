import 'package:inter/core/dio_client/dio_client.dart';
import 'package:inter/features/products/data/data_source/data_source.dart';
import 'package:inter/features/products/data/product_repo_impl/product_repo_impl.dart';

final productRepoDi = ProductRepoImpl(DataSource(DioClient()));
