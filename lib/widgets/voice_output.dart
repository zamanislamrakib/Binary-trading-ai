import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class VoiceOutput extends StatefulWidget {
  final String text;

  const VoiceOutput({super.key, required this.text});

  @override
  State<VoiceOutput> createState() => _VoiceOutputState();
}

class _VoiceOutputState extends State<VoiceOutput> {
  final FlutterTts _flutterTts = FlutterTts();

  @override
  void initState() {
    super.initState();
    _speak(widget.text);
  }

  Future<void> _speak(String text) async {
    await _flutterTts.setLanguage("en-US");
    await _flutterTts.setPitch(1.0);
    await _flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink(); // UI-তে কিছু দেখানোর দরকার নেই
  }
}
