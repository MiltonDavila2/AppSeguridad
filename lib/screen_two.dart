import 'package:flutter/material.dart';

class ScreenTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pantalla 2")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Esta es la pantalla para números entre 11 y 18."),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Regresa a la pantalla anterior
              },
              child: Text("Volver a la pantalla principal"),
            ),
          ],
        ),
      ),
    );
  }
}