import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_app/base/dependency/app_service.dart';
import 'package:instagram_app/base/dependency/router/utils/route_input.dart';
import 'package:instagram_app/shared/build/gen/assets.gen.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    final routerService = ref.read(AppService.router);

    Future.delayed(const Duration(seconds: 3), () {
      routerService.pushReplacement(RouteInput.auth());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.images.instagramGradient.image(width: 124, height: 124),
            const SizedBox(height: 20),
            Assets.images.instagramLogo.image(width: 124, height: 124),
          ],
        ),
      ),
    );
  }
}
