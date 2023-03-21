import 'package:equatable/equatable.dart';

abstract class MasailEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class MasailFetched extends MasailEvent {
  // final ArticleFilter? articleFilter;
  final bool isRefreshed;
  MasailFetched({this.isRefreshed = false});
}

class ArticleFilterByMostView extends MasailEvent {}

class ArticleFilterByNewest extends MasailEvent {}
