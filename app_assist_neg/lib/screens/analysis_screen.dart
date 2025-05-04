import 'package:flutter/material.dart';
import '../services/gemini_service.dart';

class AnalysisScreen extends StatefulWidget {
  @override
  _AnalysisScreenState createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends State<AnalysisScreen> {
  final _controller = TextEditingController();
  String _conversationHistory = '';
  bool _loading = false;

  void _analyze() async {
    if (_controller.text.trim().isEmpty) return;

    setState(() => _loading = true);

    _conversationHistory += "\nUsuário: ${_controller.text}\n";

    FocusScope.of(context).unfocus();

    final response = await GeminiService.getMarketAnalysis(
      _conversationHistory,
    );

    _conversationHistory += "Assistente: $response\n";

    setState(() {
      _loading = false;
      _controller.clear();
    });
  }

  void _resetAnalysis() {
    setState(() {
      _conversationHistory = '';
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text('🔎 Assistente de Negócios'),
        backgroundColor: Colors.green.shade900,
        actions: [
          IconButton(
            onPressed: _resetAnalysis,
            icon: Icon(Icons.refresh),
            tooltip: 'Nova Análise',
          ),
        ],
      ),
      backgroundColor: isDark ? Colors.grey[900] : Colors.grey[850],
      body: Column(
        children: [
          Expanded(
            child:
                _conversationHistory.isEmpty
                    ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Text(
                          'Descreva sua empresa ou comece a análise...',
                          style: TextStyle(fontSize: 20, color: Colors.white70),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                    : Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SingleChildScrollView(
                        reverse: true,
                        child: Text(
                          _conversationHistory,
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
          ),
          Container(
            color: Colors.grey[800],
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    style: TextStyle(color: Colors.white),
                    onSubmitted: (value) {
                      _analyze();
                    },
                    decoration: InputDecoration(
                      hintText: 'Digite sua mensagem...',
                      hintStyle: TextStyle(color: Colors.white54),
                      filled: true,
                      fillColor: Colors.grey[700],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                _loading
                    ? SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                    : IconButton(
                      icon: Icon(Icons.send, color: Colors.white),
                      onPressed: _analyze,
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
