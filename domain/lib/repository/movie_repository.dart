import 'package:dartz/dartz.dart';
import 'package:domain/failure.dart';
import 'package:domain/model/movie.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<MovieUiModel>>> getNowPlayingMovies();

  Future<Either<Failure, List<MovieUiModel>>> getPopularMovies();

  Future<Either<Failure, List<MovieUiModel>>> getUpcomingMovies();
}