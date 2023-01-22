import 'package:domain/model/tv.dart';

abstract class TvState {}

class InitialTvState extends TvState {}

class ErrorTvState extends TvState {
  final String message;

  ErrorTvState(this.message);
}

class GetOnAirTvState extends TvState {
  final List<TvUiModel> data;

  GetOnAirTvState(this.data);
}

class GetPopularTvState extends TvState {
  final List<TvUiModel> data;

  GetPopularTvState(this.data);
}