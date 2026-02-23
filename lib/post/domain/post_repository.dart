import 'package:inter/post/data/model/post_model.dart';

abstract class PostRepository {
  Future<List<PostModel>> postFetch(int start,int limit);
}
