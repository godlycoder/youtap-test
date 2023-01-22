import 'package:dartz/dartz.dart';
import 'package:domain/domain.dart';

class GetOnAirTv {
  final TvRepository _repository;

  GetOnAirTv(this._repository);

  Future<Either<Failure, List<TvUiModel>>> execute() {
    return _repository.getOnAirTv();
  }

}

class GetPopularTv {
  final TvRepository _repository;

  GetPopularTv(this._repository);

  Future<Either<Failure, List<TvUiModel>>> execute() {
    return _repository.getPopularTv();
  }

}