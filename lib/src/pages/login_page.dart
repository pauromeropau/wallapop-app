import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(0, 31, 51, 1),
        body: Stack(
          children: <Widget>[
            _crearFondo(context),
            _loginForm(context),
          ],
        ));
  }

  Widget _crearFondo(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final fondo = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment(0.5, 0),
              end: Alignment(0.5, 1),
              colors: <Color>[
            Color.fromRGBO(0, 61, 102, 1),
            Color.fromRGBO(0, 61, 102, 0.9)
          ])),
    );

    final circulo = Container(
      width: 200.0,
      height: 200.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(200.0),
          color: Color.fromRGBO(255, 255, 255, 0.07)),
    );
    return Stack(
      children: <Widget>[
        fondo,
        Positioned(top: 50.0, left: 168.0, child: circulo),
        Positioned(top: 29.0, left: 7.0, child: circulo),
        Positioned(top: 150.0, left: 70.0, child: circulo),
        Container(
          padding: EdgeInsets.only(top: 80.0),
          child: Column(
            children: <Widget>[
              Icon(
                Icons.person_pin_circle,
                color: Color.fromRGBO(255, 255, 255, 0.6),
                size: 95.0,
              ),
              SizedBox(
                height: 5.0,
                width: double.infinity,
              ),
              Text(
                'Paula Romero',
                style: TextStyle(color: Colors.white, fontSize: 18),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _loginForm(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(height: 170.0),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5.0),
            width: size.width * 0.85,
            padding: EdgeInsets.symmetric(vertical: 50.0),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5.0)),
            child: Column(
              children: <Widget>[
                Text(
                  'sign in',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 10.0,
                ),
                _crearEmail(),
                SizedBox(
                  height: 20.0,
                ),
                _crearPassword(),
                SizedBox(
                  height: 70.0,
                ),
                _crearBoton()
              ],
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Text(
            'Forgot your password?',
            style: TextStyle(fontSize: 12.0, color: Colors.white),
          ),
          SizedBox(
            height: 100.0,
          ),
        ],
      ),
    );
  }

  Widget _crearEmail() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            icon: Icon(
              Icons.email,
              size: 25.0,
              color: Colors.black26,
            ),
            // hintText: 'email',
            labelText: 'email',
            labelStyle: TextStyle(color: Colors.black38)),
      ),
    );
  }

  Widget _crearPassword() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        obscureText: true,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            icon: Icon(
              Icons.lock,
              size: 25.0,
              color: Colors.black26,
            ),
            // hintText: 'email',
            labelText: 'password',
            labelStyle: TextStyle(color: Colors.black38)),
      ),
    );
  }

  Widget _crearBoton() {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      color: Colors.amberAccent,
      elevation: 0.0,
      padding: EdgeInsets.symmetric(horizontal: 70.0, vertical: 13.0),
      child: Container(
        child: Text(
          'sign in',
          style: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
      ),
      onPressed: () {},
    );
  }
}
