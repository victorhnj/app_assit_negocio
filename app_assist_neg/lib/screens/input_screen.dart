// input_screen.dart
import 'package:flutter/material.dart';

class InputScreen extends StatefulWidget {
  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final TextEditingController _setorController = TextEditingController();
  final TextEditingController _localController = TextEditingController();
  final TextEditingController _publicoController = TextEditingController();

  void _enviarDados() {
    final setor = _setorController.text;
    final local = _localController.text;
    final publico = _publicoController.text;

    Navigator.pushNamed(
      context,
      '/result',
      arguments: {'setor': setor, 'local': local, 'publico': publico},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Informações do Negócio')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _setorController,
              decoration: InputDecoration(labelText: 'Setor (ex: Alimentação)'),
            ),
            TextField(
              controller: _localController,
              decoration: InputDecoration(
                labelText: 'Localização (ex: São Paulo)',
              ),
            ),
            TextField(
              controller: _publicoController,
              decoration: InputDecoration(labelText: 'Público-Alvo'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _enviarDados,
              child: Text('Gerar Estratégia'),
            ),
          ],
        ),
      ),
    );
  }
}
