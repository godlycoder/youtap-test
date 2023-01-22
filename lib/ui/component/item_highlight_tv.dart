import 'package:auto_route/auto_route.dart';
import 'package:data/data.dart';
import 'package:domain/model/tv.dart';
import 'package:flutter/material.dart';
import 'package:movie_db/router/router.gr.dart';
import 'package:movie_db/ui/component/text.dart';

class UiKitItemHighlightTv extends StatelessWidget {
  final TvUiModel? data;

  const UiKitItemHighlightTv({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    if (data != null) {
      return Padding(
        padding: const EdgeInsets.only(right: 10),
        child: GestureDetector(
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
            ),
            child: SizedBox(
                width: 150,
                height: 350,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Container(
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(data!.posterUrl)
                            )
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 5),
                      child: UiKitText(data!.title, type: UiKitTextType.title3),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(child: Container()),
                        const Padding(
                          padding: EdgeInsets.only(right: 5, top: 5, bottom: 10),
                          child: Icon(Icons.stars, color: Colors.amberAccent, size: 14),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5, right: 10, bottom: 10),
                          child: UiKitText(data!.popularity.toString(), type: UiKitTextType.caption3),
                        )
                      ],
                    )
                  ],
                )
            ),
          ),
          onTap: () {
            context.router.navigate(DetailRoute(data: data!.toDetailUiModel()));
          },
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
        ),
        child: SizedBox(
            width: 200,
            height: 350,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                        color: Colors.grey[300]
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    height: 16,
                    width: 150,
                    color: Colors.grey[300],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(child: Container()),
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Container(
                            height: 12,
                            width: 80,
                            color: Colors.grey[300]
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
        ),
      ),
    );
  }

}