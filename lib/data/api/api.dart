import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class Api{
  Dio _dio = Dio(); 
  

  Api(){
    
    _dio.options.baseUrl = "https://jsonplaceholder.typicode.com/"; 
    _dio.options.contentType = 'application/json'; 
    
    // _dio.interceptors.add(PrettyDioLogger()); 
  }
  

  Future<Response>get(String url)async{
    try{
     Response response =  await _dio.get(url); 
    return response; 
    }catch(e){
      return Response(statusCode: 1,statusMessage: e.toString() ,requestOptions: RequestOptions()); 
    }
  }
  
}