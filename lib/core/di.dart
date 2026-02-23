import 'package:inter/constants/dio/dio_client.dart';
import 'package:inter/post/data/repo_impl.dart';
import 'package:inter/post/data/usecase/post_fetch_usecase.dart';
import 'package:inter/post/provider/post_provider.dart';

final postRepo = PostProvider(RepoImpl(PostFetchUsecase(DioClient())));
