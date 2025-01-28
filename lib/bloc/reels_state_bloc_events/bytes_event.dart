import 'package:equatable/equatable.dart';

abstract class BytesEvent extends Equatable {
  const BytesEvent();

  @override
  List<Object> get props => [];
}

class FetchBytes extends BytesEvent {}

class LoadMoreBytes extends BytesEvent {}
