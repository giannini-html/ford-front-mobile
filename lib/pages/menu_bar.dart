import 'package:flutter/material.dart';

class MenuBarra extends StatelessWidget {
  const MenuBarra({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            child: Container(
              child: Row(
                children: [
                  ButtonBar(
                    children: [
                      Icon(
                        Icons.stay_primary_portrait,
                        color: Color.fromARGB(255, 150, 144, 142),
                      ),
                      Text("Login"),
                    ],
                  ),
                ],
              ),
              margin: EdgeInsets.only(top: 80, bottom: 15),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/login');
            },
          ),
          InkWell(
            child: Row(
              children: [
                ButtonBar(
                  children: [
                    Icon(
                      Icons.people,
                      color: Color.fromARGB(255, 150, 144, 142),
                    ),
                    Text("Cadastre-se"),
                  ],
                ),
              ],
            ),
            onTap: () {
              Navigator.pushNamed(context, '/cadastro');
            },
          )
        ],
      ),
    );
  }
}
