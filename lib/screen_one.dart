import 'package:flutter/material.dart';
import 'option.dart'; // Importa el modelo Option
import 'detail_screen.dart'; // Importa la pantalla de detalles

class ScreenOne extends StatelessWidget {
  final List<Option> options = [
    Option(
      title: 'Opción 1',
      imageUrl: 'https://cdn.sanity.io/images/5vm5yn1d/pro/5cb1f9400891d9da5a4926d7814bd1b89127ecba-1300x867.jpg?fm=webp&q=80', // Imagen de ejemplo
      description: """hizo tan pesado que fue imposible moverlo. Una cazuela de agua colocada en la
        mesa de trabajo hirvió sin fuego durante media hora hasta evaporarse por completo. José Arcadio
    Buendía y su hijo observaban aquellos fenómenos con asustado alborozo, sin lograr explicárselos,
        pero interpretándolos como anuncios de la materia. Un día la canastilla de Amaranta empezó a
    moverse con un impulso propio y dio una vuelta completa en el cuarto, ante la consternación de
        Aureliano, que se apresuró a detenerla. Pero su padre no se alteró. Puso la canastilla en su
    puesto y la amarró a la pata de una mesa, convencido de que el acontecimiento esperado era
    inminente. Fue en esa ocasión cuando Aureliano le oyó decir""",
        VideoURL: 'https://www.youtube.com/watch?v=xcJtL7QggTI'

    ),
    Option(
      title: 'Opción 2',
      imageUrl: 'https://via.placeholder.com/150',
      description: 'Este es el texto de la opción 2.',
      VideoURL: 'https://www.youtube.com/watch?v=xcJtL7QggTI'
    ),
    Option(
      title: 'Opción 3',
      imageUrl: 'https://via.placeholder.com/150',
      description: 'Este es el texto de la opción 3.',
        VideoURL: 'https://www.youtube.com/watch?v=xcJtL7QggTI'
    ),
    Option(
      title: 'Opción 4',
      imageUrl: 'https://via.placeholder.com/150',
      description: 'Este es el texto de la opción 4.',
        VideoURL: 'https://www.youtube.com/watch?v=xcJtL7QggTI'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Opciones')),
      body: ListView.builder(
        itemCount: options.length,
        itemBuilder: (context, index) {
          final option = options[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Image.network(option.imageUrl, width: 50, height: 50),
              title: Text(option.title),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(option: option),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}