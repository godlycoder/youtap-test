import 'author_details_dto.dart';

class ReviewsDTO {
  ReviewsDTO(
      this.author, 
      this.authorDetails, 
      this.content, 
      this.createdAt, 
      this.id, 
      this.updatedAt, 
      this.url);

  factory ReviewsDTO.fromJson(dynamic json) {
    return ReviewsDTO(
      json['author'],
      json['author_details'] != null ? AuthorDetailsDTO.fromJson(json['author_details']) : null,
      json['content'],
      json['created_at'],
      json['id'],
      json['updated_at'],
      json['url'],
    );
  }
  final String author;
  final AuthorDetailsDTO? authorDetails;
  final String content;
  final String createdAt;
  final String id;
  final String updatedAt;
  final String url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['author'] = author;
    if (authorDetails != null) {
      map['author_details'] = authorDetails?.toJson();
    }
    map['content'] = content;
    map['created_at'] = createdAt;
    map['id'] = id;
    map['updated_at'] = updatedAt;
    map['url'] = url;
    return map;
  }

}