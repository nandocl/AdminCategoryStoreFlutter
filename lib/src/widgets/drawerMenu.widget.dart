import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  final List<Map<String, dynamic>> menuItems = [
    {'name': 'Inicio', 'icon': Icons.home, 'route': 'home'},
    {'name': 'Tienda', 'icon': Icons.store_outlined, 'route': 'store'},
    {'name': 'Categorias', 'icon': Icons.category, 'route': 'category'},
    {'name': 'Productos', 'icon': Icons.today_outlined, 'route': ''},
    {'name': 'Punto de venta', 'icon': Icons.album_outlined, 'route': ''},
    {'name': 'Login', 'icon': Icons.login, 'route': 'login'},
    
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * .8,
      child: Drawer(
        child: Container(
          color: Color(0xff1c313a),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                height: 130,
                child: DrawerHeader(
                    padding: EdgeInsets.only(left: 30),
                    child: Row(
                      children: [
                        CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.red[100],
                            backgroundImage: AssetImage('assets/img/logo.png')),
                        Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Text(
                              'Bettle CMS',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ))
                      ],
                    )),
              ),
              for (var item in menuItems)
                ListTile(
                    leading: Icon(
                      item['icon'],
                      color: Colors.white,
                    ),
                    title: Text(
                      item['name'],
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                    onTap: () => item['route'] == ''
                       ? {Navigator.pop(context)}
                        : Navigator.pushNamed(
                          context, 
                          item['route'],
                         ))
            ],
          ),
        ),
      ),
    );
  }
}
