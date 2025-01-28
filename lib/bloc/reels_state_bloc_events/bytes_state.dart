import 'package:equatable/equatable.dart';
import 'package:task/data/models/reel_model.dart';

abstract class BytesState extends Equatable {
  const BytesState();

  @override
  List<Object> get props => [];
}

class BytesInitial extends BytesState {}

class BytesLoading extends BytesState {}

class BytesLoaded extends BytesState {
  final List<ReelModel> bytes;
  final bool hasMore;

  const BytesLoaded({required this.bytes, required this.hasMore});

  BytesLoaded copyWith({List<ReelModel>? bytes, bool? hasMore}) {
    return BytesLoaded(
      bytes: bytes ?? this.bytes,
      hasMore: hasMore ?? this.hasMore,
    );
  }

  @override
  List<Object> get props => [bytes, hasMore];
}

class BytesError extends BytesState {
  final String message;

  const BytesError({required this.message});

  @override
  List<Object> get props => [message];
}
