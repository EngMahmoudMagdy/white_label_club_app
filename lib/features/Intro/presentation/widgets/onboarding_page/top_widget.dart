import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/util/color_resources.dart';
import '../../../../../core/util/images_paths.dart';
import '../../../../../core/util/size_config.dart';

class TopWidget extends StatelessWidget {
  const TopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: getProportionateScreenHeight(402),
          child:
          Image.asset(ImagesPaths.ONBOARDING_IMAGE, fit: BoxFit.cover),
        ),
        Positioned.fill(
            bottom: 0,
            child: Container(
                height: getProportionateScreenHeight(402),
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0x001c4180), ColorResources.PRIMARY_COLOR],
                    )))),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              width: getProportionateScreenWidth(70),
              height: getProportionateScreenHeight(80),
              child: SvgPicture.asset(
                ImagesPaths.LOGO_PATH,
              ),
            ))
      ],
    );
  }
}
