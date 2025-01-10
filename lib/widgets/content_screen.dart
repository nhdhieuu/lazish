import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:lazish/widgets/like_icon.dart';
import 'package:lazish/widgets/options_screen.dart';
import 'package:video_player/video_player.dart';

class ContentScreen extends StatefulWidget {
  final String? src;
  final bool isVisible;
  final bool isSaved;

  const ContentScreen({
    Key? key,
    this.src,
    this.isVisible = true,
    this.isSaved = false,
  }) : super(key: key);

  @override
  _ContentScreenState createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  bool _liked = false;
  bool _saved = false;

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  @override
  void didUpdateWidget(covariant ContentScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isVisible) {
      _videoPlayerController.play();
    } else {
      _videoPlayerController.pause();
    }
  }

  Future initializePlayer() async {
    _videoPlayerController = VideoPlayerController.network(widget.src!);

    await Future.wait([_videoPlayerController.initialize()]);

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      showControls: false,
      looping: true,
    );
    setState(() {});
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController!.dispose();
    super.dispose();
  }

  void _handleSave() {
    setState(() {
      _saved = !_saved;
    });
  }

  void _handleLike() {
    setState(() {
      _liked = !_liked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        _chewieController != null &&
                _chewieController!.videoPlayerController.value.isInitialized
            ? GestureDetector(
                onDoubleTap: _handleLike,
                onTap: () {
                  setState(() {
                    if (_videoPlayerController.value.isPlaying) {
                      _videoPlayerController.pause();
                    } else {
                      _videoPlayerController.play();
                    }
                  });
                },
                child: Chewie(
                  controller: _chewieController!,
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 10),
                  Text('Loading...')
                ],
              ),
        if (_liked)
          Center(
            child: LikeIcon(),
          ),
        OptionsScreen(
          isSaved: widget.isSaved ? true : _saved,
          onSavePressed: _handleSave,
          isLiked: _liked,
          onLikePressed: _handleLike,
        )
      ],
    );
  }
}
