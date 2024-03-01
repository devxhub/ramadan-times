import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:ramadantimes/src/bloc/infinite_masail_list/masail_event.dart';
import 'package:ramadantimes/src/models/masail/masail/masail.dart';
import 'package:ramadantimes/src/models/masail/masail/result.dart';
import 'package:ramadantimes/src/services/api_service_masail.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../dbHelper/dbErrorHelper.dart';
import '../../dbHelper/dbHelperMasala.dart';
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
  final dbHelperMasala=DBHelp1.instance; //database initialize

  late List<Masail>localSQFMasala;

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
    var connectivityResultMasala = await (Connectivity().checkConnectivity());
    if(connectivityResultMasala==ConnectivityResult.none){
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

          localSQFMasala = await dbHelperMasala.readMasailList();//data  read here
          //noData Show
          if(localSQFMasala.isEmpty){
            return emit(state.copyWith(
              status: MasailStatus.noData,
            ));
          }

          List<List<Result>?> res=  localSQFMasala.map((e) => e.results).toList();
          print("Here is list of local result ${res.first}");

          return emit(state.copyWith(
              status: MasailStatus.success,
              posts: res.first,
              hasReachedMax: false,
              page: state.page + 14));
        }

     //refresh solve

        localSQFMasala.first.results?.isEmpty == true
            ? emit(state.copyWith(hasReachedMax: true))
            : emit(
          state.copyWith(
              status: MasailStatus.success,
              posts: List.of(state.posts),
              hasReachedMax: false,
              page: state.page +14),

        );


      } catch (_) {
        emit(state.copyWith(status: MasailStatus.failure));
      }
    }
    else{
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
          //offline Data Store
          dbHelperMasala.createMAsalaData(masails);

          return emit(state.copyWith(
              status: MasailStatus.success,
              posts: masails.results,
              hasReachedMax: false,
              page: state.page + 14));
        }

        final posts = await masailApi.getAllMaslaMasail(offset: state.page, limit: 14);

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
  }


}


