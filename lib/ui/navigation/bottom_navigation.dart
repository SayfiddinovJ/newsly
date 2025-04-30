import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsly/cubit/navigation_cubit.dart';

import 'bookmark/bookmark_screen.dart';
import 'home/home_screen.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  static final List<Widget> screens = [HomeScreen(), BookmarkScreen()];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, int>(
      builder: (context, state) {
        return Scaffold(
          body: IndexedStack(index: state, children: screens),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state,
            type: BottomNavigationBarType.fixed,
            onTap: (index) => context.read<NavigationCubit>().changePage(index),
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                icon: Icon(Icons.bookmark),
                label: 'Bookmark',
              ),
            ],
          ),
        );
      },
    );
  }
}
