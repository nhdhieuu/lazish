import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StepProgress extends StatefulWidget {
  final double currentStep;
  final double steps;

  StepProgress({Key? key, required this.currentStep, required this.steps})
      : super(key: key);

  @override
  _StepProgressState createState() => _StepProgressState();
}

class _StepProgressState extends State<StepProgress> {
  double widthProgress = 0;

  @override
  void initState() {
    _onSizeWidget();
    super.initState();
  }

  void _onSizeWidget() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStap) {
      if (context.size is Size) {
        Size size = context.size!;
        widthProgress = size.width / (widget.steps - 1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   children: [
        //     Text(
        //         '${(widget.currentStep + 1).toInt()} / ${widget.steps.toInt()}'),
        //   ],
        // ),
        Container(
          height: 15,
          width: double.infinity,
          margin: EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 215, 215, 215),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: Stack(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                width: widthProgress * widget.currentStep,
                decoration: BoxDecoration(
                    color: const Color(0xff6949ff).withOpacity(0.8),
                    borderRadius: BorderRadius.all(Radius.circular(8))),
              )
            ],
          ),
        )
      ],
    );
  }
}
