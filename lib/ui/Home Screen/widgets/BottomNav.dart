import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:icons_flutter/icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../Provider/NavigationBarController/MainScreenProvider.dart';
import '../../../generated/l10n.dart';

class BottomNav extends StatelessWidget {
  BottomNav({
    super.key,
  });

  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Ionicons.ios_calendar,
    Icons.favorite_rounded,
    Icons.person_rounded,
  ];



  @override
  Widget build(BuildContext context) {
    List<String> listOfStrings = [
      S.of(context).home,
      S.of(context).trips,
      S.of(context).favorite,
      S.of(context).account,
    ];
    var displayWidth = MediaQuery.of(context).size.width;
    return Consumer<MainScreenProvider>(
        builder: (BuildContext context, MainScreenProvider, child) {
      return SafeArea(
        child: Container(
          margin: EdgeInsets.all(displayWidth * .05),
          height: displayWidth * .155,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.1),
                blurRadius: 30,
                offset: const Offset(0, 10),
              ),
            ],
            borderRadius: BorderRadius.circular(50),
          ),
          child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: displayWidth * .02),
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                MainScreenProvider.pageIndex = index;
                HapticFeedback.lightImpact();
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Stack(
                children: [
                  AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    width: index == MainScreenProvider.pageIndex
                        ? displayWidth * .32
                        : displayWidth * .18,
                    alignment: Alignment.center,
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                      height: index == MainScreenProvider.pageIndex
                          ? displayWidth * .12
                          : 0,
                      width: index == MainScreenProvider.pageIndex
                          ? displayWidth * .32
                          : 0,
                      decoration: BoxDecoration(
                        color: index == MainScreenProvider.pageIndex
                            ? const Color(0xFF312DA4)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    width: index == MainScreenProvider.pageIndex
                        ? displayWidth * .31
                        : displayWidth * .18,
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              width: index == MainScreenProvider.pageIndex
                                  ? displayWidth * .13
                                  : 0,
                            ),
                            AnimatedOpacity(
                              opacity:
                                  index == MainScreenProvider.pageIndex ? 1 : 0,
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              child: Text(
                                index == MainScreenProvider.pageIndex
                                    ? listOfStrings[index]
                                    : '',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              width: index == MainScreenProvider.pageIndex
                                  ? displayWidth * .03
                                  : 20,
                            ),
                            Icon(
                              listOfIcons[index],
                              size: displayWidth * .076,
                              color: index == MainScreenProvider.pageIndex
                                  ? Colors.white
                                  : Colors.black26,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
