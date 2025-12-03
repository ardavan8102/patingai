import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pating_ai/consts/app_routes.dart';
import 'package:pating_ai/consts/colors.dart';
import 'package:pating_ai/consts/sizes.dart';
import 'package:pating_ai/consts/strings.dart';
import 'package:pating_ai/gen/assets.gen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 0;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 400), () {
      setState(() => _opacity = 1);
    });

    // Navigate to Main Screen
    Timer(
      Duration(seconds: 5),
      () {
        Get.offAndToNamed(AppRoutes.chatView);
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppSolidColors.darkScaffoldBackground,
      body: Stack(
        children: [
          // ----- Neon Glow Bottom -----
          Positioned(
            right: MediaQuery.of(context).size.width / 2 + AppSizes.splashGlowSize / 4,
            bottom: -AppSizes.splashGlowOverflowFromBottom,
            child: Container(
              width: AppSizes.splashGlowSize,
              height: AppSizes.splashGlowSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppSolidColors.accent.withValues(alpha: 0.6),
                    blurRadius: 150,
                    spreadRadius: 50,
                  ),
                ],
              ),
            ),
          ),

          // ----- Neon Glow Top -----
          Positioned(
            left: MediaQuery.of(context).size.width / 2 + AppSizes.splashGlowSize / 2,
            top: -AppSizes.splashGlowOverflowFromBottom,
            child: Container(
              width: AppSizes.splashGlowSize,
              height: AppSizes.splashGlowSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppSolidColors.secondary.withValues(alpha: 0.5),
                    blurRadius: 150,
                    spreadRadius: 50,
                  ),
                ],
              ),
            ),
          ),

          // ----- Content -----
          Center(
            child: AnimatedOpacity(
              opacity: _opacity,
              duration: Duration(seconds: 3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo + Brand
                  Column(
                    children: [
                      Image.asset(
                        Assets.image.logo.path,
                        width: AppSizes.splashLogoSize,
                        height: AppSizes.splashLogoSize,
                      ),

                      Text(
                        AppStrings.brandNameFa,
                        style: textTheme.headlineLarge,
                      ),

                      const SizedBox(height: 16),

                      Text(
                        AppStrings.splashBrandSubText,
                        style: textTheme.titleSmall,
                      ),

                      const SizedBox(height: 100),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
