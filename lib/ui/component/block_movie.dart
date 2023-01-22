import 'package:domain/model/movie.dart';
import 'package:flutter/material.dart';
import 'package:movie_db/ui/component/text.dart';

import 'item_highlight_movie.dart';
import 'item_poster_movie.dart';

class UiKitBlockMovie extends StatelessWidget {
  final List<MovieUiModel>? list;
  final UiKitBlockMovieType type;
  final String title;
  final String? subtitle;

  const UiKitBlockMovie({
    super.key,
    required this.list,
    this.type = UiKitBlockMovieType.poster,
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
            child: UiKitText(subtitle ?? ''),
          )
        ),
        SizedBox(
          height: 250,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: list?.length ?? 5,
              itemBuilder: (_, index) {
                final data = list?[index];

                if (type == UiKitBlockMovieType.poster) {
                  return Padding(
                    padding: EdgeInsets.only(left: index == 0 ? 20 : 0),
                    child: UiKitItemPosterMovie(data: data),
                  );
                }

                return Padding(
                  padding: EdgeInsets.only(left: index == 0 ? 20 : 0),
                  child: UiKitItemHighlightMovie(data: data),
                );
              }
          )
        ),
      ],
    );
  }

}

enum UiKitBlockMovieType {
  poster,
  item,
}