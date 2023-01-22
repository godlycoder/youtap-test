import 'package:dartz/dartz.dart';
import 'package:domain/failure.dart';
import 'package:domain/model/tv.dart';

abstract class TvRepository {
  Future<Either<Failure, List<TvUiModel>>> getOnAirTv();

  Future<Either<Failure, List<TvUiModel>>> getPopularTv();

}