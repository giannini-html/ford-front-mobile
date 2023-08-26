import 'package:ford/models/lojas.dart';
import 'package:flutter/material.dart';

class LojaItem extends StatelessWidget {
  final Loja loja;
  const LojaItem({super.key, required this.loja});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: loja.cor,
        child: Icon(
          loja.icone,
          size: 20,
          color: Colors.white,
        ),
      ),
      title: Text(
        loja.nome,
      ),
      trailing: Text(
        loja.bairro,
        style: TextStyle(
          fontSize: 14,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
      ),
    );
  }
}
