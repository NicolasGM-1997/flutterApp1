import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'registro.dart';
import 'modo_invitado.dart';
import 'personalizados.dart';
import 'dart:async';

class Inicio extends StatelessWidget{
  @override Widget build(BuildContext context){
    return MaterialApp(
      title: "Tienda",
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFF1A456),
          centerTitle: true,
          title: Text("Inicio"),
        ),
        body: Contenedor(),
      ),
    );
  }
}

class Contenedor extends StatelessWidget{
  Conexion conn = Conexion();

  TextEditingController _controlUser = TextEditingController();
  TextEditingController _controlPass = TextEditingController();

  @override Widget build(BuildContext context){
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
            SizedBox(height: 25),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyButton(
                    texto : "Iniciar Sesion",
                    onPressedCallback: () async{
                      // Iniciar Sesion
                      bool validacion = await conn.validarUsuario(_controlUser.text, _controlPass.text, context);
                      if(validacion){
                        showDialog(
                          context: context,
                          builder: (context){
                            return MyAlertDialog(
                              message: "Sesion Iniciada",
                            );
                          },
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (context){
                            return MyAlertDialog(
                              message: "Datos Incorrectos \n${_controlUser.text} \n ${_controlPass.text}",
                            );
                          },
                        );
                      }
                    },
                  ),
                  SizedBox(width: 30),
                  MyButton(
                    texto : "Registrarse",
                    onPressedCallback: (){
                      // ir a la pagina de Registro Nuevo Usuario
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Registro()),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
            MyButton(
              texto : "Modo Invitado",
              onPressedCallback: (){
                // Modo Invitado
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ModoInvitado()),
                );
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
