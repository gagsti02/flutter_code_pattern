import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecpay/routes/router.gr.dart';
import 'package:flutter_ecpay/view_model/home_viewmodel.dart';
import 'package:provider/provider.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      appBarBuilder: (c, r) => AppBar(),
      routes: const [
        DashboardRoute(),
        MySukiRoute(),
        MyKitaRoute(),
        ProfileRoute()
      ],
      bottomNavigationBuilder: (c, t) => BottomNavigationBar(
          currentIndex: c.read<HomeViewModel>().currentPage,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black54,
          showUnselectedLabels: true,
          onTap: (value) {
            t.setActiveIndex(value);
            c.read<HomeViewModel>().changePage(value);
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_box_outlined),
                activeIcon: Icon(Icons.account_box),
                label: "My Suki"),
            BottomNavigationBarItem(
                icon: Icon(Icons.money_outlined),
                activeIcon: Icon(Icons.money),
                label: "My Kita"),
            BottomNavigationBarItem(
                icon: Icon(Icons.more_horiz_outlined),
                activeIcon: Icon(Icons.more_horiz),
                label: "More")
          ]),
    );
  }
}
