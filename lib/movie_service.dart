import 'package:dio/dio.dart';
import 'package:movie/movie.dart';
import 'package:dartz/dartz.dart';
import 'constants.dart';

//const apikey = '5e7b378087369f96eacb5636df62973a';

class MovieService {
  static final dio = Dio();

  static Future<Either<String, List<Movie>>> getMovieByCategory(
      {required String apiPath, required int page}) async {
    try {
      final response = await dio
          .get(apiPath, queryParameters: {'api_key': Constants.apiKey, 'page': page});
      final data = (response.data['results'] as List)
          .map((e) => Movie.fromJson(e))
          .toList();
      print(response.data);
      return right(data);
    } on DioError catch (err) {
      print(err.response);
      return Left(err.message.toString());
    }
  }

  static Future<Either<String, List<Movie>>> getSearchMovie(
      {required String apiPath, required String queryText}) async {
    try {
      final response = await dio
          .get(apiPath, queryParameters: {
            'api_key': Constants.apiKey,
        'query': queryText,
          });
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
