import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block_getapi/blocs/cubits/post_qubits/post_state.dart';
import 'package:flutter_block_getapi/data/models/post_model.dart';
import 'package:flutter_block_getapi/data/repositories/post_repository.dart';

class PostCubit extends Cubit<PostState> {
  PostRepository postRepository = PostRepository();
  PostCubit() : super(PostLoadingState()) {
    fetchPosts();
  }

  List<PostModel> posts = [];
  List<PostModel> get getPost => posts;

  Future<void> fetchPosts() async {
    try {
      Response response = await postRepository.fetchPosts();
      print(response.statusCode);
      if (response.statusCode == 200) {
       
        response.data.forEach((e) {
          return posts.add(PostModel.fromJson(e));
        });
        emit(PostLoadedState(posts));
      } else {
        emit(PostErrorState("SomeThing went wrong!"));
      }
    } catch (e) {
      emit(PostErrorState(e.toString()));
    }
  }
}
