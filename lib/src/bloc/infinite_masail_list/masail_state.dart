import 'package:ramadantimes/src/models/masail/masail/masail.dart';
import 'package:ramadantimes/src/models/masail/masail/result.dart';

enum MasailStatus { initial, success, failure }

class MasailState {
  const MasailState({
    this.status = MasailStatus.initial,
    this.posts = const <Result>[],
    // this.articleFilter = ArticleFilter.recent,
    this.hasReachedMax = false,
    this.page = 1,
  });

  final MasailStatus status;
  final List<Result> posts;
  // final ArticleFilter? articleFilter;
  final bool hasReachedMax;
  final int page;

  MasailState copyWith({
    MasailStatus? status,
    List<Result>? posts,
    // ArticleFilter? articleFilter,
    bool? hasReachedMax,
    int? page,
  }) {
    return MasailState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() {
    return '''PostState { status: $status, hasReachedMax: $hasReachedMax, posts: ${posts.length} }''';
  }

  List<Object> get props => [status, posts, hasReachedMax];
}

// class ArticleInitial extends ArticleState {}

// class ArticleFailure extends ArticleState {}

// class ArticleSuccess extends ArticleState {
//   final List<Articles> articles;
//   final bool? hasReachedMax;

//   const ArticleSuccess({
//     required this.articles,
//     this.hasReachedMax,
//   });

//   ArticleSuccess copyWith({
//     List<Articles>? articles,
//     bool? hasReachedMax,
//   }) {
//     return ArticleSuccess(
//       articles: articles ?? this.articles,
//       hasReachedMax: hasReachedMax ?? this.hasReachedMax,
//     );
//   }

//   @override
//   List<Object> get props => [articles, hasReachedMax!];

//   @override
//   String toString() =>
//       'ArticleSuccess { articles: ${articles.length}, hasReachedMax: $hasReachedMax }';
// }
