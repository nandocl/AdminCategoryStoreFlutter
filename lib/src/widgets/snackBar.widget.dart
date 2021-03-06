import 'package:flutter/material.dart';

class SnackBarWidget {
  /// Creata un SnackBar.
  ///
  /// scaffoldKey => final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  ///
  /// messageText => Texto del snackBar
  ///
  ///
  /// * type => 1 = snackBar informativo
  /// * type => 2 = snackBar done
  /// * type => 2 = snackBar error
  static showSnackBar(GlobalKey<ScaffoldState> scaffoldKey,
      {@required String messageText, @required int type}) {
    final snackBar = SnackBar(
      duration: Duration(seconds: 3),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(10),
      content: Row(
        children: [
          Icon(
            type == 1
                ? Icons.info_outline
                : type == 2
                    ? Icons.done
                    : Icons.warning_amber_outlined,
            color: Colors.white,
          ),
          SizedBox(width: 10),
          Text(messageText),
        ],
      ),
      backgroundColor: type == 1
          ? Colors.grey[850]
          : type == 2
              ? Colors.green
              : Colors.red[600],
    );
    ScaffoldMessenger.of(scaffoldKey.currentContext).showSnackBar(snackBar);
  }
}
