class Movie {
  Movie({
    required this.id,
    required this.title,
    required this.rating,
    required this.imageUrl,
    required this.overview,
    required this.year,
  });
  final int id;
  final String title;
  final String year;
  final double rating;
  final String overview;
  final String imageUrl;
  bool favorite = false;

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        id: json['id'],
        title: json['original_title'],
        rating: json['vote_average'].toDouble(),
        imageUrl: "https://image.tmdb.org/t/p/w500/${json['poster_path']}",
        overview: json['overview'],
        year: (json["release_date"].toString().length > 4)
            ? json["release_date"].toString().substring(0, 4)
            : "",
      );
}
