import 'package:dartz/dartz.dart';
import 'package:data/datasource/tv_data_source.dart';
import 'package:data/extensions/tv_extensions.dart';
import 'package:domain/failure.dart';
import 'package:domain/model/tv.dart';
import 'package:domain/repository/tv_repository.dart';

class TvRepositoryImpl extends TvRepository {
  final TvRemoteDataSource _remoteDataSource;

  TvRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<TvUiModel>>> getOnAirTv() async {
    try {
      final result = await _remoteDataSource.getOnAirTv();

      return Right(
          result.map((e) => e.toUiModel()).toList()
      );
    } on Exception catch(e) {
      return Left(
          Failure(e.toString())
      );
    }
  }

  @override
  Future<Either<Failure, List<TvUiModel>>> getPopularTv() async {
    try {
      final result = await _remoteDataSource.getPopularTv();

      return Right(
          result.map((e) => e.toUiModel()).toList()
      );
    } on Exception catch(e) {
      return Left(
          Failure(e.toString())
      );
    }
  }

}