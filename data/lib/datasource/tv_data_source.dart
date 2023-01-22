import 'package:data/model/tv_dto.dart';
import 'package:data/service/api_services.dart';

abstract class TvRemoteDataSource {
  Future<List<TvDTO>> getOnAirTv();

  Future<List<TvDTO>> getPopularTv();

}

class TvRemoteDataSourceImpl extends TvRemoteDataSource {
  final ApiServices _apiServices;

  TvRemoteDataSourceImpl(this._apiServices);

  @override
  Future<List<TvDTO>> getOnAirTv() async {
    final response = await _apiServices.getOnAirTv();
    final result = response.data['results'] as List;

    return result.map((e) => TvDTO.fromJson(e)).toList();
  }

  @override
  Future<List<TvDTO>> getPopularTv() async {
    final response = await _apiServices.getPopularTv();
    final result = response.data['results'] as List;

    return result.map((e) => TvDTO.fromJson(e)).toList();
  }

}