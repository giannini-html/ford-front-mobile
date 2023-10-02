import 'dart:convert';

import 'package:ford/http/http_client.dart';
import 'package:ford/models/loja.dart';

abstract class ILojaRepository {
  Future<List<Loja>> getLojas();
}

class LojaRepository implements ILojaRepository {
  final IHttpClient client;

  LojaRepository({required this.client});

  @override
  Future<List<Loja>> getLojas() async {
    final response = await client.get(url: 'http://192.168.0.10:8900/loja');
    if (response.statusCode == 200) {
      final List<Loja> lojas = [];

      final body = jsonDecode(response.body);

      body.map((item) {
        final Loja loja = Loja.fromMap(item);
        lojas.add(loja);
      }).toList();

      return lojas;
    } else {
      throw 'Erro';
    }
  }
}
