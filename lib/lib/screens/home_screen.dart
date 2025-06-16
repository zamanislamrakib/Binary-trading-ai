import 'package:flutter/material.dart';
import '../widgets/voice_input.dart';
import '../widgets/voice_output.dart';
import '../services/chatgpt_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String spokenText = '';
  String aiReply = '';
  bool isSpeaking = false;

  final ChatGPTService _chatService = ChatGPTService();

  void handleVoiceInput(String text) async {
    setState(() {
      spokenText = text;
      aiReply = '⌛ AI is thinking...';
      isSpeaking = false;
    });

    final reply = await _chatService.getChatResponse(text);

    setState(() {
      aiReply = reply;
      isSpeaking = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Binary Trading AI')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('🎤 You said:\n$spokenText'),
            const SizedBox(height: 16),
            Text('🤖 AI says:\n$aiReply'),
            const SizedBox(height: 16),
            VoiceInput(onResult: handleVoiceInput),
            if (isSpeaking) VoiceOutput(text: aiReply),
          ],
        ),
      ),
    );
  }
}
