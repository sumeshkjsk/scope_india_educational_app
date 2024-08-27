import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VdoAd extends StatefulWidget {
  const VdoAd({super.key});

  @override
  _VdoAdState createState() => _VdoAdState();
}

class _VdoAdState extends State<VdoAd> {
  late YoutubePlayerController _controller;
  String? videoId;

  @override
  void initState() {
    super.initState();

    // Extract the video ID from the URL
    videoId = YoutubePlayer.convertUrlToId("https://youtu.be/6ElmNOiYbFU");

    // Check if videoId is not null
    if (videoId != null) {
      _controller = YoutubePlayerController(
        initialVideoId: videoId!,
        flags: YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
          // loop: true,
        ),
      );
    } else {
      // Handle the case where the video ID could not be extracted
      print("Error: Could not extract video ID");
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return videoId != null
          ? YoutubePlayer(
      width: MediaQuery.of(context).size.width,
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.amber,
        onReady: () {
          print('Player is ready.');
        },
      )
          : Center(
        child: Text(
          "Error: Could not load video.",
          style: TextStyle(color: Colors.red, fontSize: 18),
        ),

    );
  }
}
