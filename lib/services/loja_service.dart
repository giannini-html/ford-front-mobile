import 'package:ford/models/loja.dart';
import 'package:ford/models/result_endereco.dart';
import 'package:http/http.dart' as http;

class LojaService {
  static Future<http.Response> listarLojas({String? cep}) async {
    final response = await http.get(Uri.parse('localhost:8900/loja'));
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Requisição inválida!');
    }
  }
}
