import 'package:domain/usecase/tv_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/ui/page/tv/bloc/tv_state.dart';

class TvCubit extends Cubit<TvState> {
  final GetOnAirTv _getOnAirTv;
  final GetPopularTv _getPopularTv;


  TvCubit(this._getOnAirTv, this._getPopularTv) : super(InitialTvState());

  void getOnAirTv() async {
    final result = await _getOnAirTv.execute();

    result.fold(
        (error) => emit(ErrorTvState(error.message)),
        (data) => emit(GetOnAirTvState(data))
    );
  }

  void getPopularTv() async {
    final result = await _getPopularTv.execute();

    result.fold(
        (error) => emit(ErrorTvState(error.message)),
        (data) => emit(GetPopularTvState(data))
    );
  }

}