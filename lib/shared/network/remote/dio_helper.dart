import 'package:dio/dio.dart';



// Project News API
 class DioHelper
 {
  static late  Dio  dio;
 static init(){
     dio=Dio(BaseOptions(
     baseUrl: 'https://newsapi.org/',
     receiveDataWhenStatusError: true
   ));
   print(dio);
 }

 static Future<Response> getData({ required String url,required Map<String,dynamic> query })async{

 return await dio.get(url,queryParameters: query);

 }


 }






// -----------ShopAPI Project------------
// class DioHelper
// {
//   static late Dio dio;
//   static init(){
//     dio=Dio(BaseOptions(
//         baseUrl: 'https://student.valuxapps.com/api/',
//         receiveDataWhenStatusError: true,
//         headers: {
//           'Content-Type':'application/json',
//           'lang':'en'
//             }
//     ));
//     print(dio.toString());
//   }
//   static Future<Response> getData({ required String url,required Map<String,dynamic> query })async{
//
//     return await dio.get(url,queryParameters: query);
//
//   }
//
//
//   static Future<Response> postData({required String url,
//     required Map<String,dynamic> data,
//      Map<String,dynamic> ?query})async{
//     return await dio.post(url,
//         data: data,
//     queryParameters: query
//     );
//   }
//
// }
