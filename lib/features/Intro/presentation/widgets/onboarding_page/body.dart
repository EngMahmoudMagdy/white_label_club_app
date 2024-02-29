import 'package:clean_architecture/core/util/color_resources.dart';
import 'package:clean_architecture/core/util/size_config.dart';
import 'package:clean_architecture/features/Intro/presentation/widgets/onboarding_page/bottom_widget.dart';
import 'package:clean_architecture/features/Intro/presentation/widgets/onboarding_page/top_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TopWidget(),
        BottomWidget()
      ],
    );
  }
}
