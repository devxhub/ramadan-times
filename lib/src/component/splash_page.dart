import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      context.go("/");
    });

    super.initState();
  }

  @override
  didChangeDependencies() {
    super.didChangeDependencies();

    // _videoPlayerController.play().then((value) async {
    //   // _videoPlayerController.pause();
    //   await Future.delayed(const Duration(seconds: 4), () async {
    //     context.go('/breathingPage');
    //   });
    //   _videoPlayerController.s
    // });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: FittedBox(
        // If your background video doesn't look right, try changing the BoxFit property.
        // BoxFit.fill created the look I was going for.
        fit: BoxFit.fill,
        child: Image.asset("assets/images/Splash.png"),
      ),
    );
  }
}
