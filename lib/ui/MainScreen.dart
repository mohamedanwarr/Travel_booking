import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelbooking/Provider/NavigationBarController/MainScreenProvider.dart';

import 'Home Screen/HomeScreen.dart';
import 'Home Screen/widgets/BottomNav.dart';
import 'OrdersScreen/Orders.dart';
import 'ProfileScreen/ProfileScreen.dart';
import 'TripScreen/TripsScreen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  List pages = [const HomeScreen(), const Trip(), const Orders(), const Profile()];


  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenProvider>(
      builder: (context, MainScreenProvider, child) {
        return Scaffold(
            backgroundColor: const Color(0xFFE2E2E2),
             body: pages[MainScreenProvider.pageIndex],
            bottomNavigationBar:BottomNav()
        );
            // const BottomNav());
      },
    );
  }
}



