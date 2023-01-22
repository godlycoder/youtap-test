import 'package:data/model/movie_dto.dart';
import 'package:data/service/api_services.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieDTO>> getNowPlayingMovies();

  Future<List<MovieDTO>> getPopularMovies();

  Future<List<MovieDTO>> getUpcomingMovies();
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  final ApiServices _apiServices;

  MovieRemoteDataSourceImpl(this._apiServices);

  @override
  Future<List<MovieDTO>> getNowPlayingMovies() async {
    final response = await _apiServices.getNowPlayingMovies();
    final result = response.data['results'] as List;

    return result.map((e) => MovieDTO.fromJson(e)).toList();
  }

  @override
  Future<List<MovieDTO>> getPopularMovies() async {
    final response = await _apiServices.getPopularMovies();
    final result = response.data['results'] as List;

    return result.map((e) => MovieDTO.fromJson(e)).toList();
  }

  @override
  Future<List<MovieDTO>> getUpcomingMovies() async {
    final response = await _apiServices.getUpcomingMovies();
    final result = response.data['results'] as List;

    return result.map((e) => MovieDTO.fromJson(e)).toList();
  }

}