import 'package:flutter/material.dart';

import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class VideoItem extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final bool looping;

  VideoItem({
    @required this.videoPlayerController,
    this.looping,
    Key key,
  }) : super(key: key);

  @override
  _VideoItemState createState() => _VideoItemState();
}

class _VideoItemState extends State<VideoItem> {
  ChewieController _chewieController;

  @override
  void initState() {
    _chewieController = ChewieController(
        videoPlayerController: widget.videoPlayerController,
        autoInitialize: true,
        looping: widget.looping,
        errorBuilder: (context, errorMessage) {
          return Center(child: Text(errorMessage));
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width * 0.65,
        child: Chewie(
          controller: _chewieController,
        ));
  }

  @override
  void dispose() {
    widget.videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }
}
