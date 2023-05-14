import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie/movie_state.dart';
import 'package:movie/api.dart';

import 'movie_service.dart';

final searchProvider = StateNotifierProvider<MovieProvider, MovieState>((ref) =>
    MovieProvider(MovieState(
        errText: '',
        isLoad: false,
        isError: false,
        isSuccess: false,
        movies: [],
        api: api.getSearch,
        page: 1,
    isLoadMore: false)));

class MovieProvider extends StateNotifier<MovieState> {
  MovieProvider(super.state);

  Future<void> getSearchMovie({required String query}) async {
    state = state.CopyWith(isLoad: true, isError: false, isSuccess: false);
    final response = await MovieService.getSearchMovie(apiPath: state.api, queryText: query);
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
