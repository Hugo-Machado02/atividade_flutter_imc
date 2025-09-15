import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController pesoController = TextEditingController();
  final TextEditingController alturaController = TextEditingController();
  String _resultado = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calculadora de IMC',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      backgroundColor: Colors.black87,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: TextField(
              controller: pesoController,
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Colors.greenAccent, fontSize: 18),
              decoration: InputDecoration(
                labelText: 'Peso',
                suffix: Text('Kg', style: TextStyle(color: Colors.greenAccent)),
                labelStyle: const TextStyle(
                  color: Colors.greenAccent,
                  fontSize: 18,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Colors.greenAccent,
                    width: 2, // largura da borda
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: TextField(
              controller: alturaController,
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Colors.greenAccent, fontSize: 18),
              decoration: InputDecoration(
                labelText: 'Altura',
                suffix: Text('M', style: TextStyle(color: Colors.greenAccent)),
                labelStyle: const TextStyle(
                  color: Colors.greenAccent,
                  fontSize: 18,
                ),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.greenAccent, width: 2),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(top: 30),
                width: 200,
                height: 80,
                child: ElevatedButton(
                  child: const Text(
                    'Calcular',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                  ),
                  onPressed: () {
                    double peso = double.parse(pesoController.text);
                    double altura = double.parse(alturaController.text);

                    setState(() {
                      double imc = peso / (altura * altura);
                      print(peso);
                      print(altura);
                      print(imc);

                      if (imc < 18.5) {
                        _resultado = "Abaixo do peso";
                      } else if (imc >= 18.5 && imc < 25) {
                        _resultado = "Peso Ideal";
                      } else if (imc >= 25 && imc < 30) {
                        _resultado = "Levemente acima do Peso";
                      } else if (imc >= 30 && imc < 35) {
                        _resultado = "Obesidade grau I";
                      } else if (imc >= 35 && imc < 40) {
                        _resultado = "Obesidade grau II (Severa)";
                      } else {
                        _resultado = "Obesidade III (Morbida)";
                      }
                    });
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 30),
                child: ElevatedButton(
                  child: Icon(Icons.refresh_outlined, color: Colors.black),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(25),
                    backgroundColor: Colors.greenAccent,
                  ),
                  onPressed: () {
                    setState(() {
                      pesoController.clear();
                      alturaController.clear();
                    });
                  },
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Text(
              _resultado,
              style: TextStyle(
                fontSize: 25,
                color: Colors.greenAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
