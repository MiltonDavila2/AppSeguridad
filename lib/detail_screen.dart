import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'option.dart'; // Importa el modelo Option

class DetailScreen extends StatefulWidget {
  final Option option;

  const DetailScreen({Key? key, required this.option}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    // Extraer el ID del video de la URL
    final videoId = YoutubePlayer.convertUrlToId(widget.option.VideoURL)!;

    // Inicializar el controlador de YouTube
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        isLive: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Volver"),

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.option.title,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Center(
                child: Image.network(
                  widget.option.imageUrl,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                widget.option.description,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 24),
              Text(
                'Video relacionado',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              YoutubePlayerBuilder(
                player: YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: Colors.blue,
                  onReady: () {
                    print('YouTube player is ready.');
                  },
                ),
                builder: (context, player) {
                  return Column(
                    children: [
                      // Muestra el reproductor de video
                      AspectRatio(
                        aspectRatio: 16 / 9,
                        child: player,
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context); // Regresa a la pantalla anterior
                        },
                        child: const Text('Volver a la lista de opciones'),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
