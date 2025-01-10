import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeakingPage extends StatefulWidget {
  final VoidCallback onContinue;

  const SpeakingPage({
    super.key,
    required this.onContinue,
  });

  @override
  State<SpeakingPage> createState() => _SpeakingPageState();
}

class _SpeakingPageState extends State<SpeakingPage> {
  final FlutterTts flutterTts = FlutterTts();
  final SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _wordSpoken = "";
  bool _isTapped = false; // Add this variable

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
      pauseFor: Duration(
          seconds: 10), // Tạm dừng sau 5 giây không phát hiện giọng nói
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

  void _showSuccessBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Wrap(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF00D68F), // Green color
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Đảm bảo chiều cao tự động
                  children: [
                    // Top row with check icon and text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Left side - Check icon and text
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.9),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.check,
                                color: Color(0xFF00D68F),
                                size: 20,
                              ),
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Tuyệt vời!',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    // Spacer to push button to bottom
                    SizedBox(height: 40),
                    // Continue Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          widget.onContinue();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          padding: EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Text(
                          'TIẾP TỤC',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF00D68F),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showErrorBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Wrap(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFF65555),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  // Đảm bảo chiều cao tự động
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // Căn nội dung về phía trái
                  children: [
                    // Top row with check icon and text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Left side - Check icon and text
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.9),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.check,
                                color: Color(0xFFF65555),
                                size: 20,
                              ),
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Sai mất rồi 😞!',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Đáp án chính xác",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),

                    // Continue Button
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              padding: EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Text(
                              'THỬ LẠI',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFF65555),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              widget.onContinue();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              padding: EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Text(
                              'TIẾP TỤC',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFF65555),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 33),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                              onTap: () =>
                                  _speak("The call is from your mother"),
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
                onTap: () {
                  setState(() {
                    _isTapped = !_isTapped;
                  });
                  if (_isTapped) {
                    _startListening();
                  } else {
                    _stopListening();
                  }
                },
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
                        child: _isTapped
                            ? Image.asset(
                                "assets/recording.png",
                              )
                            : Row(
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
                                      overflow:
                                          TextOverflow.visible, // Không cắt bớt
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
              Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    widget.onContinue();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF6949FF),
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  child: Text(
                    'Tôi không thể nói lúc này! ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_wordSpoken == "the call is from your mother") {
                      _showSuccessBottomSheet(context);
                    } else {
                      _showErrorBottomSheet(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF6949FF),
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  child: Text(
                    'Kiểm tra đáp án',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
