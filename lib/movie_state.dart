import 'movie.dart';

enum MovieCategory {
  popular,
  topRated,
  upcoming,
}

class MovieState {
  final List<Movie> movies;
  final bool isLoad;
  final bool isError;
  final String errText;
  final bool isSuccess;
  final String api;
  final int page;
  final bool isLoadMore;

  MovieState({
    required this.errText,
    required this.isLoad,
    required this.isError,
    required this.isSuccess,
    required this.movies,
    required this.api,
    required this.page,
    required this.isLoadMore,
  });

  MovieState CopyWith({
    List<Movie>? movies,
    bool? isLoad,
    bool? isError,
    String? errText,
    bool? isSuccess,
    String? api,
    int? page,
    bool? isLoadmore,
  }) {
    return MovieState(
      errText: errText ?? this.errText,
      isLoad: isLoad ?? this.isLoad,
      isError: isError ?? this.isError,
      isSuccess: isSuccess ?? this.isSuccess,
      movies: movies ?? this.movies,
      api: api ?? this.api,
      page: page ?? this.page,
      isLoadMore: isLoadMore ?? this.isLoadMore,
    );
  }
}
