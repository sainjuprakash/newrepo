import 'package:dio/dio.dart';
import 'package:movie/constants.dart';
import 'package:movie/movie.dart';
import 'package:dartz/dartz.dart';
import 'constants.dart';

<<<<<<< HEAD
//const apikey = '5e7b378087369f96eacb5636df62973a';
=======

>>>>>>> dc50674672ddbae3c3582bcf95c8fe2c537cd596

class MovieService {
  final dio = Dio();

   Future<Either<String, List<Movie>>> getMovieByCategory(
      {required String apiPath, required int page}) async {
    try {
      final response = await dio
          .get(apiPath, queryParameters: {'api_key': Constants.apiKey, 'page': page});
      final data = (response.data['results'] as List)
          .map((e) => Movie.fromJson(e))
          .toList();
      //print(response.data);
      return right(data);
    } on DioError catch (err) {
      print(err.response);
      return Left(err.message.toString());
    }
  }
}
