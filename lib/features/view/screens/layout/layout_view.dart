import 'package:flutter/material.dart';
import 'package:jotty_note_app/core/router/page_route_name.dart';
import 'package:jotty_note_app/features/view/screens/layout/profile_view/profile_view.dart';
import 'package:jotty_note_app/features/view/screens/layout/search_tap/search_tap.dart';
import 'package:jotty_note_app/features/view/screens/layout/widget/build_nav_bar_item.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/gen/assets.gen.dart';
import '../../../../core/theme_manager/app_colors.dart';
import 'favorite_view/favorite_view.dart';
import 'home_view/home_view.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  final GlobalKey<HomeViewState> homeKey = GlobalKey();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> items = [
      BottomNavigationBarItem(
        icon: Assets.icons.homeInActive.svg(),
        activeIcon: Assets.icons.home.svg(),
        label: "Home",
      ),
      BottomNavigationBarItem(icon: Icon(Icons.done), label: "Favorite"),
      BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
      BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
    ];
    List<Widget> pages = [
      HomeView(key: homeKey),
      const FavoriteView(),
      const SearchTap(),
      const ProfileView(),
    ];
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final note = await Navigator.pushNamed(
            context,
            PageRouteName.addNote,
          );
          if (note != null) {
            homeKey.currentState?.addNote(note);
          }
        },
        child: const Icon(Icons.add, color: AppColors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        color: AppColors.backgroundLight,
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BuildNavBarItem(
              onTap: () => setState(() => currentIndex = 0),
              icon: Assets.icons.homeOutline.svg(),
              activeIcon: Assets.icons.homeSolid.svg(),
              label: "Home",
              isSelected: currentIndex == 0,
            ),
            BuildNavBarItem(
              onTap: () => setState(() => currentIndex = 1),
              icon: Assets.icons.heartInActive.svg(
                width: context.wd(24),
                height: context.hg(24),
              ),
              label: "Favorite",
              isSelected: currentIndex == 1,
              activeIcon: Assets.icons.heart.svg(
                width: context.wd(24),
                height: context.hg(24),
              ),
            ),
            SizedBox(width: context.wd(40)),
            BuildNavBarItem(
              onTap: () {
                Navigator.pushNamed(context, PageRouteName.search);
              },
              icon: Assets.icons.searchInActive.svg(),
              label: "Search",
              isSelected: currentIndex == 2,
              activeIcon: Assets.icons.searchActive.svg(),
            ),
            BuildNavBarItem(
              onTap: () {
                Navigator.pushNamed(context, PageRouteName.profile);
              },
              icon: Assets.icons.settingsInActive.svg(),
              label: "Profile",
              isSelected: currentIndex == 3,
              activeIcon: Assets.icons.settingsActive.svg(),
            ),
          ],
        ),
      ),
      body: pages[currentIndex],
    );
  }
}
