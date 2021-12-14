import 'package:calculadora/componetes/Interface.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  TextEditingController _numero1 = TextEditingController();
  TextEditingController _numero2 = TextEditingController();
  String resultado = "";

 void _operacoes(String op) {
    double n1 = double.tryParse(_numero1.text);
    double n2 = double.tryParse(_numero2.text);
    String res = "";

    void teste(Context){

    }
    if (n1 == null || n2 == null) {
      setState(() {
        resultado = "Valor invalido informe um valor para realizar o calculo";

      });
      return ;
    }
    if (n2 == 0 && op == 'd') {
      setState(() {
        resultado = "impossivel dividir por 0";

      });
      return ;
    }
    switch (op) {
      case "s":
        res = n1.toString() +
            " + " +
            n2.toString() +
            " = " +
            (n1 + n2).toString();
        break;
      case "d":
        res = n1.toString() +
            " / " +
            n2.toString() +
            " = " +
            (n1 / n2).toString();
        break;
      case "m":
        res = n1.toString() +
            " X " +
            n2.toString() +
            " = " +
            (n1 * n2).toString();
        break;
        break;
      case "sub":
        res = n1.toString() +
            " - " +
            n2.toString() +
            " = " +
            (n1 - n2).toString();
        break;
    }
    setState(() {
      resultado = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calculadora")),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(20),
                child:
                    Interface.textField("informe o primeiro número", _numero1)),
            Padding(
                padding: EdgeInsets.all(20),
                child:
                    Interface.textField("informe o segundo número", _numero2)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Interface.botao("+", () => _operacoes("s")),
                Interface.botao("-", () => _operacoes("sub")),
                Interface.botao("X", () => _operacoes("m")),
                Interface.botao("/", () => _operacoes("d")),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                resultado,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
