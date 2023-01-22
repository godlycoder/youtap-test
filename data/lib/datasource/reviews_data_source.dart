import 'package:data/model/reviews_dto.dart';
import 'package:data/service/api_services.dart';

abstract class ReviewsRemoteDataSource {
  Future<List<ReviewsDTO>> getMovieReviews(int id);

  Future<List<ReviewsDTO>> getTvReviews(int id);
}

class ReviewsRemoteDataSourceImpl extends ReviewsRemoteDataSource {
  final ApiServices _apiServices;

  ReviewsRemoteDataSourceImpl(this._apiServices);

  @override
  Future<List<ReviewsDTO>> getMovieReviews(int id) async {
    final response = await _apiServices.getMovieReviews(id);
    final result = response.data['results'] as List;

    return result.map((e) => ReviewsDTO.fromJson(e)).toList();
  }

  @override
  Future<List<ReviewsDTO>> getTvReviews(int id) async {
    final response = await _apiServices.getTvReviews(id);
    final result = response.data['results'] as List;

    return result.map((e) => ReviewsDTO.fromJson(e)).toList();
  }

}