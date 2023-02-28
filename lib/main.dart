import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block_getapi/blocs/cubits/post_qubits/post_cubits.dart';
import 'package:flutter_block_getapi/data/repositories/post_repository.dart';
import 'package:flutter_block_getapi/screen/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
//   PostCubit postCubit = PostCubit();

//  await postCubit.fetchPosts();
  // PostRepository postRepository = PostRepository();
  // Response response =  await postRepository.fetchPosts();
  // print("main allpost: ${response.data}");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
