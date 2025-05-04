// result_screen.dart
import 'package:flutter/material.dart';
import '../services/gemini_service.dart';

class ResultScreen extends StatefulWidget {
  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  String _resposta = 'Carregando...';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    _gerarResposta(args);
  }

  void _gerarResposta(Map dados) async {
    final resultado = await GeminiService.gerarEstrategia(
      setor: dados['setor'],
      local: dados['local'],
      publico: dados['publico'],
    );
    setState(() {
      _resposta = resultado;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sugestões Estratégicas')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(child: Text(_resposta)),
      ),
    );
  }
}
