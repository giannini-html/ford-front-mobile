import 'package:ford/pages/bancos_page.dart';
import 'package:ford/pages/lojas_page.dart';
import 'package:ford/pages/veiculos_page.dart';
import 'package:ford/pages/menu_bar.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuBarra(),
      appBar: AppBar(
        title: Text("Ford"),
      ),
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: const [
        LojasPage(),
        VeiculosPage(),
        BancosPage(),
      ],
    );
  }

  Widget getFooter() {
    List<BottomNavigationBarItem> items = const [
      BottomNavigationBarItem(
        icon: Icon(Ionicons.storefront),
        label: 'Lojas',
      ),
      BottomNavigationBarItem(
        icon: Icon(Ionicons.car_outline),
        label: 'Veículos',
      ),
      BottomNavigationBarItem(
        icon: Icon(Ionicons.wallet_outline),
        label: 'Emprestimos',
      ),
    ];

    return BottomNavigationBar(
      items: items,
      type: BottomNavigationBarType.fixed,
      currentIndex: pageIndex,
      onTap: (index) {
        setState(() {
          pageIndex = index;
        });
      },
    );
  }
}
