import 'package:flutter/material.dart';

import '../models/loja.dart';

class LojaItem extends StatelessWidget {
  final Loja loja;
  final void Function()? onTap;
  const LojaItem({Key? key, required this.loja, this.onTap}) : super(key: key);

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
      onTap: onTap,
    );
  }
}
