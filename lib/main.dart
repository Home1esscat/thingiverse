import 'package:flutter/material.dart';
import 'package:thingiverse2/items_list.dart';
import 'package:thingiverse2/ui/page_categories.dart';
import 'package:thingiverse2/ui/page_home.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.white,
    ),
    initialRoute: '/home',
    routes: {
      '/home': (context) => PageHome(),
      '/todo': (context) => CategoriesPage()
    },
  ));
}
