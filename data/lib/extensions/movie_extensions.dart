import 'package:data/model/movie_dto.dart';
import 'package:domain/model/movie.dart';
import 'package:domain/model/detail.dart';

extension MovieDTOMapper on MovieDTO {
  MovieUiModel toUiModel() {
    return MovieUiModel(
      id,
      title,
      'https://image.tmdb.org/t/p/w500$posterPath',
      'https://image.tmdb.org/t/p/original$backdropPath',
      popularity,
      originalTitle,
      voteAverage,
      voteCount,
      overview
    );
  }
}

extension MovieUiModelMapper on MovieUiModel {
  DetailUiModel toDetailUiModel() {
    return DetailUiModel(
      backdropUrl,
      posterUrl,
      originalTitle,
      popularity,
      voteAverage,
      totalVote,
      overview,
      DetailType.movie,
      id
    );
  }
}