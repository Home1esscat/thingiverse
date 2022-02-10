import 'dart:developer';

import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _createBody();
  }

  Widget _createBody() {
    return GestureDetector(
      onTap: () {
        log("Tap Detected");
      },
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) => EntryItem(
          data[index],
        ),
      ),
    );
  }
}

class Entry {
  final String title;
  final List<Entry> children;
  Entry(this.title, [this.children = const <Entry>[]]);
}

final List<Entry> data = <Entry>[
  Entry('3D Printing', <Entry>[
    Entry('Robots'),
    Entry('Devices'),
    Entry('Models'),
    Entry('Cars'),
    Entry('Gadgets'),
  ]),
  Entry('Art', <Entry>[Entry('Flowers'), Entry('Decoration'), Entry('Forms')]),
  Entry('Fashion',
      <Entry>[Entry('Flowers'), Entry('Decoration'), Entry('Forms')]),
  Entry('Fashion', <Entry>[Entry('Empty')]),
  Entry('Gadgets', <Entry>[Entry('Empty')]),
  Entry('Hobby', <Entry>[Entry('Empty')]),
  Entry('Learning', <Entry>[Entry('Empty')]),
  Entry('Models', <Entry>[Entry('Empty')]),
  Entry('Tools', <Entry>[Entry('Empty')]),

];

class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);
  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) {
      return ListTile(
        title: Text(root.title),
      );
    }
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title),
      children: root.children.map<Widget>(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}
