import 'package:flutter/material.dart';
import 'package:ford/repository/auth_repository.dart';
import 'package:ford/services/endereco_service.dart';

class CadastroPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CadastroPageState();
  }
}

class CadastroPageState extends State<CadastroPage> {
  bool _loading = false;
  bool _enableField = true;
  late String _result = "";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final nomeController = TextEditingController();
  final sobrenomeController = TextEditingController();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final cpfController = TextEditingController();
  final cepController = TextEditingController();
  final estadoController = TextEditingController();
  final cidadeController = TextEditingController();
  final ruaController = TextEditingController();
  final numeroController = TextEditingController();
  final complementoController = TextEditingController();

  Widget _buildName() {
    return TextFormField(
        controller: nomeController,
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
        controller: emailController,
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
        controller: senhaController,
        decoration: InputDecoration(labelText: 'Senha'),
        keyboardType: TextInputType.visiblePassword,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Senha obrigatória';
          }

          return null;
        });
  }

  Widget _buildCpf() {
    return TextFormField(
        controller: cpfController,
        decoration: InputDecoration(labelText: 'CPF'),
        keyboardType: TextInputType.text,
        validator: (value) {
          if (value!.isEmpty) {
            return 'CPF obrigatório';
          }

          return null;
        });
  }

  Widget _buildCep() {
    return TextFormField(
        controller: cepController,
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
        controller: estadoController,
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
        controller: cidadeController,
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
        controller: ruaController,
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
        controller: numeroController,
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
        controller: complementoController,
        decoration: InputDecoration(labelText: 'Complemento'),
        keyboardType: TextInputType.text,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Rua obrigatório';
          }

          return null;
        });
  }

  Widget _buildSearchCepButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: MenuItemButton(
        onPressed: _searchCep,
        child: _loading ? _circularLoading() : Text('Consultar'),
      ),
    );
  }

  void _exibirMensagem(String mensagem) {
    final snackbar = SnackBar(content: Text(mensagem));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void onTapBtnRegistrar() {
    if (_formKey.currentState!.validate()) {
      final repo = AuthRepository();
      repo
          .registrar(emailController.text, senhaController.text)
          .then((sucesso) {
        if (sucesso) {
          Navigator.pushReplacementNamed(context, "/home");
        } else {
          _exibirMensagem("E-mail já cadastrado");
        }
      }).catchError((e) {
        _exibirMensagem(e.toString());
      });
    }
  }

  void _searching(bool enable) {
    setState(() {
      _result = enable ? '' : _result;
      _loading = enable;
      _enableField = !enable;
    });
  }

  Widget _circularLoading() {
    return Container(
      height: 15.0,
      width: 15.0,
      child: CircularProgressIndicator(),
    );
  }

  Future _searchCep() async {
    _searching(true);

    final cep = cepController.text;

    final resultCep = await EnderecoService.fetchCep(cep: cep);

    setState(() {
      estadoController.text = resultCep.uf;
      cidadeController.text = resultCep.localidade;
      ruaController.text = resultCep.logradouro;
    });

    _searching(false);
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
                _buildCpf(),
                _buildCep(),
                _buildSearchCepButton(),
                _buildEstado(),
                _buildCidade(),
                _buildRua(),
                _buildNumero(),
                _buildComplemento(),
                const SizedBox(height: 100),
                InkWell(
                  child: const ButtonBar(children: [
                    Text(
                      'Cadastrar-se',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18,
                          fontWeight: FontWeight.w900),
                    ),
                  ]),
                  onTap: () {
                    //Enviar a api challange
                    if (!_formKey.currentState!.validate()) {
                      onTapBtnRegistrar();
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
