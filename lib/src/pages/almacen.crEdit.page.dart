import 'package:flutter/material.dart';
import '../widgets/button.widget.dart';

class StoreCreateEditPage extends StatefulWidget {
  @override
  _StoreCreateEditPage createState() => _StoreCreateEditPage();
}

class _StoreCreateEditPage extends State<StoreCreateEditPage> {
  final deviceTypes = ['Tienda x', 'Tienda y', 'Tienda z'];
  String dropdownValue;
  final _storeForm = GlobalKey<FormState>();
  TextEditingController _nombreCtrl = new TextEditingController();
  TextEditingController _correoCtrl = new TextEditingController();
  TextEditingController _telefonoCtrl = new TextEditingController();
  TextEditingController _direccionCtrl = new TextEditingController();
  TextEditingController _ubicacionCtrl = new TextEditingController();

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
                  _botones(),
                  _formulario(),
                  _dropdownButton(),
                  _coords()
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
        margin: EdgeInsets.only(top: 20),
        child: Text(
          'Nuevo Almacén',
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
          decoration: InputDecoration(labelText: 'Correo'),
          validator: (value) {
            if (value.isEmpty) {
              return 'Agregue un correo.';
            }
            return null;
          },
        ),
        TextFormField(
          controller: _telefonoCtrl,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(labelText: 'Teléfono'),
          validator: (value) {
            if (value.isEmpty) {
              return 'Agregue un telefono.';
            }
            return null;
          },
        ),
        TextFormField(
          controller: _direccionCtrl,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(labelText: 'Dirección'),
          validator: (value) {
            if (value.isEmpty) {
              return 'Agregue dirección.';
            }
            return null;
          },
        ),
        TextFormField(
          controller: _ubicacionCtrl,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(labelText: 'Ubicación'),
          validator: (value) {
            if (value.isEmpty) {
              return 'Agregue ubicacion.';
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
                print('Form');
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

  Widget _coords() {
    return Column(children: [
      TextFormField(
        autofocus: true,
        decoration: InputDecoration(labelText: 'Latitud'),
      ),
      TextFormField(
        autofocus: true,
        decoration: InputDecoration(labelText: 'Longitud'),
      ),
    ]);
  }

  Widget _dropdownButton() {
    return Container(
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
              dropdownValue = newValue;
            });
          }
        },
        items: deviceTypes.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      )),
    );
  }
}
