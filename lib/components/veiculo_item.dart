import 'package:ford/models/tipo_veiculo.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/veiculo.dart';

class VeiculoItem extends StatelessWidget {
  final Veiculo veiculo;
  final void Function()? onTap;
  const VeiculoItem({Key? key, required this.veiculo, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.amber,
        child: Icon(
          Icons.car_crash,
          size: 20,
          color: Colors.white,
        ),
      ),
      title: Text(veiculo.descricao),
      subtitle: Text(veiculo.valor.toString()),
      trailing: Text(
        NumberFormat.simpleCurrency(locale: 'pt_BR').format(veiculo.valor),
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 15,
          color: Colors.green,
        ),
      ),
      onTap: onTap,
    );
  }
}
