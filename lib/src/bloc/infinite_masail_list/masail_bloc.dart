import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:ramadantimes/src/bloc/infinite_masail_list/masail_event.dart';
import 'package:ramadantimes/src/models/masail/masail/masail.dart';
import 'package:ramadantimes/src/services/api_service_masail.dart';
import 'package:stream_transform/stream_transform.dart';

import 'masail_state.dart';

const throttleDuration = Duration(milliseconds: 100);

// enum ArticleFilter { mostView, recent }

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class MasailBloc extends Bloc<MasailEvent, MasailState> {
  final MasailApiServices masailApi;

  MasailBloc({required this.masailApi}) : super(const MasailState()) {
    on<MasailFetched>(
      _onMasailFetched,
      transformer: throttleDroppable(throttleDuration),
    );

    // on<ArticleFilterByNewest>(
    //   _onArticleFilterByNewest,
    //   transformer: throttleDroppable(throttleDuration),
    // );
  }

  Future<void> _onMasailFetched(
    MasailFetched event,
    Emitter<MasailState> emit,
  ) async {
    if (event.isRefreshed) {
      emit(state.copyWith(
        status: MasailStatus.initial,
        posts: [],
        hasReachedMax: false,
        page: 0,
      ));
    }
    if (state.hasReachedMax) return;
    try {
      if (state.status == MasailStatus.initial) {
        Masail masails = await masailApi.getAllMaslaMasail(
          limit: 14,
          offset: 0,
        );

        return emit(state.copyWith(
            status: MasailStatus.success,
            posts: masails.results,
            hasReachedMax: false,
            page: state.page + 14));
      }
      // print(state.articleFilter);
      final posts =
          await masailApi.getAllMaslaMasail(offset: state.page, limit: 14);
      posts.results?.isEmpty == true
          ? emit(state.copyWith(hasReachedMax: true))
          : emit(
              state.copyWith(
                  status: MasailStatus.success,
                  posts: List.of(state.posts)..addAll(posts.results ?? []),
                  hasReachedMax: false,
                  page: state.page + 14),
            );
    } catch (_) {
      emit(state.copyWith(status: MasailStatus.failure));
    }
  }

  // Future<void> _onArticleFilterByNewest(
  //   ArticleFilterByNewest event,
  //   Emitter<MasailState> emit,
  // ) async {
  //   try {
  //     emit(
  //       state.copyWith(
  //         status: MasailStatus.success,
  //         posts: List.of(state.posts)
  //           ..sort(
  //             (a, b) => a.id!.compareTo(b.id!),
  //           ),
  //         hasReachedMax: state.hasReachedMax,
  //       ),
  //     );
  //   } catch (_) {
  //     emit(state.copyWith(status: MasailStatus.failure));
  //   }
  // }
}
 

//   Future<List<Article>> _fetchArticles(int startIndex, int limit) async {
//     final response = await httpClient.get(
//         'https://jsonplaceholder.typicode.com/Articles?_start=$startIndex&_limit=$limit');
//     if (response.statusCode == 200) {
//       final data = json.decode(response.body) as List;
//       return data.map((rawArticle) {
//         return Article(
//           id: rawArticle['id'],
//           title: rawArticle['title'],
//           body: rawArticle['body'],
//         );
//       }).toList();
//     } else {
//       throw Exception('error fetching Articles');
//     }
//   }
// }
