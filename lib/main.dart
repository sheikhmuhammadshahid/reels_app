import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/reels_state_bloc_events/bytes_block.dart';
import 'bloc/videoplayer_state_bloc_events.dart/video_player_bloc.dart';
import 'data/repositories/bytes_repository.dart';
import 'di/injection_container.dart';
import 'views/reels_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reels app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                BytesBloc(repository: getIt<BytesRepository>()),
          ),
          BlocProvider(
            create: (context) => VideoPlayerBloc(),
          ),
        ],
        child: const ReelsScreen(),
      ),
    );
  }
}
