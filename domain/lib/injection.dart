import 'package:domain/domain.dart';
import 'package:get_it/get_it.dart';

Future<void> initDomain(GetIt locator) async {

  locator.registerLazySingleton(() => GetNowPlayingMovies(locator()));
  locator.registerLazySingleton(() => GetPopularMovies(locator()));
  locator.registerLazySingleton(() => GetUpcomingMovies(locator()));

  locator.registerLazySingleton(() => GetOnAirTv(locator()));
  locator.registerLazySingleton(() => GetPopularTv(locator()));

  locator.registerLazySingleton(() => GetMovieReviews(locator()));
  locator.registerLazySingleton(() => GetTvReviews(locator()));

}