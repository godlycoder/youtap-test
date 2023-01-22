import 'package:dartz/dartz.dart';
import 'package:domain/domain.dart';

class GetNowPlayingMovies {
  final MovieRepository _repository;

  GetNowPlayingMovies(this._repository);

  Future<Either<Failure, List<MovieUiModel>>> execute() {
    return _repository.getNowPlayingMovies();
  }

}

class GetPopularMovies {
  final MovieRepository _repository;

  GetPopularMovies(this._repository);

  Future<Either<Failure, List<MovieUiModel>>> execute() {
    return _repository.getPopularMovies();
  }
}

class GetUpcomingMovies {
  final MovieRepository _repository;

  GetUpcomingMovies(this._repository);

  Future<Either<Failure, List<MovieUiModel>>> execute() {
    return _repository.getUpcomingMovies();
  }
}