

import 'package:data/model/tv_dto.dart';
import 'package:domain/model/detail.dart';
import 'package:domain/model/tv.dart';

extension TvDTOMapper on TvDTO {
  TvUiModel toUiModel() {
    return TvUiModel(
      id,
      name,
      'https://image.tmdb.org/t/p/w500$posterPath',
      'https://image.tmdb.org/t/p/original$backdropPath',
      popularity,
      originalName,
      voteAverage,
      voteCount,
      overview
    );
  }
}

extension TvUiModelMapper on TvUiModel {
  DetailUiModel toDetailUiModel() {
    return DetailUiModel(
      backdropUrl,
      posterUrl,
      originalTitle,
      popularity,
      voteAverage,
      totalVote,
      overview,
      DetailType.tv,
      id
    );
  }
}