import 'package:dartz/dartz.dart';
import 'package:data/datasource/reviews_data_source.dart';
import 'package:data/extensions/reviews_extensions.dart';
import 'package:domain/failure.dart';
import 'package:domain/model/reviews.dart';
import 'package:domain/repository/reviews_repository.dart';

class ReviewsRepositoryImpl extends ReviewsRepository {
  final ReviewsRemoteDataSource _remoteDataSource;

  ReviewsRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<ReviewsUiModel>>> getMovieReviews(int id) async {
    try {
      final result = await _remoteDataSource.getMovieReviews(id);

      return Right(
          result.map((e) => e.toUiModel()).toList()
      );
    } on Exception catch(e) {
      return Left(
          Failure(e.toString())
      );
    }
  }

  @override
  Future<Either<Failure, List<ReviewsUiModel>>> getTvReviews(int id) async {
    try {
      final result = await _remoteDataSource.getTvReviews(id);

      return Right(
          result.map((e) => e.toUiModel()).toList()
      );
    } on Exception catch(e) {
      return Left(
          Failure(e.toString())
      );
    }
  }

}