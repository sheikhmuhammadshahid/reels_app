import 'dart:convert';

import 'package:http/http.dart' as http;

import 'models/reel_model.dart';


abstract class BytesRemoteDataSource {
  Future<List<ReelModel>> fetchBytes({required int page});
}

class BytesRemoteDataSourceImpl implements BytesRemoteDataSource {
  @override
  Future<List<ReelModel>> fetchBytes({required int page}) async {
    final response = await http.get(
      Uri.parse(
          'https://api.ulearna.com/bytes/all?page=$page&limit=10&country=United+States'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['data']['data'] as List;
      return data.map((byte) => ReelModel.fromMap(byte)).toList();
    } else {
      throw Exception('Failed to load bytes');
    }
  }
}
