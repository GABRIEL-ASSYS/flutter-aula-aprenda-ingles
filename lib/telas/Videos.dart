import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Videos extends StatefulWidget {
  @override
  _VideosState createState() => _VideosState();
}

class _VideosState extends State<Videos> {
  List<VideoPlayerController> _controllers = [
    VideoPlayerController.asset("videos/video1.mp4"),
    VideoPlayerController.asset("videos/video2.mp4"),
    VideoPlayerController.asset("videos/video3.mp4"),
  ];

  @override
  void initState() {
    super.initState();
    for (var controller in _controllers) {
      controller.initialize().then((_) {
        setState(() {});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vídeos de Inglês"),
      ),
      body: ListView.builder(
        itemCount: _controllers.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 4.0,
              child: Column(
                children: [
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: VideoPlayer(_controllers[index]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Vídeo ${index + 1}"),
                  ),
                  TextButton(
                    onPressed: () {
                      if (_controllers[index].value.isPlaying) {
                        _controllers[index].pause();
                      } else {
                        _controllers[index].play();
                      }
                    },
                    child: Icon(
                      _controllers[index].value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
