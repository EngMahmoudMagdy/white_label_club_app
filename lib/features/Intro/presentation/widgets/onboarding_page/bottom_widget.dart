import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../core/util/color_resources.dart';
import '../../../../../core/util/size_config.dart';

class BottomWidget extends StatelessWidget {
  const BottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: getProportionateScreenHeight(30),
      ),
      Padding(
        padding:
        EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(24)),
        child: Column(
          children: [
            Text(('onboarding_title').tr(),
                style: const TextStyle(
                  fontSize: 42,
                  color: ColorResources.TEXT_PRIMARY_COLOR,
                  fontWeight: FontWeight.w700,
                )),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            Text(
                ('onboarding_text').tr(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  color: ColorResources.TEXT_PRIMARY_COLOR,
                  fontWeight: FontWeight.w400,
                )),
            SizedBox(
              height: getProportionateScreenHeight(40),
            ),
            GestureDetector(
                onTap: () {},
                child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(30),
                        vertical: getProportionateScreenHeight(12)),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      ("get_started").tr(),
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(14),
                        color: ColorResources.PRIMARY_COLOR,
                        fontWeight: FontWeight.w600,
                      ),
                    )))
          ],
        ),
      )
    ],);
  }
}
