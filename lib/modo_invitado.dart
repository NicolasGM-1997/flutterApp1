import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'personalizados.dart';
import 'inicio.dart';
import 'dart:core';

class ModoInvitado extends StatelessWidget {
  @override Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tienda",
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFF1A456),
          title: Text("Modo Invitado"),
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

class Contenedor extends StatelessWidget{

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
            ListaProductos(),
            SizedBox(height: 25),
            SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}

class ListaProductos extends StatelessWidget{
  Conexion conn = Conexion();

  @override Widget build(BuildContext context) {
    return FutureBuilder<List<Producto>>(
      future: conn.obtenerProductos(context),
      builder: (context, AsyncSnapshot<List<Producto>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Muestra un indicador de carga mientras se cargan los datos
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}'); // Muestra un mensaje de error si ocurre un error
        } else if (snapshot.hasData) {
          return Container(
            width: 300,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Producto producto = snapshot.data![index];
                // Retorna un widget personalizado para cada producto
                return MostrarProducto(
                  nombre: producto.nombre,
                  precio: producto.precio,
                  imagen: producto.imagen,
                  cantidad: producto.cantidad,
                );
              },
            ),
          );
        } else {
          return Text('No hay datos disponibles');
        }
      },
    );
  }
}

class MostrarProducto extends StatelessWidget{
  final String nombre;
  final double precio;
  final String imagen;
  final int cantidad;

  MostrarProducto({required this.nombre, required this.precio, required this.imagen, required this.cantidad});

  @override Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          MyImage(
            ruta: "assets/${imagen}",
            alto: 100,
            largo: 150,
          ),
          SizedBox(width: 25),
          Column(
            children: [
              Text(nombre),
              Text("Disponibles: ${cantidad}"),
              MyButton(
                texto: "Comprar",
                onPressedCallback: (){
                  showDialog(
                    context: context,
                    builder: (context){
                      return MyAlertDialog(
                        message: "Por favor inicie sesion",
                      );
                    },
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Inicio()),
                  );
                },
              ),
            ]
          ),
        ],
      ),
    );
  }
}