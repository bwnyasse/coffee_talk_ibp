//TODO: 1- Doc https://flutter.dev/docs/development/data-and-backend/json
//TODO: 2- Explain update in pubspec.yaml
import 'package:json_annotation/json_annotation.dart';

//TODO: 3- Must generated with -  flutter pub run build_runner build

part 'movie.g.dart';

@JsonSerializable()
class MoviesResponse {
  int page;

  @JsonKey(name: 'total_results')
  int totalResults;

  @JsonKey(name: 'total_pages')
  int totalPages;

  @JsonKey(nullable: false, name: 'results')
  List<Movie> movies;

  MoviesResponse({
    this.page,
    this.totalPages,
    this.totalResults,
    this.movies,
  });

  factory MoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$MoviesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesResponseToJson(this);
}

//////////////////
////// ENTRY
//////////////////
@JsonSerializable()
class Movie {
  int id;

  bool video;

  @JsonKey(name: 'vote_count')
  int voteCount;

  @JsonKey(name: 'vote_average')
  double voteAverage;

  String title;

  @JsonKey(name: 'poster_path')
  String posterPath;

  @JsonKey(name: 'original_language')
  String originalLanguage;

  @JsonKey(name: 'original_title')
  String originalTitle;

  bool adult;
  String overview;

  @JsonKey(name: 'gender_ids')
  List genreIds = [];

  @JsonKey(name: 'backdrop_path')
  String backdropPath;

  double popularity;

  @JsonKey(name: 'release_date')
  String releaseDate;

  @JsonKey(defaultValue: false)
  bool favorite;

  Movie({this.id});

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
