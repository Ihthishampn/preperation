import 'package:inter/constants/dio/dio_client.dart';
import 'package:inter/core/base_url.dart';
import 'package:inter/post/data/model/post_model.dart';

class PostFetchUsecase {
  final DioClient dio;
  PostFetchUsecase(this.dio);
  Future<List<PostModel>> postFetchRemote(int start,int limit) async {
    try {
      final res = await dio.dio.get(BaseUrl.postUrl,queryParameters: {"_start":start,"_limit":limit});

      final List posts = res.data;
      return posts.map((e) => PostModel.fromJson(e),).toList();
    } catch (e) {
      rethrow;
    }
  }
}



// https://jsonplaceholder.typicode.com/posts?_start=0&_limit=10