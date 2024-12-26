import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ramadantimes/src/models/masail/masail/result.dart';
import 'package:ramadantimes/src/services/responsive_service.dart';
import '../../l10n/app_localizations.dart';

class MaslaMasailDetailsPage extends StatefulWidget {
  const MaslaMasailDetailsPage({super.key, required this.result});
  final Result result;
  @override
  State<MaslaMasailDetailsPage> createState() => _MaslaMasailDetailsPageState();
}

class _MaslaMasailDetailsPageState extends State<MaslaMasailDetailsPage> {
  // CategoryWiseArticleBloc _categoryWiseArticleBloc;
  @override
  void initState() {
    super.initState();
  }

  // Category subCategory;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xfff7f5ff),
        appBar: AppBar(
          foregroundColor: Colors.white,
          automaticallyImplyLeading: false,
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
          actions: const [CloseButton()],
        ),
        body: SingleChildScrollView(
          // physics: NeverScrollableScrollPhysics(),

          // height: h,
          // margin: EdgeInsets.only(top: 20, bottom: 0),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12.r)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.result.title ?? "",
                  textAlign: TextAlign.left,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: isLargeScreen ? 12.sp : 8.sp),
                ),
                const Divider(),
                Html(
                  shrinkWrap: true,
                  data: widget.result.content,
                  // tagsList: Html.tags..addAll(),

                  style: {
                    "p": Style(
                      fontSize:
                          isLargeScreen ? FontSize.xxLarge : FontSize.large,
                      fontStyle: FontStyle.normal,
                      lineHeight: const LineHeight(1.5),
                    ),
                    "h5": Style(
                        fontSize: FontSize(13.3),
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold),
                    "strong": Style(
                        fontSize: FontSize.larger,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold),
                    "h1": Style(
                        fontSize: FontSize(32),
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold),
                    "h2": Style(
                        fontSize: FontSize(24),
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold),
                    "h3": Style(
                        fontSize: FontSize(19.22),
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold),
                    "h4": Style(
                        fontSize: FontSize(16),
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold),
                    "h6": Style(
                        fontSize: FontSize(12),
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold),
                    "figcaption": Style(
                        fontSize: FontSize(12), fontStyle: FontStyle.normal),
                    "title": Style(
                        fontSize: FontSize(34), fontStyle: FontStyle.normal),
                  },
                ),
                const SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        ));
  }
}
