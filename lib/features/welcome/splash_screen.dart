import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:care453/core/utils/asset_utils/image_util.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import '../auth/Handler/auth_handler.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {



  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen.withScreenFunction(
      splash: LocalImageConstants.care453Logo,
      splashIconSize: 100,
      screenFunction: () async {
        return const AuthHandler();
      },
      splashTransition: SplashTransition.rotationTransition,
    );
  }
}
