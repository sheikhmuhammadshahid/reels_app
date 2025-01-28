import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../data/repositories/bytes_repository.dart';
import 'bytes_event.dart';
import 'bytes_state.dart';

class BytesBloc extends Bloc<BytesEvent, BytesState> {
  final BytesRepository repository;
  int page = 1;
  bool hasMore = true;

  BytesBloc({required this.repository}) : super(BytesInitial()) {
    on<FetchBytes>(_onFetchBytes);
    on<LoadMoreBytes>(_onLoadMoreBytes);
  }

  Future<void> _onFetchBytes(
    FetchBytes event,
    Emitter<BytesState> emit,
  ) async {
    try {
      emit(BytesLoading());
      final bytes = await repository.fetchBytes(page: 1);
      hasMore = bytes.length == 10;
      page = 2;
      emit(BytesLoaded(bytes: bytes, hasMore: hasMore));
    } catch (e) {
      emit(BytesError(message: e.toString()));
    }
  }

  Future<void> _onLoadMoreBytes(
    LoadMoreBytes event,
    Emitter<BytesState> emit,
  ) async {
    if (state is BytesLoaded && hasMore) {
      try {
        final currentState = state as BytesLoaded;
        final newBytes = await repository.fetchBytes(page: page);
        hasMore = newBytes.length == 10;
        page++;
        emit(currentState.copyWith(
          bytes: currentState.bytes + newBytes,
          hasMore: hasMore,
        ));
      } catch (e) {
        emit(BytesError(message: e.toString()));
      }
    }
  }
}
