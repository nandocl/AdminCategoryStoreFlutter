import 'package:flutter/material.dart';
import '../widgets/drawerMenu.widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Inicio'),
        ),
        drawer: MenuWidget(),
        body: Center(child: Text('data')));
  }
}
