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
      backdrop_path: json['backdrop_path'],
      overview: json['overview'],
      poster_path: json['poster_path'],
      release_date: json['release_date'],
      title: json['title'],
<<<<<<< HEAD
      vote_average: json['vote_average'].toString() // changing to double value
=======
      vote_average: double.tryParse(json['vote_average'].toString()) ?? 0.0 // changing to double value
>>>>>>> dc50674672ddbae3c3582bcf95c8fe2c537cd596
  );

}
}
