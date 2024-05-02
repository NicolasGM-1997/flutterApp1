import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'inicio.dart';
import 'dart:async';
import 'dart:core';

class MyButton extends StatelessWidget{
  final String texto;
  final VoidCallback onPressedCallback;
  MyButton({Key? key, required this.texto, required this.onPressedCallback}) : super(key: key);
  @override Widget build(BuildContext context){
    return TextButton(
      onPressed: onPressedCallback,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all <Color>(Color(0xFFF1A456)),
        padding: MaterialStateProperty.all(EdgeInsets.all(15)),
      ),
      child: Text(
        texto,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class MyImage extends StatelessWidget{
  final String ruta;
  final int largo;
  final int alto;
  MyImage({Key? key, required this.ruta, required this.largo, required this.alto}) : super(key: key);
  @override Widget build(BuildContext context){
    return Container(
      height: alto.toDouble(),
      width: largo.toDouble(),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0xFFF1A456).withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 10,
          ),
        ],
        borderRadius: BorderRadius.circular(15),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset(
          ruta,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

class MyAlertDialog extends StatelessWidget{
  final String message;

  MyAlertDialog({required this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Mensaje'),
      content: Text(message),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Cierra el mensaje emergente
          },
          child: Text('Aceptar'),
        ),
      ],
    );
  }
}

class Conexion{
  final DatabaseReference refProductos = FirebaseDatabase.instance.ref().child('productos');
  final DatabaseReference refUsuarios = FirebaseDatabase.instance.ref().child('usuarios');

  // Registro de datos de usuario
  Future<void> ingresarUsuario(Usuario user, BuildContext context) async{
    try{
      await refUsuarios.push().set({
        "name": user.nombre,
        "pass": user.password,
        "correo" : user.correo,
        "cel" : user.celular
      }).then((_) {
        // Si la operación se realizó con éxito, muestra un mensaje emergente
        showDialog(
          context: context,
          builder: (context){
            return MyAlertDialog(
              message: "Se ha registrado, Por favor inicie sesion",
            );
          },
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Inicio()),
        );
      });
    }catch(error){
      showDialog(
        context: context,
        builder: (context){
          return MyAlertDialog(
            message: "Error de conexion",
          );
        },
      );
    }
  }

  Future<List<Producto>> obtenerProductos(BuildContext context) async{
    List<Producto> productos = [];
    try{
      DataSnapshot snapshot = await refProductos.get();
      Map<dynamic, dynamic> data = snapshot.value as Map<dynamic, dynamic>;
      data.forEach((key, value) {
        Producto producto = Producto(
          nombre: value['nombre'],
          imagen: value['imagen'],
          cantidad: value['cantidad'].toInt(),
          precio: value['precio'].toDouble(),
        );
        productos.add(producto);
      });
    }catch(error){
      showDialog(
        context: context,
        builder: (context){
          return MyAlertDialog(
            message: "Error de conexion",
          );
        },
      );
    }
    return productos;
  }


  Future<bool> validarUsuario(String nameUser, String passUser, BuildContext context) async{
    try{
      DatabaseEvent event = await refUsuarios.orderByChild('name').equalTo(nameUser).once();
      DataSnapshot snapshot = event.snapshot;
      if (snapshot.value != null) {
        Map<dynamic, dynamic> usuario = (snapshot.value as Map).values.first as Map<dynamic, dynamic>;
        String password = usuario['pass'];
        return passUser == password;
      } else {
        return false;
      }
    } catch(error) {
      showDialog(
        context: context,
        builder: (context){
          return MyAlertDialog(
            message: "Error de conexion",
          );
        },
      );
      return false;
    }
  }

}

class Producto{
  final String nombre;
  final double precio;
  final String imagen;
  final int cantidad;

  Producto({required this.nombre, required this.precio, required this.imagen, required this.cantidad});
}

class Usuario{
  final String nombre;
  final String password;
  final String correo;
  final String celular;
  Usuario({required this.nombre, required this.password, required this.correo, required this.celular});
}