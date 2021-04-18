import 'package:flutter/material.dart';

//Pages
import 'src/pages/home.page.dart';
import 'src/pages/login.page.dart';
import 'src/pages/storeEdit.page.dart';
import 'src/pages/stores.page.dart';

import 'src/pages/category.page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Color(0xff027b76), accentColor: Color(0xffFF5722)),
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => HomePage(),
        'login': (BuildContext context) => LoginPage(),
        'category': (BuildContext context) => CategoriaPage(),
        'store': (BuildContext context) => StoresPages(),
        'editStore': (BuildContext context) => StoreEditPage(),
      },
    );
  }
}
