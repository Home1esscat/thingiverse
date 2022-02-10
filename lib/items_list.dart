
import 'package:flutter/material.dart';
import 'package:thingiverse2/things.dart';

class ItemsList extends StatefulWidget {
  get hits => null;


  @override
  State<StatefulWidget> createState() {
    return _ItemsListState();
  }
}

class _ItemsListState extends State<ItemsList> {
  late Future<ThingsList> thingslist;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ThingsList>(
      future: thingslist,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                //elevation: 5,
                  child: ListTile(
                    title: Text(snapshot.data!.hits[index].name),
                    subtitle: Text(snapshot.data!.hits[index].id.toString()),
                    leading: Image.network(
                        snapshot.data!.hits[index].image),
                    isThreeLine: false,

                  ));
            },
            itemCount: snapshot.data!.hits.length,
          );
        } else if (snapshot.hasError) {
          return Text('Error' + snapshot.error.toString());
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  @override
  void initState() {
    thingslist = loadThings() as Future<ThingsList>;
  }
}
