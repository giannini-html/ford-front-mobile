import 'package:ford/http/http_client.dart';
import 'package:ford/models/loja.dart';
import 'package:ford/repository/loja_repository.dart';
import 'package:flutter/material.dart';
import 'package:ford/stores/loja_store.dart';

import '../components/loja_item.dart';

class LojasPage extends StatefulWidget {
  const LojasPage({super.key});

  @override
  State<LojasPage> createState() => _LojasPageState();
}

class _LojasPageState extends State<LojasPage> {
  final LojaStore store = LojaStore(
    repository: LojaRepository(
      client: HttpClient(),
    ),
  );
  late List<Loja> lojas;

  @override
  void initState() {
    store.getLojas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lojas'),
          actions: [],
        ),
        body: AnimatedBuilder(
          animation: Listenable.merge([
            store.isLoading,
            store.erro,
            store.state,
          ]),
          builder: (context, child) {
            if (store.isLoading.value) {
              return const CircularProgressIndicator();
            }

            if (store.erro.value.isNotEmpty) {
              return Center(
                child: Text('Erro'),
              );
            }

            if (store.state.value.isEmpty) {
              return Center(
                child: Text('Nenhum Item na Lista'),
              );
            } else {
              return ListView.separated(
                itemCount: store.state.value.length,
                itemBuilder: (context, index) {
                  final loja = store.state.value[index];
                  return LojaItem(
                    loja: loja,
                    onTap: () {
                      Navigator.pushNamed(context, '/lojas-detalhes',
                          arguments: loja);
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
              );
            }
          },
        ));
  }
}
