import 'package:flutter/material.dart';
import 'package:movie_db/ui/component/button.dart';
import 'package:movie_db/ui/component/item_menu.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../component/text.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<StatefulWidget> createState() => _ProfilePageState();

}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: 150,
              child: Stack(
                children: [
                  Container(
                    height: 110,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black54,
                          Colors.white,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Expanded(child: Container()),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  image: const DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage('https://assets.promediateknologi.com/crop/0x0:0x0/0x0/webp/photo/2022/12/31/3732091263.png')
                                  ),
                                  color: Colors.grey[300]
                              ),
                            ),
                          ),
                          Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  UiKitText(AppLocalizations.of(context)?.usernamePlaceholder ?? '', type: UiKitTextType.header2, isEllipsized: false),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10, right: 20),
                                    child: UiKitText(AppLocalizations.of(context)?.emailPlaceholder ?? '', type: UiKitTextType.caption1),
                                  )
                                ],
                              )
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20, bottom: 10),
              child: UiKitText(AppLocalizations.of(context)?.menuTitle ?? '', type: UiKitTextType.title1),
            ),
            UiKitItemMenu(
              text: AppLocalizations.of(context)?.aboutMenu ?? '',
              icon: Icons.info,
              onClick: () {
                _showAboutThisApp();
              },
            ),
          ],
        ),
      ),
    );
  }

  _showAboutThisApp() {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: UiKitText(AppLocalizations.of(context)?.aboutMenu ?? '', type: UiKitTextType.title1),
            content: UiKitText(
                AppLocalizations.of(context)?.descAboutMenu ?? '',
                isEllipsized: false
            ),
            actions: [
              UiKitButton(
                  text: AppLocalizations.of(context)?.close ?? '',
                  onPressed: () {
                    Navigator.pop(ctx);
                  }
              )
            ],
          );
        }
    );
  }
}