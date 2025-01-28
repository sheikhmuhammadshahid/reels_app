import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/reels_state_bloc_events/bytes_block.dart';
import '../bloc/reels_state_bloc_events/bytes_event.dart';
import '../bloc/reels_state_bloc_events/bytes_state.dart';
import 'widgets/video_player_item.dart';

class ReelsScreen extends StatefulWidget {
  const ReelsScreen({super.key});

  @override
  State<ReelsScreen> createState() => _ReelsScreenState();
}

class _ReelsScreenState extends State<ReelsScreen> {
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    context.read<BytesBloc>().add(FetchBytes());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BytesBloc, BytesState>(
        builder: (context, state) {
          if (state is BytesLoaded) {
            return PageView.builder(
              controller: _pageController,
              scrollDirection: Axis.vertical,
              itemCount: state.bytes.length + (state.hasMore ? 1 : 0),
              onPageChanged: (index) {
                if (index >= state.bytes.length - 2 && state.hasMore) {
                  context.read<BytesBloc>().add(LoadMoreBytes());
                }
              },
              itemBuilder: (context, index) {
                if (index >= state.bytes.length) {
                  return const Center(child: CircularProgressIndicator());
                }
                return VideoPlayerItem(byte: state.bytes[index]);
              },
            );
          } else if (state is BytesError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
