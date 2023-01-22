import 'package:data/service/api_interceptors.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiServices {
  final _dio = Dio( 
      BaseOptions(
        baseUrl: 'https://api.themoviedb.org/3',
        connectTimeout: 5000,
        receiveTimeout: 3000,
        queryParameters: {
          'api_key' : 'f49ee808a11a2146a99354eba290f927'
        }
      )
  );
  
  ApiServices() {
    _dio.interceptors
        .add(
          PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseBody: true,
            responseHeader: false,
            error: true,
            compact: true,
            maxWidth: 90
          )
    );

    _dio.interceptors.add(AppInterceptors(_dio));
  }

  Future<Response> getNowPlayingMovies() {
    return _dio.get('/movie/now_playing');
  }

  Future<Response> getUpcomingMovies() {
    return _dio.get('/movie/upcoming');
  }

  Future<Response> getPopularMovies() {
    return _dio.get('/movie/popular');
  }

  Future<Response> getOnAirTv() {
    return _dio.get('/tv/on_the_air');
  }

  Future<Response> getPopularTv() {
    return _dio.get('/tv/popular');
  }

  Future<Response> getMovieReviews(int id) {
    return _dio.get('/movie/$id/reviews');
  }

  Future<Response> getTvReviews(int id) {
    return _dio.get('/tv/$id/reviews');
  }

}