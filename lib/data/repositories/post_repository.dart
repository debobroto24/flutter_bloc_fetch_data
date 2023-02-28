import 'package:dio/dio.dart';
import 'package:flutter_block_getapi/data/api/api.dart';
import 'package:flutter_block_getapi/data/models/post_model.dart';

class PostRepository {
  Api api = Api();

  List<PostModel> allposts = [];
  List<PostModel> get getPosts => allposts;
  Future<Response> fetchPosts() async {
   Response response = await api.get("/posts"); 
   return response;
  }
}
