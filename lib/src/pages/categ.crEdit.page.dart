import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import '../widgets/button.widget.dart';

class CategoryCreateEditPage extends StatefulWidget {
  @override
  _CategoryCreateEditPage createState() => _CategoryCreateEditPage();
}

class _CategoryCreateEditPage extends State<CategoryCreateEditPage> {
  final tiendas = ['Tienda x', 'Tienda y', 'Tienda z'];
  String tiendasVal;
  final padres = ['Padre x', 'Padre y', 'Padre z'];
  String padreVal;
  final _storeForm = GlobalKey<FormState>();
  TextEditingController _nombreCtrl = new TextEditingController();
  TextEditingController _correoCtrl = new TextEditingController();
  File _image;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _storeForm,
            child: Container(
              margin: EdgeInsets.only(right: 20, left: 20, bottom: 50),
              child: Column(
                children: [
                  _encabezado(),
                  _formulario(),
                  _imgPicker(),
                  _dropdownButtons(),
                  _botones(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _encabezado() {
    return Container(
        margin: EdgeInsets.only(top: 20, bottom: 20),
        child: Text(
          'Nueva categoría',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ));
  }

  Widget _formulario() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 5),
          alignment: Alignment.centerLeft,
          height: 33,
          child: Text(
            'Información',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          color: Colors.grey[300],
        ),
        TextFormField(
          controller: _nombreCtrl,
          keyboardType: TextInputType.name,
          autofocus: true,
          decoration: InputDecoration(labelText: 'Nombre'),
          validator: (value) {
            if (value.isEmpty) {
              return 'Agregue un nombre.';
            }
            return null;
          },
        ),
        TextFormField(
          controller: _correoCtrl,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(labelText: 'Descripción'),
          validator: (value) {
            if (value.isEmpty) {
              return 'Agregue descripción.';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _botones() {
    return Container(
      margin: EdgeInsets.only(top: 15, bottom: 15),
      child: Row(
        children: [
          Expanded(
              child: Boton(
            bgColor: Color(0xff027b76),
            textColor: Colors.white,
            btnText: 'Aceptar',
            onTap: () {
              if (_storeForm.currentState.validate()) {
                print('Aceptar');
              }
            },
          )),
          SizedBox(
            width: 10,
          ),
          Expanded(
              child: Boton(
            bgColor: Colors.redAccent,
            textColor: Colors.white,
            btnText: 'Cancelar',
            onTap: () => print('Cancelr'),
          )),
        ],
      ),
    );
  }

  Widget _dropdownButtons() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField(
            hint: Text('Tienda'),
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(top: 20, left: 15),
                isDense: false,
                border: OutlineInputBorder(
                    borderSide: BorderSide(width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(10)))),
            validator: (String value) {
              if (value == null ? false : true) return 'err';
              return null;
            },
            onChanged: (String newValue) {
              if (newValue != null) {
                setState(() {
                  tiendasVal = newValue;
                });
              }
            },
            items: tiendas.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          )),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField(
            hint: Text('Categoría padre'),
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(top: 20, left: 15),
                isDense: false,
                border: OutlineInputBorder(
                    borderSide: BorderSide(width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(10)))),
            validator: (String value) {
              if (value == null ? false : true) return 'err';
              return null;
            },
            onChanged: (String newValue) {
              if (newValue != null) {
                setState(() {
                  padreVal = newValue;
                });
              }
            },
            items: padres.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          )),
        ),
      ],
    );
  }

  Widget _imgPicker() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 10),
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      child: Container(
        margin: EdgeInsets.only(left: 20),
        child: Row(
          children: [
            Boton(
              btnText: 'Examinar...',
              bgColor: Colors.grey[400],
              textColor: Colors.black,
              onTap: () => _origin(),
            ),
            Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(_image == null
                    ? 'Ninguna imagen seleccionada'
                    : 'Una imagen seleccionada'))
          ],
        ),
      ),
    );
  }

  void _origin() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Origen de la imagen'),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                      child: Container(
                          margin: EdgeInsets.only(bottom: 5),
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/icon/gallery.png"),
                              fit: BoxFit.cover,
                            ),
                          )),
                      onTap: () {
                        Navigator.pop(context);
                        _imgFromGallery();
                      }),
                  Text('Galeria')
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    child: Container(
                        margin: EdgeInsets.only(bottom: 5),
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/icon/camera.png"),
                            fit: BoxFit.cover,
                          ),
                        )),
                    onTap: () {
                      Navigator.pop(context);
                      _imgFromCamera();
                    },
                  ),
                  Text('Camara')
                ],
              )
            ],
          ),
          actions: [
            Boton(
              btnText: 'Cancelar',
              bgColor: Colors.redAccent,
              textColor: Colors.white,
              onTap: () => Navigator.pop(context),
            )
          ],
        );
      },
    );
  }

  Future _imgFromCamera() async {
    final pickedFile =
        await picker.getImage(source: ImageSource.camera, imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future _imgFromGallery() async {
    final pickedFile =
        await picker.getImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
}
