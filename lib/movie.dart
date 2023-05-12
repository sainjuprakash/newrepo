class Movie {

  final String backdrop_path;
  final int id;
  final String overview;
  final String poster_path;
  final String release_date;
  final String title;
  final String vote_average;

  Movie({
    required this.id,
    required this.backdrop_path,
    required this.overview,
    required this.poster_path,
    required this.release_date,
    required this.title,
    required this.vote_average,
  });

factory Movie.fromJson(Map<String, dynamic> json){
  return Movie(
      id: json['id'],
      backdrop_path: json['backdrop_path'].toString(),
      overview: json['overview'],
      poster_path: json['poster_path'].toString(),
      release_date: json['release_date'].toString(),
      title: json['title'].toString(),
      vote_average: json['vote_average'].toString() // changing to double value// changing to double value

  );

}
}
