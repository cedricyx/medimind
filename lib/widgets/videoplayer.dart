import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:easy_localization/easy_localization.dart';

/// Stateful widget to fetch and then display video content.
class VideoApp extends StatefulWidget {
  String videopath = "";
  VideoApp(this.videopath, {super.key});

  @override
  _VideoAppState createState() => _VideoAppState(videopath);
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;
  String videopath = "";

  _VideoAppState(this.videopath);

  @override
  void initState() {
    super.initState();
    
    _controller = VideoPlayerController.file(File(videopath))
     ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    if (videopath == '')
      return Text('NoVisualAids'.tr(), textAlign: TextAlign.center);
    else
      return Container(
        child: SizedBox(
          height: 200,
          width: 200,
          child: Stack(children: <Widget>[
              Center(
                child: _controller.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      )
                    : Container(),
              ),
              Center(
                child: Opacity(
                  opacity: 0.4,
                  child: FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        _controller.value.isPlaying
                            ? _controller.pause()
                            : _controller.play();
                      });
                    },
                    child: Icon(
                      _controller.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                    ),
                  ),
                ),
              ),
          ]),
        ),
      );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
