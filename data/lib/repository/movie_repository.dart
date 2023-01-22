import 'package:dartz/dartz.dart';
import 'package:data/datasource/movie_data_source.dart';
import 'package:data/extensions/movie_extensions.dart';
import 'package:domain/failure.dart';
import 'package:domain/model/movie.dart';
import 'package:domain/repository/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteDataSource _remoteDataSource;

  MovieRepositoryImpl(this._remoteDataSource);


  @override
  Future<Either<Failure, List<MovieUiModel>>> getNowPlayingMovies() async {
    try {
      final result = await _remoteDataSource.getNowPlayingMovies();

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
  Future<Either<Failure, List<MovieUiModel>>> getPopularMovies() async {
    try {
      final result = await _remoteDataSource.getPopularMovies();

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
  Future<Either<Failure, List<MovieUiModel>>> getUpcomingMovies() async {
    try {
      final result = await _remoteDataSource.getUpcomingMovies();

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