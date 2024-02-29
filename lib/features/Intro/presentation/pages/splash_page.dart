import 'package:clean_architecture/core/util/color_resources.dart';
import 'package:clean_architecture/core/util/size_config.dart';
import 'package:clean_architecture/features/Intro/presentation/widgets/splash_page/body.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void initState() {
    Future.delayed(const Duration(seconds: 2), () async {
      context.go('/onboarding_page');
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      backgroundColor: ColorResources.PRIMARY_COLOR,
      body: Body(),
    );
  }
}
