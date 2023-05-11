import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:movie/home.dart';

// Future<String> getSome() async{
//   return Future.delayed(const Duration(seconds: 2),(){
//     return 'hello World';
//   });
// }
//
// Future getNews() async {
//   final dio = Dio();
//   try {
//     final response = await dio.get(
//         'https://reuters-business-and-financial-news.p.rapidapi.com/article-date/01-04-2021',
//         queryParameters: {
//           'q': 'covid',
//           'lang': 'en',
//           'media': 'True'
//         },
//
//         options: Options(
//           headers: {
//             'X-RapidAPI-Key': 'b9fb849a82msh6d312a6208b2aaap194f63jsnac5f6c30d817',
//             'X-RapidAPI-Host': 'covid-19-news.p.rapidapi.com'
//           },
//
//         ));
//     return response.data;
//   }on DioError catch(err){
//     return err.response;
//
//   }
// }
//
// Future topRated() async {
//   final dio = Dio();
//   try {
//     final response = await dio.get(
//         'https://api.themoviedb.org/3/movie/top_rated',
//         queryParameters: {
//           'api_key':'5e7b378087369f96eacb5636df62973a'
//         }
//     );
//     return response.data;
//   }on DioError catch(err){
//     return err.response;
//
//   }
// }


void main(){
  runApp(const ProviderScope(child: Myapp()));
// //getSome().then((value) => print(value)).catchError((err)=>print(err));
//   try{
//     final response= await getSome();
//     print(response);
//
//   }catch(err){
//
//
//   }
// final data= await getNews();
// print(data);

// final data1= await topRated();
// print(data1);
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
