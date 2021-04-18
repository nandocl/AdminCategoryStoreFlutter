import 'package:flutter/material.dart';
import '../models/store.model.dart';
import '../widgets/button.widget.dart';

class StoreEditPage extends StatefulWidget {
  @override
  _StoreEditPage createState() => _StoreEditPage();
}

class _StoreEditPage extends State<StoreEditPage> {
  final storeState = ['Activo', 'Inactivo'];
  String dropdownValue;
  final _storeForm = GlobalKey<FormState>();
  TextEditingController _codigoCtrl = new TextEditingController();
  TextEditingController _nombreCtrl = new TextEditingController();
  TextEditingController _direccionCtrl = new TextEditingController();
  TextEditingController _telefonoCtrl = new TextEditingController();

  StoreItem args;

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context).settings.arguments;
    _codigoCtrl.text = args.code;
    _nombreCtrl.text = args.storeName;
    _direccionCtrl.text = args.storeAddress;
    _telefonoCtrl.text = args.phone;
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
                  _dropdownButton(),
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
        margin: EdgeInsets.only(top: 20, bottom: 10),
        child: Text(
          'Editar Tienda',
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
          controller: _codigoCtrl,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              labelText: 'Código', contentPadding: EdgeInsets.only(top: 17)),
          validator: (value) {
            if (value.isEmpty) {
              return 'Agregue un código.';
            }
            return null;
          },
        ),
        TextFormField(
          controller: _nombreCtrl,
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
              labelText: 'Nombre', contentPadding: EdgeInsets.only(top: 17)),
          validator: (value) {
            if (value.isEmpty) {
              return 'Agregue un nombre.';
            }
            return null;
          },
        ),
        TextFormField(
          controller: _direccionCtrl,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              labelText: 'Dirección', contentPadding: EdgeInsets.only(top: 17)),
          validator: (value) {
            if (value.isEmpty) {
              return 'Agregue dirección.';
            }
            return null;
          },
        ),
        TextFormField(
          controller: _telefonoCtrl,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              labelText: 'Teléfono', contentPadding: EdgeInsets.only(top: 17)),
          validator: (value) {
            if (value.isEmpty) {
              return 'Agregue un telefono.';
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
            onTap: () => Navigator.pop(context),
          )),
        ],
      ),
    );
  }

  Widget _dropdownButton() {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 5),
            alignment: Alignment.centerLeft,
            height: 33,
            child: Text(
              'Opciones',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            color: Colors.grey[300],
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: DropdownButtonHideUnderline(
                child: DropdownButtonFormField(
              hint: Text('--estado--'),
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
              items: storeState.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            )),
          ),
        ],
      ),
    );
  }
}
