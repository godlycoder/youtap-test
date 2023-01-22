import 'package:dartz/dartz.dart';
import 'package:domain/domain.dart';

import '../repository/reviews_repository.dart';

class GetMovieReviews {
  final ReviewsRepository _repository;

  GetMovieReviews(this._repository);

  Future<Either<Failure, List<ReviewsUiModel>>> execute(int id) {
    return _repository.getMovieReviews(id);
  }

}

class GetTvReviews {
  final ReviewsRepository _repository;

  GetTvReviews(this._repository);

  Future<Either<Failure, List<ReviewsUiModel>>> execute(int id) {
    return _repository.getTvReviews(id);
  }
}