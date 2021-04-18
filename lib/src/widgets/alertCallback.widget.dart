import 'package:flutter/material.dart';

class AlertCallback {
  showAlertDialog(BuildContext context,
      {String title, String content, Function callBack}) {
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        ElevatedButton(onPressed: () => callBack(), child: Text('Aceptar')),
        TextButton(
            onPressed: () {
              callBack();
              Navigator.pop(context);
            },
            child: Text('Cancelar'))
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
