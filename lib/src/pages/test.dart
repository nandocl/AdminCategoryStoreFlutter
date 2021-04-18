import 'package:flutter/material.dart';
import '../widgets/snackBar.widget.dart';

class TextPg extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text('Test'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () => SnackBarWidget.showSnackBar(_scaffoldkey,
                messageText: 'Este es un snackBar', type: 1),
            child: Text('SnackBar')),
      ),
    );
  }
}
