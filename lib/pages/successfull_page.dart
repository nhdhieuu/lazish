import 'package:flutter/material.dart';
import 'package:lazish/pages/main_layout_page.dart';

class SuccessfullPage extends StatelessWidget {
  const SuccessfullPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 42),
            // Khung tin nhắn
            Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Text(
                    'Tuyệt vời!',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff747475),
                    ),
                  ),
                ),
                CustomPaint(
                  painter: ChatBubbleTrianglePainter(Colors.white),
                  size: const Size(20, 10),
                ),
              ],
            ),
            const SizedBox(
                height: 16), // Khoảng cách giữa tin nhắn và biểu tượng
            // Biểu tượng Sloth
            CircleAvatar(
              radius: 120,
              backgroundColor: Colors.transparent,
              child: ClipOval(
                child: Image.asset(
                  'assets/lazish.png',
                  width: 240, // Kích thước phải bằng radius * 2
                  height: 220,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(height: 80),
            // Title
            const Text(
              'Chào mừng',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Color(0xff6949ff),
              ),
            ),
            // Subtitle
            const SizedBox(height: 20),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.0),
                child: SizedBox(
                  width: 250,
                  child: Text(
                    'Hãy lên đường, bạn đã sẵn sàng đi đến thành công!',
                    textAlign: TextAlign.center, // Căn giữa nội dung
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff747475),
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            // Buttons
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Xử lý khi nhấn nút "BẮT ĐẦU"
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MainLayoutPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff6949ff),
                        minimumSize: const Size(double.infinity, 55),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 0),
                      ),
                      child: const Center(
                        child: Text(
                          'TIẾP TỤC',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class ChatBubbleTrianglePainter extends CustomPainter {
  final Color color;

  ChatBubbleTrianglePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width / 2, size.height)
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawShadow(path, Colors.black.withOpacity(0.1), 4, false);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
