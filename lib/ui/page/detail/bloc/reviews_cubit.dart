import 'package:domain/usecase/reviews_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/ui/page/detail/bloc/reviews_state.dart';

class ReviewsCubit extends Cubit<ReviewsState> {
  final GetMovieReviews _getMovieReviews;
  final GetTvReviews _getTvReviews;

  ReviewsCubit(this._getMovieReviews, this._getTvReviews) : super(InitialReviewsState());

  void getMovieReviews(int id) async {
    emit(LoadingReviewsState());

    final result = await _getMovieReviews.execute(id);

    result.fold(
      (error) => emit(ErrorReviewsState(error.message)),
      (data) => emit(GetReviewsState(data))
    );
  }

  void getTvReviews(int id) async {
    emit(LoadingReviewsState());

    final result = await _getTvReviews.execute(id);

    result.fold(
      (error) => emit(ErrorReviewsState(error.message)),
      (data) => emit(GetReviewsState(data))
    );
  }

}