import 'package:clean_architecture/core/util/color_resources.dart';
import 'package:clean_architecture/core/util/images_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColorResources.PRIMARY_COLOR,
        currentIndex: currentIndex,
        landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              ImagesPaths.HOME_ICON,
            ),
            activeIcon: SvgPicture.asset(
              ImagesPaths.HOME_ICON,
              colorFilter: const ColorFilter.mode(
                ColorResources.PRIMARY_COLOR,
                BlendMode.srcIn,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              ImagesPaths.NEWS_ICON,
            ),
            activeIcon: SvgPicture.asset(
              ImagesPaths.NEWS_ICON,
              colorFilter: const ColorFilter.mode(
                ColorResources.PRIMARY_COLOR,
                BlendMode.srcIn,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              ImagesPaths.CLUB_ICON,
            ),
            activeIcon: SvgPicture.asset(
              ImagesPaths.CLUB_ICON,
              colorFilter: const ColorFilter.mode(
                ColorResources.PRIMARY_COLOR,
                BlendMode.srcIn,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              ImagesPaths.FANS_ICON,
            ),
            activeIcon: SvgPicture.asset(
              ImagesPaths.FANS_ICON,
              colorFilter: const ColorFilter.mode(
                ColorResources.PRIMARY_COLOR,
                BlendMode.srcIn,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              ImagesPaths.MEDIA_ICON,
            ),
            activeIcon: SvgPicture.asset(
              ImagesPaths.MEDIA_ICON,
              colorFilter: const ColorFilter.mode(
                ColorResources.PRIMARY_COLOR,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
