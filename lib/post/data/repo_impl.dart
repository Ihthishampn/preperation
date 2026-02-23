import 'package:inter/post/data/model/post_model.dart';
import 'package:inter/post/data/usecase/post_fetch_usecase.dart';
import 'package:inter/post/domain/post_repository.dart';

class RepoImpl implements PostRepository {
  final PostFetchUsecase remote;
  RepoImpl(this.remote);
  
  @override
  Future<List<PostModel>> postFetch(int start, int limit) {
   try {
      return remote.postFetchRemote(start,limit);
    } catch (e) {
      rethrow;
    }
  }
 
}
