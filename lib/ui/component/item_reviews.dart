import 'package:domain/model/reviews.dart';
import 'package:flutter/material.dart';
import 'package:movie_db/ui/component/text.dart';

class UiKitItemReviews extends StatelessWidget {
  final ReviewsUiModel? data;
  const UiKitItemReviews({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    if (data != null) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(data!.avatarUrl)
                  ),
                  color: Colors.grey[300]
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UiKitText(data!.name, type: UiKitTextType.title3),
                UiKitText(data!.createdAt, type: UiKitTextType.caption3),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: UiKitText(data!.content, type: UiKitTextType.body2, maxLines: 3, isEllipsized: true),
                )
              ],
            )
          )
        ],
      );
    }

    return Row(
      children: [
        Container(
          width: 25,
          height: 25,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.grey[300]
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 10,
                width: 100,
                color: Colors.grey[300],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Container(
                  height: 10,
                  width: 50,
                  color: Colors.grey[300],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

}