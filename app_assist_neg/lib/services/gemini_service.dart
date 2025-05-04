import 'dart:convert';
import 'package:http/http.dart' as http;

class GeminiService {
  static const String _apiKey = 'AIzaSyBCN3NR6_l3gb0l7zEvPWjRDZTYXJtfO5I';
  static const String _url =
      'https://generativelanguage.googleapis.com/v1/models/gemini-1.5-pro:generateContent?key=$_apiKey';

  static Future<String> getMarketAnalysis(String descricaoCompleta) async {
    final prompt = descricaoCompleta;

    final response = await http.post(
      Uri.parse(_url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'contents': [
          {
            'parts': [
              {'text': prompt},
            ],
          },
        ],
      }),
    );

    final decoded = jsonDecode(response.body);
    return decoded['candidates']?[0]['content']['parts'][0]['text'] ??
        'Erro ao gerar resposta.';
  }

  // Método alternativo usado por outras telas:
  static Future<String> gerarEstrategia({
    required String setor,
    required String local,
    required String publico,
  }) async {
    final prompt =
        'Tenho uma empresa no setor de $setor localizada em $local com público-alvo $publico. Quais estratégias de negócio e análises de mercado são recomendadas?';

    final response = await http.post(
      Uri.parse(_url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'contents': [
          {
            'parts': [
              {'text': prompt},
            ],
          },
        ],
      }),
    );

    final decoded = jsonDecode(response.body);
    return decoded['candidates']?[0]['content']['parts'][0]['text'] ??
        'Erro ao gerar resposta.';
  }
}
