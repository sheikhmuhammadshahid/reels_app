import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_video_player/cached_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/videoplayer_state_bloc_events.dart/video_player_bloc.dart';
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
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    context
        .read<VideoPlayerBloc>()
        .add(InitializeVideoPlayer(widget.byte.cdnUrl ?? ''));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoPlayerBloc, VideoPlayerState>(
      builder: (context, state) {
        return Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            Align(
              alignment: Alignment.center,
              child: state.isLoading
                  ? const CircularProgressIndicator() // Show loading indicator
                  : GestureDetector(
                      onTap: () {
                        if (state.isPlaying) {
                          context.read<VideoPlayerBloc>().add(PauseVideo());
                        } else {
                          context.read<VideoPlayerBloc>().add(PlayVideo());
                        }
                      },
                      child: AspectRatio(
                        aspectRatio: widget.byte.videoAspectRatio != null
                            ? _parseAspectRatio(
                                (widget.byte.videoAspectRatio ?? '')
                                    .replaceAll(':', '/'))
                            : 16 / 9,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            if (state.controller != null)
                              CachedVideoPlayer(state.controller!),
                            if (!state.isPlaying)
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
            if (state.controller != null)
              Positioned(
                bottom: 10,
                left: 10,
                right: 10,
                child: Column(
                  children: [
                    VideoProgressIndicator(
                      state.controller!,
                      allowScrubbing: true,
                      colors: VideoProgressColors(
                        playedColor: Colors.red,
                        backgroundColor: Colors.grey.shade700,
                        bufferedColor: Colors.grey.shade500,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          _formatDuration(state.videoDuration),
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
      },
    );
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
