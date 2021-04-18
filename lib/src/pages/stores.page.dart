import 'package:flutter/material.dart';
import '../models/store.model.dart';
import '../services/http.store.service.dart';

class StoresPages extends StatelessWidget {
  const StoresPages({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pushNamed(context, 'home')),
        title: Text('Tiendas'),
      ),
      body: Center(
          child: FutureBuilder(
              future: StoreService.getAllStores(),
              builder: (context, AsyncSnapshot<List<StoreItem>> snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 2),
                    child: ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey[400],
                                  offset: Offset(1.0, 1.0),
                                  blurRadius: 2.0,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(3),
                              color: Colors.white,
                            ),
                            margin: EdgeInsets.all(5),
                            child: ListTile(
                                title: Text(snapshot.data[index].storeName),
                                trailing: Icon(Icons.arrow_forward_ios),
                                onTap: () => Navigator.pushNamed(
                                    context, 'editStore',
                                    arguments: snapshot.data[index])),
                          );
                        }),
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error'));
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              })),
    );
  }
}
