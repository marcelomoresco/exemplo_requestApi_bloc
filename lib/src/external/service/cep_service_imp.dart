import 'dart:convert';

import 'package:viacep_project/src/domain/entities/cep.dart';
import 'package:viacep_project/src/external/service/cep_service.dart';
import 'package:http/http.dart' as http;

class HttpCepServiceImp extends ICepService {
  @override
  Future<Cep> getCep(String query) async {
    final api_url = Uri.parse('https://viacep.com.br/ws/$query/json/');
    final client = http.Client();
    final response = await client.get(api_url);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);

      return Cep.fromJson(json);
    } else {
      throw Exception('Erro na requisição');
    }
  }
}
