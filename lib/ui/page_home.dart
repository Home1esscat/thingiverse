import 'package:flutter/material.dart';
import 'package:thingiverse2/app_icon_icons.dart';
import 'package:thingiverse2/items_list.dart';
import 'package:thingiverse2/ui/page_categories.dart';

class PageHome extends StatefulWidget {
  const PageHome({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return PageHomeState();
  }
}

class PageHomeState extends State<PageHome> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return _createBody();
  }

  Widget _createBody() {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: const Text("Thingiverse",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 28,
                  fontWeight: FontWeight.bold)),
          actions: [
            selectedIndex == 0 ? IconButton(
              icon: const Icon(
                Icons.sort_rounded,
                color: Colors.grey,
              ),
              onPressed: () {
                // do something
              },
            ) : Container(),
            IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              onPressed: () {
                // do something
              },
            )
          ],
          backgroundColor: Colors.white),
      body: _screensHandler(),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(splashColor: Colors.transparent),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_filled,
                ),
                activeIcon: Icon(Icons.home_filled),
                label: "0w0"),
            BottomNavigationBarItem(
                icon: Icon(
                  AppIcon.categories,
                ),
                activeIcon: Icon(AppIcon.categories),
                label: "0w0"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite_border,
                ),
                activeIcon: Icon(Icons.favorite),
                label: "0w0"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle,
                ),
                activeIcon: Icon(Icons.account_circle),
                label: "0w0"),
          ],
          onTap: (int index) {
            setState(() {});
            onTapHandler(index);
          },
        ),
      ),
    );
  }

  void onTapHandler(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Widget _screensHandler() {
    switch(selectedIndex) {
      case 0: return ItemsList();
      case 1: return const CategoriesPage();
      case 2:  return const CategoriesPage();
      case 3:  return const CategoriesPage();
      default: return ItemsList();
    }
  }
}
