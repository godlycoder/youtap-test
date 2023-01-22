import 'package:domain/model/movie.dart';

abstract class MovieState {}

class InitialMovieState extends MovieState {}

class ErrorMovieState extends MovieState {
  final String message;

  ErrorMovieState(this.message);
}

class GetNowPlayingMoviesState extends MovieState {
  final List<MovieUiModel> data;

  GetNowPlayingMoviesState(this.data);
}

class GetPopularMoviesState extends MovieState {
  final List<MovieUiModel> data;

  GetPopularMoviesState(this.data);
}

class GetUpcomingMoviesState extends MovieState {
  final List<MovieUiModel> data;

  GetUpcomingMoviesState(this.data);
}