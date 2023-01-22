class TvDTO {
  TvDTO(
      this.backdropPath, 
      this.firstAirDate, 
      this.genreIds, 
      this.id, 
      this.name, 
      this.originCountry, 
      this.originalLanguage, 
      this.originalName, 
      this.overview, 
      this.popularity, 
      this.posterPath, 
      this.voteAverage, 
      this.voteCount);

  factory TvDTO.fromJson(dynamic json) {
    return TvDTO(
      json['backdrop_path'] ?? '',
      json['first_air_date'],
      json['genre_ids'].cast<int>() ?? [],
      json['id'],
      json['name'],
      json['origin_country'] != null ? json['origin_country'].cast<String>() : [],
      json['original_language'],
      json['original_name'],
      json['overview'],
      json['popularity'],
      json['poster_path'],
      json['vote_average'],
      json['vote_count'],
    );
  }
  final String backdropPath;
  final String firstAirDate;
  final List<int> genreIds;
  final int id;
  final String name;
  final List<String> originCountry;
  final String originalLanguage;
  final String originalName;
  final String overview;
  final double popularity;
  final String posterPath;
  final dynamic voteAverage;
  final int voteCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['backdrop_path'] = backdropPath;
    map['first_air_date'] = firstAirDate;
    map['genre_ids'] = genreIds;
    map['id'] = id;
    map['name'] = name;
    map['origin_country'] = originCountry;
    map['original_language'] = originalLanguage;
    map['original_name'] = originalName;
    map['overview'] = overview;
    map['popularity'] = popularity;
    map['poster_path'] = posterPath;
    map['vote_average'] = voteAverage;
    map['vote_count'] = voteCount;
    return map;
  }

}