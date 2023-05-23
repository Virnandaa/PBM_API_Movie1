class MovieDet {
  MovieDet({
    required this.id,
    required this.title,
    required this.rating,
    required this.genres,
    required this.imageUrl,
    required this.overview,
    required this.year,
    required this.votecount,
  });
  final int id;
  final String title;
  final List<String> genres;
  final String year;
  final double rating;
  final String overview;
  final String imageUrl;
  final int votecount;

  factory MovieDet.fromJson(
          Map<String, dynamic> json, List<String> genreList) =>
      MovieDet(
          id: json['id'],
          title: json['original_title'],
          rating: json['vote_average'],
          genres: genreList,
          votecount: json['vote_count'],
          imageUrl: "https://image.tmdb.org/t/p/w500/${json['poster_path']}",
          overview: json['overview'],
          year: (json["release_date"].toString().length > 4)
              ? json["release_date"].toString().substring(0, 4)
              : "");
}
