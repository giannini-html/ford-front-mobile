import 'package:flutter/material.dart';

class CadastroPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CadastroPageState();
  }
}

class CadastroPageState extends State<CadastroPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
        decoration: InputDecoration(labelText: 'Nome'),
        maxLength: 10,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Nome obrigatório';
          }

          return null;
        });
  }

  Widget _buildEmail() {
    return TextFormField(
        decoration: InputDecoration(labelText: 'Email'),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Email obrigatório';
          }

          if (!RegExp(
                  r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
              .hasMatch(value)) {
            return 'Por favor insira um email';
          }

          return null;
        });
  }

  Widget _buildPassword() {
    return TextFormField(
        decoration: InputDecoration(labelText: 'Senha'),
        keyboardType: TextInputType.visiblePassword,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Senha obrigatória';
          }

          return null;
        });
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
        decoration: InputDecoration(labelText: 'Número de Telefone'),
        keyboardType: TextInputType.phone,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Número obrigatório';
          }

          return null;
        });
  }

  Widget _buildCep() {
    return TextFormField(
        decoration: InputDecoration(labelText: 'CEP'),
        keyboardType: TextInputType.text,
        validator: (value) {
          if (value!.isEmpty) {
            return 'CEP obrigatório';
          }

          return null;
        });
  }

  Widget _buildEstado() {
    return TextFormField(
        enabled: false,
        decoration: InputDecoration(labelText: 'Estado'),
        keyboardType: TextInputType.text,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Estado obrigatório';
          }

          return null;
        });
  }

  Widget _buildCidade() {
    return TextFormField(
        enabled: false,
        decoration: InputDecoration(labelText: 'Cidade'),
        keyboardType: TextInputType.text,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Cidade obrigatório';
          }

          return null;
        });
  }

  Widget _buildRua() {
    return TextFormField(
        enabled: false,
        decoration: InputDecoration(labelText: 'Rua'),
        keyboardType: TextInputType.text,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Rua obrigatório';
          }

          return null;
        });
  }

  Widget _buildNumero() {
    return TextFormField(
        decoration: InputDecoration(labelText: 'Número'),
        keyboardType: TextInputType.number,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Rua obrigatório';
          }

          return null;
        });
  }

  Widget _buildComplemento() {
    return TextFormField(
        decoration: InputDecoration(labelText: 'Complemento'),
        keyboardType: TextInputType.text,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Rua obrigatório';
          }

          return null;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cadastro")),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildName(),
                _buildEmail(),
                _buildPassword(),
                _buildPhoneNumber(),
                _buildCep(),
                _buildEstado(),
                _buildCidade(),
                _buildRua(),
                _buildNumero(),
                _buildComplemento(),
                const SizedBox(height: 100),
                InkWell(
                  child: const ButtonBar(children: [
                    Text(
                      'Submit',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18,
                          fontWeight: FontWeight.w900),
                    ),
                  ]),
                  onTap: () {
                    //Enviar a api challange
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }

                    _formKey.currentState!.save();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
