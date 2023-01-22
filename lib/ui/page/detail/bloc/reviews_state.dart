import 'package:domain/model/reviews.dart';

abstract class ReviewsState {}

class InitialReviewsState extends ReviewsState {}

class ErrorReviewsState extends ReviewsState {
  final String message;

  ErrorReviewsState(this.message);
}

class LoadingReviewsState extends ReviewsState {}

class GetReviewsState extends ReviewsState {
  final List<ReviewsUiModel> data;

  GetReviewsState(this.data);
}