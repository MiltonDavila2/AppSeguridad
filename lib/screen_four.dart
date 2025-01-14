import 'package:flutter/material.dart';

class ScreenFour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pantalla 4")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Esta es la pantalla para números mayores a 60."),
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
