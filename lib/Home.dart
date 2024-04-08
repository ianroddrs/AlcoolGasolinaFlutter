import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = "";

  void _calcular() {
    double precoAlcool = double.tryParse(_controllerAlcool.text);
    double precoGasolina = double.tryParse(_controllerGasolina.text);

    if (precoAlcool == null || precoGasolina == null) {
      setState(() {
        _textoResultado =
            'Número inválido, digite números maiores que 0 e utilizando (.)';
      });
    } else {
      // Se o preço do álcool dividido pelo preço da asolina for >= 0.7 é melhor
      // abastecer com gasolina, senão é melhor utilizar álcool

      if ((precoAlcool / precoGasolina) >= 0.7) {
        setState(() {
          _textoResultado = "melhor abastecer com gasolina";
        });
      } else {
        setState(() {
          _textoResultado = "melhor abastecer com álcool";
        });
      }

      _limparCampos();
    }
  }

  void _limparCampos() {
    _controllerAlcool.text = "";
    _controllerGasolina.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Álcool ou Gasolina'),
      ),
      body: Container(
          child: SingleChildScrollView(
        padding: EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Image.asset('assets/img/img01.jpg'),
            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                    "Saiba qual a melhor opção para abastecimento do seu carro",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold))),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Preço Alcool, ex: 1.59"),
              style: TextStyle(fontSize: 22, color: Colors.black),
              controller: _controllerAlcool,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration:
                  InputDecoration(labelText: "Preço Gasolina, ex: 3.15"),
              style: TextStyle(fontSize: 22, color: Colors.black),
              controller: _controllerGasolina,
            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: RaisedButton(
                  color: Colors.lightBlue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Calcular",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  onPressed: _calcular,
                )),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                _textoResultado,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      )),
    );
  }
}
