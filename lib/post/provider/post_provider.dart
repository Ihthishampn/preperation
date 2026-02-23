import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:inter/core/app_state.dart';
import 'package:inter/post/data/model/post_model.dart';
import 'package:inter/post/domain/post_repository.dart';

class PostProvider with ChangeNotifier {
  final PostRepository repo;
  PostProvider(this.repo);

  List<PostModel> list = [];
  AppState state = AppState.initial;
  String? error;
  int start = 0;
  int limit = 20;

  Future<void> handleFetch() async {
    if (state == AppState.loading) return;
    error = null;
    state = AppState.loading;
    notifyListeners();

    try {
      final res = await repo.postFetch(start,limit);

      list.addAll(res);
      state = AppState.success;
      log("success $res");
    } catch (e) {
      error = e.toString();
      log("exception error aann njn ttoo $e");
      state = AppState.error;
    }
    notifyListeners();
  }
}
