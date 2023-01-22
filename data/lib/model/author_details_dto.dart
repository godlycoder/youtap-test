class AuthorDetailsDTO {
  AuthorDetailsDTO(
      this.name, 
      this.username, 
      this.avatarPath, 
      this.rating,);

  factory AuthorDetailsDTO.fromJson(dynamic json) {
    return AuthorDetailsDTO (
        json['name'],
        json['username'],
        json['avatar_path'],
        json['rating']
    );
  }

  final String name;
  final String username;
  final dynamic avatarPath;
  final dynamic rating;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['username'] = username;
    map['avatar_path'] = avatarPath;
    map['rating'] = rating;
    return map;
  }

}