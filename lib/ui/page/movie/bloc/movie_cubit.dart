import 'package:domain/usecase/movie_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/ui/page/movie/bloc/movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  final GetNowPlayingMovies _getNowPlayingMovies;
  final GetPopularMovies _getPopularMovies;
  final GetUpcomingMovies _getUpcomingMovies;


  MovieCubit(
      this._getNowPlayingMovies,
      this._getPopularMovies,
      this._getUpcomingMovies
      ) : super(InitialMovieState());

  void getNowPlayingMovies() async {
    final result = await _getNowPlayingMovies.execute();

    result.fold(
        (error) => emit(ErrorMovieState(error.message)),
        (data) => emit(GetNowPlayingMoviesState(data))
    );
  }

  void getPopularMovies() async {
    final result = await _getPopularMovies.execute();

    result.fold(
        (error) => emit(ErrorMovieState(error.message)),
        (data) => emit(GetPopularMoviesState(data))
    );
  }

  void getUpcomingMovies() async {
    final result = await _getUpcomingMovies.execute();

    result.fold(
        (error) => emit(ErrorMovieState(error.message)),
        (data) => emit(GetUpcomingMoviesState(data))
    );
  }

}