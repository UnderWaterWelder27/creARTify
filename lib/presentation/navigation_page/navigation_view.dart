// FLUTTER LIBRARIES
import 'package:creartify/presentation/widgets/app_zoom_tap_animation.dart';
import 'package:creartify/theme/theme_app.dart';
import 'package:creartify/theme/units.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// BOTTOM NAVIGATION PAGE
import 'package:creartify/presentation/navigation_page/bloc/navigation_bloc.dart';
import 'package:creartify/presentation/navigation_page/bloc/navigation_event.dart';
import 'package:creartify/presentation/navigation_page/bloc/navigation_state.dart';
// NAVIGATION PAGES
import 'package:creartify/presentation/boards_page/boards_view.dart';
import 'package:creartify/presentation/gallery_page/gallery_view.dart';
import 'package:creartify/presentation/profile_page/profile_view.dart';
import 'package:creartify/presentation/settings_page/settings_view.dart';
import 'package:gradient_icon/gradient_icon.dart';




class NavigationView extends StatefulWidget {
  const NavigationView({super.key});
  static final ValueNotifier<int> navClickedIndexNotifier = ValueNotifier<int>(0);
  @override
  State<NavigationView> createState() => _NavigationViewState();
}



class _NavigationViewState extends State<NavigationView> {
  final List<Map<String, dynamic>> navButtonData = [
    { 'page': BoardsView(), 'icon': Icons.explore_outlined, 'index': 0 },
    { 'page': GalleryView(), 'icon': Icons.grid_view, 'index': 1 },
    { 'page': ProfileView(), 'icon': Icons.person_outline_rounded, 'index': 2 },
    { 'page': SettingsView(), 'icon': Icons.settings_outlined, 'index': 3 },
  ];

  @override
  Widget build(BuildContext context) {
    NavigationBloc navBloc = context.read<NavigationBloc>();
    BottomAppBarTheme bottomAppBarTheme = Theme.of(context).bottomAppBarTheme;
    return Scaffold(

      extendBody: true,
      body: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          return navButtonData[state.pageIndex]['page'];
        },
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: AppZoomTapAnimation(
        child: FloatingActionButton.large(
          onPressed: () {},
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: ThemeApp.gradientColors(globalColors.activeLight, globalColors.activeDark),
            ),
            child: Icon(Icons.draw_rounded, size: kIconLarge,),
          ),
        ),
      ),

      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(kRadiusXLarge),
          topRight: Radius.circular(kRadiusXLarge),
        ),
        child: BottomAppBar(
          color: bottomAppBarTheme.color,
          elevation: bottomAppBarTheme.elevation,
          shape: bottomAppBarTheme.shape,
          height: bottomAppBarTheme.height,
          notchMargin: kNotchMargin,
          clipBehavior: Clip.antiAlias,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (var item in navButtonData) ...[
                if (item['index'] == 2) SizedBox(width: 120.0),
                Expanded(
                  child: ValueListenableBuilder(
                    valueListenable: NavigationView.navClickedIndexNotifier,
                    builder: (context, currentIndex, child) {
                      return IconButton(
                        onPressed: () {
                          navBloc.add(NavigationChangedPageEvent(pageIndex: item['index']));
                          setState(() => NavigationView.navClickedIndexNotifier.value = item['index']);
                        },
                        icon: Container(
                          padding: EdgeInsets.only(bottom: kIndentSmall * 2.9),
                          child: GradientIcon(
                            icon: item['icon'],
                            gradient: NavigationView.navClickedIndexNotifier.value == item['index']
                              ? ThemeApp.gradientColors(globalColors.activeLight, globalColors.activeDark)
                              : ThemeApp.gradientColors(globalColors.inactiveLight, globalColors.inactiveDark),
                            size: kIconSmall,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ],

          ),
        ),
      ),
    );
  }
}
