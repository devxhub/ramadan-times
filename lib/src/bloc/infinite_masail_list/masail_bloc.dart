import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:muslimtimespro/src/bloc/infinite_masail_list/masail_event.dart';
import 'package:muslimtimespro/src/models/masail/masail/masail.dart';
import 'package:muslimtimespro/src/models/masail/masail/result.dart';
import 'package:muslimtimespro/src/services/api_service_masail.dart';
import 'masail_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

const throttleDuration = Duration(milliseconds: 100);

// enum ArticleFilter { mostView, recent }

class MasailBloc extends Bloc<MasailEvent, MasailState> {
  final MasailApiServices masailApi;
  // final dbHelperMasala = DBHelp1.instance;

  late List<Masail> localSQFMasala;

  MasailBloc({required this.masailApi}) : super(const MasailState()) {
    on<MasailFetched>(
      _onMasailFetched,
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
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (connectivityResultMasala == ConnectivityResult.none) {
      // No internet
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
          final savedData = prefs.getString('masail_list');
          if (savedData == null || savedData.isEmpty) {
            return emit(state.copyWith(status: MasailStatus.noData));
          }

          final List<Result> savedResults = (json.decode(savedData) as List)
              .map((item) => Result.fromJson(item))
              .toList();

          return emit(state.copyWith(
            status: MasailStatus.success,
            posts: savedResults,
            hasReachedMax: false,
            page: state.page + 14,
          ));
        }

        if (state.posts.isNotEmpty) {
          emit(state.copyWith(
            status: MasailStatus.success,
            posts: List.of(state.posts),
            hasReachedMax: true,
          ));
        }
      } catch (_) {
        emit(state.copyWith(status: MasailStatus.failure));
      }
    } else {
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

          final jsonData =
              json.encode(masails.results?.map((e) => e.toJson()).toList());
          prefs.setString('masail_list', jsonData);

          return emit(state.copyWith(
            status: MasailStatus.success,
            posts: masails.results,
            hasReachedMax: false,
            page: state.page + 14,
          ));
        }

        final posts = await masailApi.getAllMaslaMasail(
          offset: state.page,
          limit: 14,
        );

        posts.results?.isEmpty == true
            ? emit(state.copyWith(hasReachedMax: true))
            : emit(
                state.copyWith(
                  status: MasailStatus.success,
                  posts: List.of(state.posts)..addAll(posts.results ?? []),
                  hasReachedMax: false,
                  page: state.page + 14,
                ),
              );
      } catch (_) {
        emit(state.copyWith(status: MasailStatus.failure));
      }
    }
  }
}
