import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_db/router/router.gr.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<StatefulWidget> createState() => _DashboardPageState();

}

class _DashboardPageState extends State<DashboardPage> {

  var _selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const AutoRouter(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.movie_outlined),
            label: AppLocalizations.of(context)?.movieNavTitle,
          ),
          BottomNavigationBarItem(
              icon: const Icon(Icons.tv),
              label: AppLocalizations.of(context)?.tvNavTitle
          ),
          BottomNavigationBarItem(
              icon: const Icon(Icons.person),
              label: AppLocalizations.of(context)?.profileNavTitle
          ),
        ],
        onTap: (index) {
          PageRouteInfo<void> route;

          switch (index) {
            case 0 :
              route = const MovieRoute();
              break;
            case 1 :
              route = const TvRoute();
              break;
            default :
              route = const ProfileRoute();
              break;
          }

          context.router.navigate(route);

          setState(() {
            _selectedPageIndex = index;
          });
        },
      ),
    );
  }
}