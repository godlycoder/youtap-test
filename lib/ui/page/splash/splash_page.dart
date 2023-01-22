import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie_db/router/router.gr.dart';
import 'package:movie_db/ui/component/text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<StatefulWidget> createState() => _SplashPageState();

}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3), (){
      context.router.navigate(const DashboardRoute());
      context.router.removeLast();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: UiKitText(
          AppLocalizations.of(context)!.appName,
          type: UiKitTextType.header1,
        ),
      ),
    );
  }
}