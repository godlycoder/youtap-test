import 'package:domain/model/tv.dart';
import 'package:flutter/material.dart';
import 'package:movie_db/ui/component/item_highlight_tv.dart';
import 'package:movie_db/ui/component/item_poster_tv.dart';
import 'package:movie_db/ui/component/text.dart';

class UiKitBlockTv extends StatelessWidget {
  final List<TvUiModel>? list;
  final UiKitBlockTvType type;
  final String title;
  final String? subtitle;

  const UiKitBlockTv({
    super.key,
    required this.list,
    this.type = UiKitBlockTvType.poster,
    required this.title,
    this.subtitle
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 20),
          child: UiKitText(title, type: UiKitTextType.header2),
        ),
        Visibility(
            visible: subtitle != null,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 5, bottom: 15),
              child: UiKitText(subtitle ?? '', isEllipsized: false),
            )
        ),
        SizedBox(
            height: 250,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: list?.length ?? 5,
                itemBuilder: (_, index) {
                  final data = list?[index];

                  if (type == UiKitBlockTvType.poster) {
                    return Padding(
                      padding: EdgeInsets.only(left: index == 0 ? 20 : 0),
                      child: UiKitItemPosterTv(data: data),
                    );
                  }

                  return Padding(
                    padding: EdgeInsets.only(left: index == 0 ? 20 : 0),
                    child: UiKitItemHighlightTv(data: data),
                  );
                }
            )
        ),
      ],
    );
  }

}

enum UiKitBlockTvType {
  poster,
  item,
}