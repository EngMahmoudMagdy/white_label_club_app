import 'package:flutter/material.dart';

import '../../../../core/util/color_resources.dart';
import '../widgets/onboarding_page/body.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor:  ColorResources.PRIMARY_COLOR,
      body: Body(),
    );
  }
}
