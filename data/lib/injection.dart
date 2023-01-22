import 'package:data/datasource/movie_data_source.dart';
import 'package:data/datasource/reviews_data_source.dart';
import 'package:data/datasource/tv_data_source.dart';
import 'package:data/repository/movie_repository.dart';
import 'package:data/repository/reviews_repository.dart';
import 'package:data/repository/tv_repository.dart';
import 'package:data/service/api_services.dart';
import 'package:domain/repository/movie_repository.dart';
import 'package:domain/repository/reviews_repository.dart';
import 'package:domain/repository/tv_repository.dart';
import 'package:get_it/get_it.dart';

Future<void> initData(GetIt locator) async {

  final apiServices = ApiServices();

  locator.registerLazySingleton(() => apiServices);

  locator.registerLazySingleton<MovieRemoteDataSource>(
          () => MovieRemoteDataSourceImpl(locator())
  );
  locator.registerLazySingleton<MovieRepository>(
          () => MovieRepositoryImpl(locator())
  );

  locator.registerLazySingleton<TvRemoteDataSource>(
          () => TvRemoteDataSourceImpl(locator())
  );
  locator.registerLazySingleton<TvRepository>(
          () => TvRepositoryImpl(locator())
  );

  locator.registerLazySingleton<ReviewsRemoteDataSource>(
          () => ReviewsRemoteDataSourceImpl(locator())
  );
  locator.registerLazySingleton<ReviewsRepository>(
          () => ReviewsRepositoryImpl(locator())
  );

}