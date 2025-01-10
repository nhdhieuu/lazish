import 'package:flutter/material.dart';

class LearningButton extends StatefulWidget {
  final IconData icon;
  final Color color;
  final double xOffset;
  final double yOffset;
  final Color mainColor;
  final Color shadowColor;
  final bool currentAssignment;

  const LearningButton({
    Key? key,
    required this.icon,
    this.currentAssignment = false,
    required this.color,
    required this.xOffset,
    required this.yOffset,
    required this.mainColor,
    required this.shadowColor,
  }) : super(key: key);

  @override
  _LearningButtonState createState() => _LearningButtonState();
}

class _LearningButtonState extends State<LearningButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    // Chỉ khởi tạo animation khi currentAssignment là true
    if (widget.currentAssignment) {
      _controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 1),
        lowerBound: -5.0,
        upperBound: 5.0,
      )..repeat(reverse: true); // Lặp lại hiệu ứng

      _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 118,
      height: 100,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.elliptical(75, 60)),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  widget.mainColor,
                  widget.mainColor,
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: widget.shadowColor,
                  offset: Offset(0, 12),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: CustomPaint(
                painter: ShineEffectPainter(),
                child: Container(),
              ),
            ),
          ),

          // White rounded square with icon or just star icon
          Center(
            child: widget.icon == Icons.star
                ? Icon(
                    widget.icon,
                    size: 44,
                    color: widget.color,
                  )
                : widget.icon == Icons.lock
                    ? Icon(
                        widget.icon,
                        size: 44,
                        color: widget.color,
                      )
                    : Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 5,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Icon(
                          widget.icon,
                          size: 26,
                          color: widget.color,
                        ),
                      ),
          ),

          // Kiểm tra nếu currentAssignment là true mới hiển thị chat bubble
          if (widget.currentAssignment)
            Positioned(
              left: 15,
              top: 0,
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform.translate(
                    offset:
                        Offset(0, _controller.value * 2), // Di chuyển lên xuống
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 12,
                                offset: const Offset(0, 6),
                              ),
                            ],
                            border: Border.all(
                              color: Color(0xff543acc), // Màu viền (có thể thay đổi)
                              width: 2, // Độ dày của viền
                            ),
                          ),
                          child: const Text(
                            'Bắt đầu!',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff543acc),
                            ),
                          ),
                        ),
                        CustomPaint(
                          painter: ChatBubbleTrianglePainter(Colors.white),
                          size: const Size(20, 10),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}

class ShineEffectPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12
      ..shader = LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          Colors.white.withOpacity(0.6),
          Colors.white.withOpacity(0.6),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..strokeCap = StrokeCap.round;

    final path = Path();

    path.moveTo(2, size.height * 0.50);

    Rect rect = Rect.fromCircle(
      center: Offset(55, 60),
      radius: 56.5,
    );

    path.arcTo(
      rect,
      3.6,
      0.85,
      false,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class ChatBubbleTrianglePainter extends CustomPainter {
  final Color color;

  ChatBubbleTrianglePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    // Vẽ phần bên trong tam giác với màu sắc đã truyền vào
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width / 2, size.height)
      ..lineTo(size.width, 0)
      ..close();

    // Vẽ bóng đổ
    canvas.drawShadow(path, Colors.black.withOpacity(0.1), 4, false);
    
    // Vẽ phần bên trong tam giác
    canvas.drawPath(path, paint);

    // Vẽ viền cho tam giác
    final borderPaint = Paint()
      ..color = Color(0xff543acc) // Màu viền (có thể thay đổi)
      ..style = PaintingStyle.stroke // Chỉ vẽ viền
      ..strokeWidth = 2; // Độ dày của viền

    // Vẽ lại path của tam giác để tạo viền
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

