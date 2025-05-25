import 'package:flutter/material.dart';
import 'package:waste_management_app/resources/app_page.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

const youtubeVideoLink = 'https://www.youtube.com/watch?v=VQTtg3KgVv4';
const secondYoutubeVideoLink = 'https://www.youtube.com/watch?v=0ZiD_Lb3Tm0';
const thirdYoutubeVideoLink = 'https://www.youtube.com/watch?v=3FEywMvpUeA';

class WatchVideoPage extends StatefulWidget {
  const WatchVideoPage({super.key, required this.videoID});

  final String videoID;

  @override
  State<WatchVideoPage> createState() => _WatchVideoPageState();
}

class _WatchVideoPageState extends State<WatchVideoPage> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      params: const YoutubePlayerParams(showFullscreenButton: true),
    )..cueVideoById(videoId: widget.videoID);

    _controller = YoutubePlayerController(
      params: const YoutubePlayerParams(showFullscreenButton: true),
    )..cueVideoById(videoId: widget.videoID);

    _controller = YoutubePlayerController(
      params: const YoutubePlayerParams(showFullscreenButton: true),
    )..cueVideoById(videoId: widget.videoID);
  }

  @override
  Widget build(BuildContext context) {
    return AppPageSecondary(
      title: 'Watch Video',
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: YoutubePlayerScaffold(
          controller: _controller,
          aspectRatio: 16 / 9,
          builder: (context, player) {
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  player,
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
