import 'package:dartz/dartz.dart';
import 'package:domain/failure.dart';
import 'package:domain/model/reviews.dart';

abstract class ReviewsRepository {

  Future<Either<Failure, List<ReviewsUiModel>>> getMovieReviews(int id);

  Future<Either<Failure, List<ReviewsUiModel>>> getTvReviews(int id);
}