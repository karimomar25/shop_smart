import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:shop_smart/features/cart/presentation/cart_view.dart';
import 'package:shop_smart/features/home/presentation/home_view.dart';
import 'package:shop_smart/features/profile/presentation/profile_view.dart';
import 'package:shop_smart/features/search/presentation/search_view.dart';

class RootView extends StatefulWidget {
  const RootView({super.key});

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  late List<Widget> views;
  int currentView = 0;
  late PageController controller;
  @override
  void initState() {
    super.initState();
    views = const [
      HomeView(),
      SearchView(),
      CartView(),
      ProfileView(),
    ];
    controller = PageController(initialPage: currentView);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: views,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentView,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        // elevation: 50,
        height: kBottomNavigationBarHeight,
        onDestinationSelected: (index) {
          setState(() {
            currentView = index;
          });
          controller.jumpToPage(currentView);
        },
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(IconlyBold.home),
            icon: Icon(IconlyLight.home),
            label: "Home",
          ),
          NavigationDestination(
            selectedIcon: Icon(IconlyBold.search),
            icon: Icon(IconlyLight.search),
            label: "Search",
          ),
          NavigationDestination(
            selectedIcon: Icon(IconlyBold.bag2),
            icon: Badge(label: Text("5"), child: Icon(IconlyLight.bag2)),
            label: "Cart",
          ),
          NavigationDestination(
            selectedIcon: Icon(IconlyBold.profile),
            icon: Icon(IconlyLight.profile),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
