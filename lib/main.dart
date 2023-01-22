import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/router/router.gr.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_db/injection.dart' as di;
import 'package:movie_db/ui/page/detail/bloc/reviews_cubit.dart';
import 'package:movie_db/ui/page/movie/bloc/movie_cubit.dart';
import 'package:movie_db/ui/page/tv/bloc/tv_cubit.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  runApp(const MyApp());
}

final _appRouter = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => di.locator<MovieCubit>()
        ),
        BlocProvider(
            create: (_) => di.locator<TvCubit>()
        ),
        BlocProvider(
            create: (_) => di.locator<ReviewsCubit>()
        ),
      ],
      child: MaterialApp.router(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true,
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
      )
    );
  }
}
