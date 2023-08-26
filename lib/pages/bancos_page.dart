import 'package:ford/components/conta_item.dart';
import 'package:flutter/material.dart';

import '../repository/bancos_repositrory.dart';

class BancosPage extends StatefulWidget {
  const BancosPage({super.key});

  @override
  State<BancosPage> createState() => _BancosPageState();
}

class _BancosPageState extends State<BancosPage> {
  final contas = BancosRepository().listarContas();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: contas.length,
      itemBuilder: (context, index) {
        final conta = contas[index];
        return ContaItem(conta: conta);
      },
      separatorBuilder: (context, index) => const Divider(),
    );
  }
}
