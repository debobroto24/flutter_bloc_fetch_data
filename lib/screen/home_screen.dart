import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block_getapi/blocs/cubits/post_qubits/post_cubits.dart';
import 'package:flutter_block_getapi/blocs/cubits/post_qubits/post_state.dart';
import 'package:flutter_block_getapi/data/models/post_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(  

        title: Text("Fetch data using bloc/cubit"), 
      ), 
      body: BlocBuilder<PostCubit,PostState>(
      
        builder: (context , state){
          print("state is : ${state}");
          if(state is PostLoadingState){
            return Center(child: CircularProgressIndicator());
          } 
          if(state is PostLoadedState){
            List<PostModel> posts = state.posts; 
            if(posts.isEmpty){
              return const  Center(child:Text("List is Empty")); 
            }
            return PostCard(posts: posts);
          }
          
            return Center(child: Text("An Error"),);
          
      }), 
    );
  }
}

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
    required this.posts,
  });

  final List<PostModel> posts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length, 
      itemBuilder: (context,index){
       PostModel post = posts[index]; 
        return Card(  
          child: ListTile(
            title:Text(post.title.toString()), 
            subtitle: Text(post.body.toString()),
            trailing: Text(post.id.toString()),
          ),
        ); 
      },
    );
  }
}