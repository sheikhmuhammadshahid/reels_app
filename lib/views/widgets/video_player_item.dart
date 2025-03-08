import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_video_player/cached_video_player.dart';
import 'package:flutter/material.dart';

// import 'package:task/data/models/byte_model.dart';

import '../../data/models/reel_model.dart';

class VideoPlayerItem extends StatefulWidget {
  final ReelModel byte;
  const VideoPlayerItem({super.key, required this.byte});

  @override
  State<VideoPlayerItem> createState() => _VideoPlayerItemState();
}

double _parseAspectRatio(String aspectRatio) {
  final parts = aspectRatio.split('/');
  if (parts.length == 2) {
    final width = double.tryParse(parts[0]);
    final height = double.tryParse(parts[1]);
    if (width != null && height != null) {
      return width / height;
    }
  }
  return 16 / 9;
}

class _VideoPlayerItemState extends State<VideoPlayerItem> {
  late CachedVideoPlayerController _controller;
  bool isLoading = true;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    setMp4Video();
  }

  setMp4Video() async {
    setState(() {
      isLoading = true;
    });
    _controller = CachedVideoPlayerController.network(widget.byte.cdnUrl ?? '')
      ..initialize().then((_) {
        // _controller.setLooping(true);
        _controller.play();
        setState(() {
          isLoading = false;
          isPlaying = true;
        });
      });

    _controller.addListener(() {
      if (_controller.value.position == _controller.value.duration) {
        // _controller.seekTo(const Duration());
        // _controller.play();
        _controller.pause();
        setState(() {
          isPlaying = false;
        });
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
        Align(
          alignment: Alignment.center,
          child: isLoading
              ? const SizedBox.shrink()
              : GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isPlaying) {
                        _controller.pause();
                      } else {
                        _controller.play();
                      }
                      isPlaying = !isPlaying;
                    });
                  },
                  child: AspectRatio(
                    aspectRatio: widget.byte.videoAspectRatio != null
                        ? _parseAspectRatio((widget.byte.videoAspectRatio ?? '')
                            .replaceAll(':', '/'))
                        : 16 / 9,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CachedVideoPlayer(_controller),
                        if (!isPlaying)
                          const Icon(
                            Icons.play_arrow,
                            size: 60,
                            color: Colors.white,
                          ),
                      ],
                    ),
                  ),
                ),
        ),
        Positioned(
          bottom: 10,
          left: 10,
          right: 10,
          child: Column(
            children: [
              VideoProgressIndicator(
                _controller,
                allowScrubbing: true,
                colors: VideoProgressColors(
                  playedColor: Colors.red,
                  backgroundColor: Colors.grey.shade700,
                  bufferedColor: Colors.grey.shade500,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _formatDuration(_controller.value.position),
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    _formatDuration(_controller.value.duration),
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 55,
          left: 5,
          child: SizedBox(
            height: 60,
            width: MediaQuery.of(context).size.width,
            child: ListTile(
              leading: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).cardColor,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    height: 50,
                    width: 50,
                    fit: BoxFit.fill,
                    imageUrl: widget.byte.user!.profilePictureCdn ??
                        widget.byte.cdnUrl!,
                  ),
                ),
              ),
              title: Text(
                widget.byte.user!.fullname ?? '',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
