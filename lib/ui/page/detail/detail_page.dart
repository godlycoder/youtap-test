import 'package:domain/model/detail.dart';
import 'package:flutter/material.dart';
import 'package:movie_db/ui/component/block_reviews.dart';
import 'package:movie_db/ui/component/detail_header.dart';
import 'package:movie_db/ui/component/text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DetailPage extends StatefulWidget {
  final DetailUiModel data;

  const DetailPage({super.key, required this.data});

  @override
  State<StatefulWidget> createState() => _DetailPageState();

}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            UiKitDetailHeader(data: widget.data),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 30, bottom: 20),
              child: UiKitText(AppLocalizations.of(context)?.overview ?? '', type: UiKitTextType.title1),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: UiKitText(
                widget.data.overview,
                type: UiKitTextType.body1,
                isEllipsized: false,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: UiKitBlockReviews(type: widget.data.type, id: widget.data.id),
            )
          ],
        ),
      ),
    );
  }
}