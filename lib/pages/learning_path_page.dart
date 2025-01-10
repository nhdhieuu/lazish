import 'package:flutter/material.dart';
import 'package:lazish/widgets/learning_button.dart';

class LearningPathPage extends StatefulWidget {
  final String title;
  final Color color;

  const LearningPathPage({
    Key? key,
    required this.title,
    required this.color,
  }) : super(key: key);
  @override
  _LevelScreenState createState() => _LevelScreenState();
}

class _LevelScreenState extends State<LearningPathPage> {
  final GlobalKey firstButtonKey = GlobalKey();
  List<LearningButton> buttons = [];
  List<LearningButton> buttons2 = [];

  @override
  void initState() {
    super.initState();
    buttons = [
      LearningButton(
        icon: Icons.star,
        color: Colors.white,
        mainColor: Color(0xffffc106),
        shadowColor: Color(0xffff981f),
        xOffset: -40,
        yOffset: -35,
      ),
      LearningButton(
        icon: Icons.check,
        color: Color(0xffffc106),
        mainColor: Color(0xffffc106),
        shadowColor: Color(0xffff981f),
        xOffset: 10,
        yOffset: 80,
      ),
      LearningButton(
        icon: Icons.description,
        color: Color(0xffffc106),
        mainColor: Color(0xffffc106),
        shadowColor: Color(0xffff981f),
        xOffset: -40,
        yOffset: 195,
      ),
      LearningButton(
        icon: Icons.emoji_events,
        color: Color(0xffffc106),
        mainColor: Color(0xffffc106),
        shadowColor: Color(0xffff981f),
        xOffset: -95,
        yOffset: 310,
      ),
    ];
    buttons2 = [
      LearningButton(
        icon: Icons.book,
        color: Color(0xffffc106),
        mainColor: Color(0xffffc106),
        shadowColor: Color(0xffff981f),
        xOffset: -95,
        yOffset: 480,
      ),
      LearningButton(
        icon: Icons.adb_outlined,
        color: Color(0xffffc106),
        mainColor: Color(0xffffc106),
        shadowColor: Color(0xffff981f),
        xOffset: -145,
        yOffset: 595,
      ),
      LearningButton(
        icon: Icons.adb_outlined,
        color: Color(0xffffc106),
        mainColor: Color(0xffffc106),
        shadowColor: Color(0xffff981f),
        xOffset: -195,
        yOffset: 710,
      ),
      LearningButton(
        icon: Icons.abc,
        color: Color(0xff9e9e9e),
        mainColor: Color.fromARGB(255, 117, 86, 254),
        shadowColor: Color(0xff543acc),
        currentAssignment: true,
        xOffset: -145,
        yOffset: 825,
      ),
      LearningButton(
        icon: Icons.emoji_events,
        color: Color(0xff9e9e9e),
        mainColor: Color(0xffe0e0e0),
        shadowColor: Color(0xffbdbdbe),
        xOffset: -95,
        yOffset: 940,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),

        backgroundColor: Color(0xff6949ff),
        elevation: 0,
        titleTextStyle: TextStyle(fontSize: 16),
        automaticallyImplyLeading: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Ngọn lửa và số
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipOval(
                  child: Image.asset(
                    'assets/fire.png', // Đường dẫn đến hình biểu tượng
                    width: 24,
                    height: 24,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 6),
                const Text(
                  '4',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            // Hình lục giác và số
            const SizedBox(
              width: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipOval(
                  child: Image.asset(
                    'assets/gem.png', // Đường dẫn đến hình biểu tượng
                    width: 24,
                    height: 24,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 6),
                const Text(
                  '957',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        // Đảm bảo nội dung có thể cuộn
        child: Column(
          children: [
            const SizedBox(height: 16,),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
              decoration: BoxDecoration(
                color: widget.color, // Màu nền của container
                borderRadius: BorderRadius.circular(12), // Bo tròn các góc
              ),
              child: Text(
                "Chủ đề: ${widget.title}",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Màu chữ
                ),
              ),
            ),
            const SizedBox(height: 16,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 1.5,
                      color: Colors.grey[300],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Phần 1',
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 1.0,
                      color: Colors.grey[300],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            LearningButton(
              icon: Icons.star,
              color: Colors.white,
              mainColor: Color(0xffffc106),
              shadowColor: Color(0xffff981f),
              xOffset: 0,
              yOffset: 0,
            ),
            SizedBox(
              height: 1115,
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
                      Positioned(
                        top: startY + 435,
                        // Adjust left position to allow space for the divider
                        left: 16, // Add padding from left
                        right: 16, // Add padding from right
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 1.5,
                                color: Colors.grey[300],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                'Phần 2',
                                style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 1.0,
                                color: Colors.grey[300],
                              ),
                            ),
                          ],
                        ),
                      ),
                      ...buttons2.map((button) {
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
            )
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
