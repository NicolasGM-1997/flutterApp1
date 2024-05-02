import 'package:flutter/material.dart';
import 'inicio.dart';
import 'personalizados.dart';

class Registro extends StatelessWidget{
  @override Widget build(BuildContext context){
    return MaterialApp(
      title: "Tienda",
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFF1A456),
          title: Text("Registro"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Contenedor(),
      ),
    );
  }
}

class Contenedor extends StatelessWidget {

  Conexion conn = Conexion();

  TextEditingController _controlUser = TextEditingController();
  TextEditingController _controlPass = TextEditingController();
  TextEditingController _controlCorreo = TextEditingController();
  TextEditingController _controlCel = TextEditingController();

  @override Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 25),
            SizedBox(height: 25),
            MyImage(
              ruta: "assets/logo.png",
              largo: 250,
              alto: 250,
            ),
            SizedBox(height: 25),
            Container(
              width: 300,
              child: TextField(
                controller: _controlUser,
                decoration: InputDecoration(
                  hintText: "Usuario",
                ),
              ),
            ),
            SizedBox(height: 25),
            Container(
              width: 300,
              child: TextField(
                obscureText: true,
                controller: _controlPass,
                decoration: InputDecoration(
                  hintText: "Contraseña",
                ),
              ),
            ),
            SizedBox(height: 25),
            Container(
              width: 300,
              child: TextField(
                controller: _controlCel,
                decoration: InputDecoration(
                  hintText: "Telefono",
                ),
              ),
            ),
            SizedBox(height: 25),
            Container(
              width: 300,
              child: TextField(
                controller: _controlCorreo,
                decoration: InputDecoration(
                  hintText: "Correo",
                ),
              ),
            ),
            SizedBox(height: 25),
            SizedBox(height: 25),
            MyButton(
              texto: "Registrarse",
              onPressedCallback:(){
                // Nuevo Usuario
                Usuario user = Usuario(
                  nombre : _controlUser.text, 
                  password: _controlPass.text, 
                  correo: _controlCorreo.text, 
                  celular: _controlCel.text
                );
                conn.ingresarUsuario(user, context);
              },
            ),
            SizedBox(width: 25),
            SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
