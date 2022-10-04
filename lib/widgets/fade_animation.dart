import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeAnimation extends StatelessWidget {
  final double? delay;
  final Widget? child;
  final Curve? curve;

  const FadeAnimation({
    Key? key,
    required this.child,
    this.delay,
    this.curve,
  }) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    // final tween = MultiTrackTween([
    //   Track("opacity").add(Duration(milliseconds: 500), Tween(begin: 0.0, end: 1.0)),
    //   Track("translateY").add(
    //       Duration(milliseconds: 500), Tween(begin: -30.0, end: 0.0),
    //       curve: Curves.easeOut)
    // ]);

    final tween = MultiTween()
      ..add(Prop.opacity, Tween(begin: 0.0, end: 1.0),
          Duration(milliseconds: 500))
      ..add(Prop.translateY, Tween(begin: -30.0, end: 0.0),
          Duration(milliseconds: 500), curve!);

    return CustomAnimation<MultiTweenValues<dynamic>>(
      delay: Duration(milliseconds: (500 * delay!).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (context, child, animation) => Opacity(
        opacity: animation.get(Prop.opacity),
        child: Transform.translate(
            offset: Offset(0, animation.get(Prop.translateY)), child: child),
      ),
    );
  }
}
