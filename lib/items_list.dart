import 'package:flutter/material.dart';
import 'package:thingiverse2/api/things_api.dart';
import 'package:thingiverse2/models/top_things_fifteen.dart';

class ItemsList extends StatefulWidget {
  get hits => null;


  @override
  State<StatefulWidget> createState() {
    return _ItemsListState();
  }
}

class _ItemsListState extends State<ItemsList> {
  late Future<TopThings> thingslist;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TopThings>(
      future: thingslist,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                //elevation: 5,
                  child: ListTile(
                    title: Text(snapshot.data!.hits![index].createdAt!),
                    subtitle: Text(snapshot.data!.hits![index].id.toString()),
                    leading: Image.network(
                        snapshot.data!.hits![index].previewImage!),
                    isThreeLine: false,

                  ));
            },
            itemCount: snapshot.data!.hits!.length,
          );
        } else if (snapshot.hasError) {
          return Text('Error' + snapshot.error.toString());
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  @override
  void initState() {
    thingslist = ThingsApi().getTopList(2);
  }
}
