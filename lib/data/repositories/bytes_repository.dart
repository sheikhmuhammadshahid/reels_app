import '../bytes_remote_data_source.dart';
import '../models/reel_model.dart';

class BytesRepository {
  final BytesRemoteDataSource remoteDataSource;

  BytesRepository({required this.remoteDataSource});

  Future<List<ReelModel>> fetchBytes({required int page}) async {
    try {
      final bytes = await remoteDataSource.fetchBytes(page: page);
      return bytes;
    } catch (e) {
      throw Exception('Failed to load bytes: $e');
    }
  }
}
