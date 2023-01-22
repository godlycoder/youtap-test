import 'package:auto_route/auto_route.dart';
import 'package:domain/model/detail.dart';
import 'package:flutter/material.dart';
import 'package:movie_db/ui/component/text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UiKitDetailHeader extends StatefulWidget {
  final DetailUiModel data;

  const UiKitDetailHeader({super.key, required this.data});

  @override
  State<StatefulWidget> createState() => _UiKitDetailHeader();

}

class _UiKitDetailHeader extends State<UiKitDetailHeader> {

  @override
  Widget build(BuildContext context) {
    final data = widget.data;

    return SizedBox(
      height: 380,
      child: Stack(
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        data.backdropUrl
                    )
                )
            ),
          ),
          Container(
            height: 300,
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
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 35,
                      ),
                      onTap: () {
                        context.router.navigateBack();
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Container()
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      width: 120,
                      height: 160,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(data.posterUrl)
                          )
                      ),
                    ),
                  ),
                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          UiKitText(data.title, type: UiKitTextType.header2, isEllipsized: false),
                          Padding(
                            padding: const EdgeInsets.only(top: 15, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    UiKitText(data.popularity.toString(), type: UiKitTextType.title2),
                                    UiKitText(AppLocalizations.of(context)?.popularity ?? '', type: UiKitTextType.caption1)
                                  ],
                                ),
                                Column(
                                  children: [
                                    UiKitText(data.voteAverage.toString(), type: UiKitTextType.title2),
                                    UiKitText(AppLocalizations.of(context)?.avgVote ?? '', type: UiKitTextType.caption1)
                                  ],
                                ),
                                Column(
                                  children: [
                                    UiKitText(data.totalVote.toString(), type: UiKitTextType.title2),
                                    UiKitText(AppLocalizations.of(context)?.totalVote ?? '', type: UiKitTextType.caption1)
                                  ],
                                ),
                              ],
                            ),
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
    );
  }

}