import 'package:auto_route/annotations.dart';
import 'package:movie_db/ui/page/dashboard/dashboard_page.dart';
import 'package:movie_db/ui/page/detail/detail_page.dart';
import 'package:movie_db/ui/page/movie/movie_page.dart';
import 'package:movie_db/ui/page/profile/profile_page.dart';
import 'package:movie_db/ui/page/splash/splash_page.dart';
import 'package:movie_db/ui/page/tv/tv_page.dart';


@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashPage, initial: true),
    AutoRoute(page: DashboardPage,
      children: [
        AutoRoute(page: MoviePage, initial: true),
        AutoRoute(page: TvPage),
        AutoRoute(page: ProfilePage)
      ]
    ),
    AutoRoute(page: DetailPage)
  ],
)
class $AppRouter {}