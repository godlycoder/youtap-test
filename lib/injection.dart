import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_db/ui/page/detail/bloc/reviews_cubit.dart';
import 'package:movie_db/ui/page/movie/bloc/movie_cubit.dart';
import 'package:movie_db/ui/page/tv/bloc/tv_cubit.dart';

final locator = GetIt.instance;

Future<void> init() async {

  initData(locator);
  initDomain(locator);

  locator.registerLazySingleton(
      () => MovieCubit(locator(), locator(), locator())
  );

  locator.registerLazySingleton(
      () => TvCubit(locator(), locator())
  );

  locator.registerLazySingleton(
          () => ReviewsCubit(locator(), locator())
  );

}