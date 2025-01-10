import 'package:flutter/material.dart';
import 'package:lazish/widgets/learning_button.dart';

class LearningPathPage extends StatefulWidget {
  @override
  _LevelScreenState createState() => _LevelScreenState();
}

class _LevelScreenState extends State<LearningPathPage> {
  final GlobalKey firstButtonKey = GlobalKey();
  List<LearningButton> buttons = [];

  @override
  void initState() {
    super.initState();
    buttons = [
      LearningButton(
        icon: Icons.star,
        color: Colors.white,
        mainColor: Color(0xffffc106),
        shadowColor: Color(0xffff981f),
        xOffset: 0,
        yOffset: -30,
      ),
      LearningButton(
        icon: Icons.check,
        color: Color(0xffffc106),
        mainColor: Color(0xffffc106),
        shadowColor: Color(0xffff981f),
        xOffset: -60,
        yOffset: 90,
      ),
      LearningButton(
        icon: Icons.description,
        color: Color(0xffffc106),
        mainColor: Color(0xffffc106),
        shadowColor: Color(0xffff981f),
        xOffset: -120,
        yOffset: 210,
      ),
      LearningButton(
        icon: Icons.check,
        color: Color(0xffffc106),
        mainColor: Color(0xffffc106),
        shadowColor: Color(0xffff981f),
        xOffset: -180,
        yOffset: 330,
      ),
      LearningButton(
        icon: Icons.book,
        color: Color(0xffffc106),
        mainColor: Color(0xffffc106),
        shadowColor: Color(0xffff981f),
        xOffset: -120,
        yOffset: 450,
      ),
      LearningButton(
        icon: Icons.adb_outlined,
        color: Color(0xffffc106),
        mainColor: Color(0xffffc106),
        shadowColor: Color(0xffff981f),
        xOffset: -60,
        yOffset: 570,
      ),
      LearningButton(
        icon: Icons.abc,
        color: Color(0xff9e9e9e),
       mainColor: Color.fromARGB(255, 117, 86, 254),
        shadowColor: Color(0xff543acc),
        currentAssignment: true,
        xOffset: 0,
        yOffset: 690,
      ),
      LearningButton(
        icon: Icons.emoji_events,
        color: Color(0xff9e9e9e),
        mainColor: Color(0xffe0e0e0),
        shadowColor: Color(0xffbdbdbe),
        xOffset: -60,
        yOffset: 810,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        // Đảm bảo nội dung có thể cuộn
        child: Column(
          children: [
            const SizedBox(height: 50),
            Image.asset(
              'assets/trophy.png', // Đường dẫn đến tài nguyên hình ảnh của bạn
              width: 130, // Đặt kích thước phù hợp
              height: 125, // Đặt kích thước phù hợp
              fit: BoxFit.cover, // Đảm bảo hình ảnh được căn chỉnh đẹp
            ),
            const SizedBox(height: 30),
            LearningButton(
              icon: Icons.lock,
              color: Color(0xff9e9e9e),
              xOffset: 0,
              yOffset: 0,
              mainColor: Color(0xffe0e0e0),
              shadowColor: Color(0xffbdbdbe),
            ),
            SizedBox(
              // Điều chỉnh chiều cao để đảm bảo không gian cho các button
              height: 1000, // Chiếm phần lớn không gian màn hình
              child: LayoutBuilder(
                builder: (context, constraints) {
                  double startX = constraints.maxWidth * 0.6;
                  double startY = constraints.maxHeight * 0.05;

                  return Stack(
                    children: [
                      CustomPaint(
                        size: Size(constraints.maxWidth, constraints.maxHeight),
                      ),
                      ...buttons.map((button) {
                        return Positioned(
                          left: startX + button.xOffset,
                          top: startY + button.yOffset,
                          child: button,
                        );
                      }).toList(),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShineEffectPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.white.withOpacity(0.3),
          Colors.white.withOpacity(0),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width * 0.7, size.height * 0.7));

    final path = Path()
      ..moveTo(0, size.height * 0.35)
      ..quadraticBezierTo(
        size.width * 0.3,
        size.height * 0.1,
        size.width * 0.4,
        0,
      )
      ..lineTo(0, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
