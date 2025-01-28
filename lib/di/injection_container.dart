import 'package:get_it/get_it.dart';

import '../bloc/reels_state_bloc_events/bytes_block.dart';
import '../bloc/videoplayer_state_bloc_events.dart/video_player_bloc.dart';
import '../data/bytes_remote_data_source.dart';
import '../data/repositories/bytes_repository.dart';

final getIt = GetIt.instance;

void initDependencies() {
  // Data Sources
  getIt.registerLazySingleton<BytesRemoteDataSource>(
    () => BytesRemoteDataSourceImpl(),
  );

  // Repositories
  getIt.registerLazySingleton<BytesRepository>(
    () => BytesRepository(remoteDataSource: getIt()),
  );

  // BLoCs
  getIt.registerFactory(
    () => BytesBloc(repository: getIt()),
  );

  getIt.registerFactory(
    () => VideoPlayerBloc(),
  );
}
