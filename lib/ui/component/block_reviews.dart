import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/ui/component/block_empty.dart';
import 'package:movie_db/ui/component/item_reviews.dart';
import 'package:movie_db/ui/component/text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_db/ui/page/detail/bloc/reviews_cubit.dart';
import 'package:movie_db/ui/page/detail/bloc/reviews_state.dart';

class UiKitBlockReviews extends StatefulWidget {
  final DetailType type;
  final int id;

  const UiKitBlockReviews({super.key, required this.type, required this.id});

  @override
  State<StatefulWidget> createState() => _UiKitBlockReviewsState();

}

class _UiKitBlockReviewsState extends State<UiKitBlockReviews> {

  @override
  void initState() {
    final bloc = BlocProvider.of<ReviewsCubit>(context);

    if (widget.type == DetailType.movie) {
      bloc.getMovieReviews(widget.id);
    } else {
      bloc.getTvReviews(widget.id);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 20, bottom: 10),
          child: UiKitText(AppLocalizations.of(context)?.reviews ?? '', type: UiKitTextType.title1),
        ),
        BlocBuilder<ReviewsCubit, ReviewsState>(
          builder: (_, state) {
            if (state is GetReviewsState) {

              final list = state.data;

              if (list.isEmpty) {
                return const UiKitBlockEmpty();
              }

              return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: list.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                      child: UiKitItemReviews(data: list[index]),
                    );
                  }
              );
            }

            return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (_, index) {
                  return const Padding(
                    padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                    child: UiKitItemReviews(data: null),
                  );
                }
            );
          }
        )
      ],
    );
  }
}