import 'package:data/model/reviews_dto.dart';
import 'package:domain/model/reviews.dart';

extension ReviewsDTOMapper on ReviewsDTO {
  ReviewsUiModel toUiModel() {
    return ReviewsUiModel(
      author,
      content,
      createdAt,
      authorDetails?.avatarPath == null ? '' :
      'https://image.tmdb.org/t/p/w500${authorDetails?.avatarPath}'
    );
  }
}