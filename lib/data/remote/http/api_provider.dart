import 'dart:async';

import 'package:injectable/injectable.dart';

import 'core/http_client.dart';
import 'core/i_http_client.dart';

@singleton
class ApiProvider {
  ApiProvider();
  final BaseHttpClient _httpClient = MHttpClient();
}

extension Charaters on ApiProvider {
  Future<List> getCharacterList() async {
    final response = await _httpClient.get(query: 'character');
    return response['results'];
  }


  Future<Map<String, dynamic>> getDetails({required int id}) async =>
      await _httpClient.get(query: 'character/$id');
}
