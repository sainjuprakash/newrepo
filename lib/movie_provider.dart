import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie/api.dart';
import 'package:movie/movie_service.dart';
import 'movie_state.dart';

final movieProvider = StateNotifierProvider<MovieProvider, MovieState>((ref) =>
    MovieProvider(MovieState(
        errText: 'NO ERROR',
        isLoad: false,
        isError: false,
        isSuccess: false,
        movies: [],
        api: API.getPopular,
        page: 1)));

class MovieProvider extends StateNotifier<MovieState> {
  MovieProvider(super.state){
   getMovieByCategory();
  }

  Future<void> getMovieByCategory() async {
    state = state.CopyWith(isLoad: true, isError: false, isSuccess: false);
    final response = await MovieService().getMovieByCategory(
        apiPath: state.api, page: state.page);
    response.fold(
      (l) => state = state.CopyWith(
          isSuccess: false,
          isError: true,
          errText: l,
          isLoad: false,
          movies: []),
      (r) => state = state.CopyWith(
          isSuccess: true,
          isError: false,
          errText: '',
          isLoad: false,
          movies: r),
    );
  }
}
