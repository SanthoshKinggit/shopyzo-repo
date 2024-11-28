// Suggested code may be subject to a license. Learn more: ~LicenseLog:3608966471.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1511355192.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3861336278.
// ignore_for_file: use_super_parameters, deprecated_member_use, prefer_const_constructors, unused_element

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:video_player/video_player.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final String? thumbnailUrl;
  final bool autoPlay;
  final bool looping;
  final double aspectRatio;

  const CustomVideoPlayer({
    Key? key,
    required this.videoUrl,
    this.thumbnailUrl,
    this.autoPlay = false,
    this.looping = false,
    this.aspectRatio = 16 / 9,
  }) : super(key: key);

  @override
  _CustomVideoPlayerState createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {

  late VideoPlayerController _controller;
  bool _isInitialized = false;
  bool _isLottiePlaying = false;
  bool _showControls = true;
  bool _isBuffering = false;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  void _initializeVideo() async {
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {
          _isInitialized = true;
          if (widget.autoPlay) {
            _controller.play();
          }
        });
      })
      ..addListener(() {
        setState(() {
          _isBuffering = _controller.value.isBuffering;
        });
      });

    _controller.setLooping(widget.looping);
    
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }
    
  void _toggleLottieAnimation() {
    setState(() => _isLottiePlaying = !_isLottiePlaying);
  }



  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: widget.aspectRatio,
      child: Container(
        color: Colors.black,
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (!_isInitialized && widget.thumbnailUrl != null)
              CachedNetworkImage(
                imageUrl: widget.thumbnailUrl!,
                fit: BoxFit.cover,
              ),

            if (_isInitialized)
              GestureDetector(
                onTap: () {
                  setState(() {
                    _showControls = !_showControls;
                  });
                },
                child: VideoPlayer(_controller),
              ),

            // Buffering indicator
            if (_isBuffering)
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),

            // Video controls
            if (_showControls && _isInitialized)
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: const [
                      Colors.black54,
                      Colors.transparent,
                      Colors.transparent,
                      Colors.black54,
                    ],
                  ),
                ),
              ),

            if (_showControls && _isInitialized)
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Top controls (if needed)
                  Container(),

                  // Center play/pause button
                  IconButton(
                    icon: Icon(
                      _controller.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                      size: 50,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        _controller.value.isPlaying
                            ? _controller.pause()
                            : _controller.play();
                      });
                    },
                  ),
                  Center(
                     child: SizedBox(
                      width: 150,
                      height: 150,
                      child: Lottie.network(
                        'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json',
                        repeat: _isLottiePlaying, // Control repetition with a state variable
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(
                          Icons.animation,
                          size: 60,
                          color: Colors.white,
                        );
                      },
                    ),
                    )
                  ),

                  // Bottom controls
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        // Current position
                        Text(
                          _formatDuration(_controller.value.position),
                          style: const TextStyle(color: Colors.white),
                        ),

                        // Progress bar
                        Expanded(
                          child: Slider(
                            value:
                                _controller.value.position.inSeconds.toDouble(),
                            min: 0,
                            max:
                                _controller.value.duration.inSeconds.toDouble(),
                            onChanged: (value) {
                              _controller
                                  .seekTo(Duration(seconds: value.toInt()));
                            },
                          ),
                        ),

                        // Duration
                        Text(
                          _formatDuration(_controller.value.duration),
                          style: const TextStyle(color: Colors.white),
                        ),

                        // Fullscreen toggle
                        IconButton(
                          icon: const Icon(
                            Icons.fullscreen,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            // Implement fullscreen toggle
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
