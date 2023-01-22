// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:domain/model/detail.dart' as _i9;
import 'package:flutter/material.dart' as _i8;

import '../ui/page/dashboard/dashboard_page.dart' as _i2;
import '../ui/page/detail/detail_page.dart' as _i3;
import '../ui/page/movie/movie_page.dart' as _i4;
import '../ui/page/profile/profile_page.dart' as _i6;
import '../ui/page/splash/splash_page.dart' as _i1;
import '../ui/page/tv/tv_page.dart' as _i5;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashPage(),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.DashboardPage(),
      );
    },
    DetailRoute.name: (routeData) {
      final args = routeData.argsAs<DetailRouteArgs>();
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.DetailPage(
          key: args.key,
          data: args.data,
        ),
      );
    },
    MovieRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.MoviePage(),
      );
    },
    TvRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.TvPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.ProfilePage(),
      );
    },
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i7.RouteConfig(
          DashboardRoute.name,
          path: '/dashboard-page',
          children: [
            _i7.RouteConfig(
              MovieRoute.name,
              path: '',
              parent: DashboardRoute.name,
            ),
            _i7.RouteConfig(
              TvRoute.name,
              path: 'tv-page',
              parent: DashboardRoute.name,
            ),
            _i7.RouteConfig(
              ProfileRoute.name,
              path: 'profile-page',
              parent: DashboardRoute.name,
            ),
          ],
        ),
        _i7.RouteConfig(
          DetailRoute.name,
          path: '/detail-page',
        ),
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i7.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.DashboardPage]
class DashboardRoute extends _i7.PageRouteInfo<void> {
  const DashboardRoute({List<_i7.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          path: '/dashboard-page',
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i3.DetailPage]
class DetailRoute extends _i7.PageRouteInfo<DetailRouteArgs> {
  DetailRoute({
    _i8.Key? key,
    required _i9.DetailUiModel data,
  }) : super(
          DetailRoute.name,
          path: '/detail-page',
          args: DetailRouteArgs(
            key: key,
            data: data,
          ),
        );

  static const String name = 'DetailRoute';
}

class DetailRouteArgs {
  const DetailRouteArgs({
    this.key,
    required this.data,
  });

  final _i8.Key? key;

  final _i9.DetailUiModel data;

  @override
  String toString() {
    return 'DetailRouteArgs{key: $key, data: $data}';
  }
}

/// generated route for
/// [_i4.MoviePage]
class MovieRoute extends _i7.PageRouteInfo<void> {
  const MovieRoute()
      : super(
          MovieRoute.name,
          path: '',
        );

  static const String name = 'MovieRoute';
}

/// generated route for
/// [_i5.TvPage]
class TvRoute extends _i7.PageRouteInfo<void> {
  const TvRoute()
      : super(
          TvRoute.name,
          path: 'tv-page',
        );

  static const String name = 'TvRoute';
}

/// generated route for
/// [_i6.ProfilePage]
class ProfileRoute extends _i7.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: 'profile-page',
        );

  static const String name = 'ProfileRoute';
}
