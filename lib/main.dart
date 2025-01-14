import 'package:flutter/material.dart';
import 'screen_one.dart';
import 'screen_two.dart';
import 'screen_three.dart';
import 'screen_four.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  void _navigateBasedOnInput(BuildContext context, String input) {
    try {
      int number = int.parse(input);
      if (number >= 8 && number <= 11) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ScreenOne()),
        );
      } else if (number >= 12 && number <= 18) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ScreenTwo()),
        );
      } else if (number >= 19 && number <= 64) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Esta app esta hecha para personas menores a 19 y mayores a 64")),
        );
      } else if (number >= 65 && number <= 122) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ScreenFour()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Por favor ingrese una edad válida.")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Por favor ingrese una edad válida.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ingrese su edad")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Ingrese cuantos años tiene",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _navigateBasedOnInput(context, _controller.text);
              },
              child: Text("Ingresar"),
            ),
          ],
        ),
      ),
    );
  }
}
