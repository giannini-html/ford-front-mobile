import 'dart:convert';

class ResultEndereco {
  String cep;
  String logradouro;
  String complemento;
  String bairro;
  String localidade;
  String uf;

  ResultEndereco({
    required this.cep,
    required this.logradouro,
    required this.complemento,
    required this.bairro,
    required this.localidade,
    required this.uf,
  });

  factory ResultEndereco.fromJson(String str) =>
      ResultEndereco.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResultEndereco.fromMap(Map<String, dynamic> json) => ResultEndereco(
        cep: json["cep"],
        logradouro: json["logradouro"],
        complemento: json["complemento"],
        bairro: json["bairro"],
        localidade: json["localidade"],
        uf: json["uf"],
      );

  Map<String, dynamic> toMap() => {
        "cep": cep,
        "logradouro": logradouro,
        "complemento": complemento,
        "bairro": bairro,
        "localidade": localidade,
        "uf": uf,
      };
}
