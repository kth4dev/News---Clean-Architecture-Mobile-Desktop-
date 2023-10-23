import 'package:flutter/material.dart';
import 'package:flutter_side_menu/flutter_side_menu.dart';
import 'package:kyawthiha/core/widgets/theme_switch_widget.dart';
import 'package:kyawthiha/presentation/screens/saved_news/saved_news_screen.dart';

import '../../../core/values/constants.dart';
import '../news/news_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = SideMenuController();
  int _currentIndex = 0;
  List<Widget> screens = [const NewsScreen(), const SavedNewsScreen()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [_buildSideMenu, _buildScreens],
              ),
            ),
            const ThemeSwitchWidget(),
          ],
        ),
      ),
    );
  }

  Widget get _buildSideMenu => SideMenu(
        hasResizer: false,
        hasResizerToggle: false,
        controller: _controller,
        backgroundColor: Colors.transparent,
        mode: SideMenuMode.auto,
        builder: (data) {
          return SideMenuData(
            items: [
              if (data.isOpen) const SideMenuItemDataTitle(title: 'Our News', padding: EdgeInsetsDirectional.all(10)),
              _buildSideMenuItemData(title: "Home", icon: Icons.home_outlined, index: 0),
              _buildSideMenuItemData(title: "Favourite", icon: Icons.star_outline, index: 1),
            ],
          );
        },
      );

  Widget get _buildScreens => Expanded(child: screens[_currentIndex]);

  SideMenuItemData _buildSideMenuItemData({required String title, required IconData icon, required int index}) {
    return SideMenuItemDataTile(
        borderRadius: BorderRadius.circular(20),
        isSelected: _currentIndex == index,
        onTap: () => setState(() => _currentIndex = index),
        title: title,
        titleStyle: const TextStyle(color: Colors.black, fontFamily: robotoFonts),
        icon: Icon(icon),
        hasSelectedLine: false,
        highlightSelectedColor: Colors.green[100],
        selectedTitleStyle: const TextStyle(color: Colors.black),
        margin: const EdgeInsetsDirectional.symmetric(horizontal: 7, vertical: 2));
  }
}
