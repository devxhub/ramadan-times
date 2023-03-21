import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ramadantimes/src/bloc/infinite_masail_list/masail_bloc.dart';
import 'package:ramadantimes/src/bloc/infinite_masail_list/masail_event.dart';
import 'package:ramadantimes/src/bloc/infinite_masail_list/masail_state.dart';
import 'package:ramadantimes/src/masla_masail/masail_details_page.dart';

import '../../l10n/app_localizations.dart';

class MaslaMasailPage extends StatefulWidget {
  const MaslaMasailPage({Key? key}) : super(key: key);
  @override
  State<MaslaMasailPage> createState() => _MaslaMasailPageState();
}

class _MaslaMasailPageState extends State<MaslaMasailPage> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 0.0;

  MasailBloc? _masailBloc;
  String? gender = "Male";

  // CategoryWiseArticleBloc _categoryWiseArticleBloc;
  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    _masailBloc = BlocProvider.of<MasailBloc>(context);
    // _categoryWiseArticleBloc =
    //     BlocProvider.of<CategoryWiseArticleBloc>(context);
    _masailBloc?.add(MasailFetched(
      isRefreshed: true,
    ));
    super.initState();
  }

  // Category subCategory;
  String slug = "";
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      _masailBloc?.add(MasailFetched(
        isRefreshed: false,
      ));
      // print("I am scrolling its true");
    }
  }

  @override
  Widget build(BuildContext context) {
    // SizeConfig().init(context);
    // double h = SizeConfig.safeBlockVertical;
    // double w = SizeConfig.safeBlockHorizontal;
    // final _random = Random();

    return Scaffold(
        backgroundColor: const Color(0xfff7f5ff),
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: const Color(0xff6348EB),
          title: Text(
            AppLocalizations.of(context)?.maslaMasail ?? "",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
            // physics: NeverScrollableScrollPhysics(),
            controller: _scrollController,
            // height: h,
            // margin: EdgeInsets.only(top: 20, bottom: 0),
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
                padding: const EdgeInsets.symmetric(vertical: 0),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlocBuilder<MasailBloc, MasailState>(
                      // ignore: missing_return
                      builder: (BuildContext context, MasailState state) {
                        if (state.status == MasailStatus.initial) {
                          return SizedBox(
                            height: MediaQuery.of(context).size.height - 100,
                            child: const Center(
                              child: CircularProgressIndicator.adaptive(),
                            ),
                          );
                        }
                        if (state.status == MasailStatus.failure) {
                          return const Center(
                            child: AutoSizeText('Failed to Fetch Articles'),
                          );
                        }
                        if (state.status == MasailStatus.success) {
                          if (state.posts.isEmpty) {
                            return const Center(
                              child: AutoSizeText('No Articles'),
                            );
                          }
                          // print(state.posts.length);
                          return ListView.builder(
                            // controller: _scrollController,
                            padding: const EdgeInsets.only(bottom: 20, top: 16),
                            shrinkWrap: true,
                            primary: false,
                            itemCount: state.hasReachedMax
                                ? state.posts.length
                                : state.posts.length + 1,
                            itemBuilder: (context, index) {
                              return index >= state.posts.length
                                  ? state.hasReachedMax
                                      ? const BottomLoader()
                                      : const SizedBox()
                                  : GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                MaslaMasailDetailsPage(
                                                    result: state.posts[index]),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 5),
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        child: AutoSizeText(
                                          state.posts[index].title ?? "",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge
                                              ?.copyWith(fontSize: 16),
                                        ),
                                      ),
                                    );
                            },
                          );
                        }
                        return Container();
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * .05),
                    ),
                  ],
                ))));
  }
}

class BottomLoader extends StatelessWidget {
  const BottomLoader({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const Center(
        child: SizedBox(
          width: 33,
          height: 33,
          child: CircularProgressIndicator.adaptive(
            strokeWidth: 1.5,
          ),
        ),
      ),
    );
  }
}
