import 'package:flutter/material.dart';

class UserConfigPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(fontWeight: FontWeight.w600), // Semi-bold
        ),
      ),
      body: Container(
        color: const Color.fromARGB(
            255, 243, 243, 243), // Fondo de la pantalla de un gris claro
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12), // Bordes redondeados
                ),
                padding: EdgeInsets.all(16), // Espacio interno
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 40, // Tamaño reducido
                      backgroundImage: NetworkImage(
                          'https://i.pinimg.com/736x/c0/74/9b/c0749b7cc401421662ae901ec8f9f660.jpg'),
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'John Doe',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'jdoe@example.com',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                    Spacer(), // Para empujar el ícono hacia la derecha
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 24, // Puedes ajustar el tamaño según tu necesidad
                      color: Colors.grey, // Color del icono
                    ),
                  ],
                )),
            SizedBox(height: 32),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: Icon(Icons.calendar_today),
                title: Text('Fecha de Registro'),
                subtitle: Text('01/01/2022'), // Aquí puedes poner la fecha real
              ),
            ),
            SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: Icon(Icons.brightness_6),
                title: Text('Cambiar Tema'),
                onTap: () {
                  // Lógica para cambiar el tema
                },
              ),
            ),
            SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: Icon(Icons.language),
                title: Text('Cambiar Lenguaje'),
                onTap: () {
                  // Lógica para cambiar el lenguaje
                },
              ),
            ),
            SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: Icon(Icons.logout),
                title: Text('Cerrar Sesión'),
                onTap: () {
                  // Lógica para cerrar sesión
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
