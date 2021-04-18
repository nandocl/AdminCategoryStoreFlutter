import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ingreso de usuario'),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pushNamed(context, 'home')),
      ),
      body: Container(
        child: Stack(children: [_loginBack(), _loginContent()]),
      ),
    );
  }

  Widget _loginContent() {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Form(
        child: ListView(
          children: [_logo(), _form(), _socialMediNetwork(), _forgCreText()],
        ),
      ),
    );
  }

  Widget _logo() {
    return CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 40,
      child: Image.asset('assets/img/logoFull.png'),
    );
  }

  Widget _form() {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 6),
      child: Column(
        children: [
          Text(
            'Credenciales de acceso',
            style: TextStyle(
                fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            color: Colors.grey[800],
            child: TextFormField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 18),
                  hintStyle: TextStyle(color: Colors.white),
                  hintText: "Usuario/Email",
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Icon(
                      Icons.people,
                      color: Colors.white,
                      size: 20,
                    ),
                  )),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 15),
            color: Colors.grey[800],
            child: TextFormField(
              obscureText: true,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 18),
                  hintStyle: TextStyle(color: Colors.white),
                  hintText: "Contrasena",
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Icon(
                      Icons.lock,
                      color: Colors.white,
                      size: 20,
                    ),
                  )),
            ),
          ),
          ConstrainedBox(
            constraints:
                BoxConstraints.tightFor(width: double.infinity, height: 40),
            child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ))),
              child: Text(
                'Ingresar',
                style: TextStyle(fontSize: 18),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _socialMediNetwork() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            color: Colors.white,
            icon: new Image.asset('assets/icon/facebook.png'),
            onPressed: () {},
          ),
          IconButton(
            color: Colors.white,
            icon: new Image.asset('assets/icon/google-plus.png'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _forgCreText() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () {},
              child: Text(
                'Olvidaste tu contrasena?',
                style: TextStyle(color: Colors.white),
              )),
          TextButton(
              onPressed: () {},
              child:
                  Text('Crear cuenta', style: TextStyle(color: Colors.teal))),
        ],
      ),
    );
  }

  Widget _loginBack() {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.8), BlendMode.darken),
              image: AssetImage('assets/img/backLogin.jpg'),
              fit: BoxFit.cover)),
    );
  }
}
