import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeakingPage extends StatefulWidget {
  const SpeakingPage({super.key});

  @override
  State<SpeakingPage> createState() => _SpeakingPageState();
}

class _SpeakingPageState extends State<SpeakingPage> {
  final FlutterTts flutterTts = FlutterTts();
  final SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _wordSpoken = "";

  @override
  void initState() {
    super.initState();
    initSpeech();
  }
  Future<void> _speak(String text) async {
    try {
      await flutterTts.setLanguage("en-US");
      await flutterTts.setPitch(1.0);
      await flutterTts.speak(text);
    } catch (e) {
      print("Error: $e");
    }
  }
  void initSpeech() async {
    _speechEnabled = await _speechToText.initialize(
      debugLogging: true,
    );
    log(_speechEnabled.toString());
    setState(() {});
  }

  void _startListening() async {
    await _speechToText.listen(
      onResult: _onSpeechResult, // Truyền callback đúng
      pauseFor: Duration(seconds: 10),  // Tạm dừng sau 5 giây không phát hiện giọng nói

    );
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      log(result.recognizedWords); // Log ra kết quả nhận dạng (debug
      _wordSpoken = result.recognizedWords; // Đúng cú pháp
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              const Text(
                'Nói lại câu sau',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/lazish.png',
                      height: 100,
                      width: 100,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Container(
                        height: 86,
                        decoration: BoxDecoration(
                          color: Color(0xFFFF9F9F9),
                          // Background color
                          border: Border.all(color: Colors.black),
                          // Border color
                          borderRadius: BorderRadius.circular(
                              8), // Optional: rounded corners
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () =>  _speak("The call is from your mother"),
                              child: const Icon(
                                Icons.volume_up,
                                color: Color(0xFFF583FC9),
                                size: 30,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Flexible(
                              // Đảm bảo Text không bị overflow
                              child: Text(
                                'The call is from your mother',
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                                softWrap: true, // Cho phép xuống dòng
                                overflow: TextOverflow.visible, // Không cắt bớt
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              InkWell(
                onTap: _speechToText.isListening
                    ? _stopListening
                    : _startListening,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 86,
                        decoration: BoxDecoration(
                          // Background color
                          border: Border.all(color: Colors.black),
                          // Border color
                          borderRadius: BorderRadius.circular(
                              8), // Optional: rounded corners
                        ),
                        child:
                        _speechToText.isListening ? Image.asset(
                          "assets/recording.png",
                        ) :
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.mic,
                              color: Color(0xFFF866CFE),
                              size: 30,
                            ),
                            const SizedBox(width: 8),
                            Flexible(
                              // Đảm bảo Text không bị overflow
                              child: Text(
                                'Tap to talks',
                                style: const TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFF866CFE),
                                ),
                                softWrap: true, // Cho phép xuống dòng
                                overflow: TextOverflow.visible, // Không cắt bớt
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Text(_speechToText.isListening
                    ? "listening..."
                    : _speechEnabled
                        ? "Tap the mic"
                        : "Speech not available"),
              ),
              Text(
                _wordSpoken,
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 25),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
