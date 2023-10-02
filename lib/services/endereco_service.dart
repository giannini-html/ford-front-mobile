import 'package:ford/models/result_endereco.dart';
import 'package:http/http.dart' as http;

class EnderecoService {
  static Future<ResultEndereco> fetchCep({String? cep}) async {
    final response =
        await http.get(Uri.parse('https://viacep.com.br/ws/$cep/json/'));
    if (response.statusCode == 200) {
      return ResultEndereco.fromJson(response.body);
    } else {
      throw Exception('Requisição inválida!');
    }
  }
}
