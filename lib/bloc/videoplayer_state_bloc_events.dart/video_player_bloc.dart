import 'package:cached_video_player/cached_video_player.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class VideoPlayerEvent {}

class InitializeVideoPlayer extends VideoPlayerEvent {
  final String videoUrl;

  InitializeVideoPlayer(this.videoUrl);
}

class PlayVideo extends VideoPlayerEvent {}

class PauseVideo extends VideoPlayerEvent {}

class UpdatePosition extends VideoPlayerEvent {
  final Duration position;

  UpdatePosition(this.position);
}

class VideoPlayerState {
  final bool isLoading;
  final bool isPlaying;
  final Duration currentPosition;
  final Duration videoDuration;
  final CachedVideoPlayerController? controller;

  VideoPlayerState({
    required this.isLoading,
    required this.isPlaying,
    required this.currentPosition,
    required this.videoDuration,
    required this.controller,
  });

  VideoPlayerState copyWith({
    bool? isLoading,
    bool? isPlaying,
    Duration? currentPosition,
    Duration? videoDuration,
    CachedVideoPlayerController? controller,
  }) {
    return VideoPlayerState(
      isLoading: isLoading ?? this.isLoading,
      isPlaying: isPlaying ?? this.isPlaying,
      currentPosition: currentPosition ?? this.currentPosition,
      videoDuration: videoDuration ?? this.videoDuration,
      controller: controller ?? this.controller,
    );
  }
}

class VideoPlayerBloc extends Bloc<VideoPlayerEvent, VideoPlayerState> {
  VideoPlayerBloc()
      : super(VideoPlayerState(
          isLoading: true,
          isPlaying: false,
          currentPosition: Duration.zero,
          videoDuration: Duration.zero,
          controller: null,
        )) {
    on<InitializeVideoPlayer>(_onInitializeVideoPlayer);
    on<PlayVideo>(_onPlayVideo);
    on<PauseVideo>(_onPauseVideo);
    on<UpdatePosition>(_onUpdatePosition);
  }

  void _onInitializeVideoPlayer(
      InitializeVideoPlayer event, Emitter<VideoPlayerState> emit) async {
    final controller = CachedVideoPlayerController.network(event.videoUrl);
    await controller.initialize().then((_) {
      add(PlayVideo());
    });

    emit(state.copyWith(
      isLoading: false,
      isPlaying: true,
      currentPosition: Duration.zero,
      controller: controller,
      videoDuration: controller.value.duration,
    ));

    controller.addListener(() {
      if (controller.value.position == controller.value.duration) {
        add(PauseVideo());
      }
      add(UpdatePosition(controller.value.position));
    });
  }

  void _onPlayVideo(PlayVideo event, Emitter<VideoPlayerState> emit) {
    if (state.controller != null) {
      state.controller!.play();
      emit(state.copyWith(isPlaying: true));
    }
  }

  void _onPauseVideo(PauseVideo event, Emitter<VideoPlayerState> emit) {
    if (state.controller != null) {
      state.controller!.pause();
      emit(state.copyWith(isPlaying: false));
    }
  }

  void _onUpdatePosition(UpdatePosition event, Emitter<VideoPlayerState> emit) {
    emit(state.copyWith(currentPosition: event.position));
  }
}
