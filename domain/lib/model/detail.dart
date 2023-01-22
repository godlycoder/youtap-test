class DetailUiModel {
  final String backdropUrl;
  final String posterUrl;
  final String title;
  final double popularity;
  final dynamic voteAverage;
  final int totalVote;
  final String overview;
  final DetailType type;
  final int id;

  DetailUiModel(
      this.backdropUrl,
      this.posterUrl,
      this.title,
      this.popularity,
      this.voteAverage,
      this.totalVote,
      this.overview,
      this.type,
      this.id,
      );

}

enum DetailType {
  movie,
  tv
}