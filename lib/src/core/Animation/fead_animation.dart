


import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';



enum AnimationType { opacity, translateX }

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  const FadeAnimation(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<AnimationType>()
      ..add(AnimationType.opacity, Tween(begin: 0.0, end: 1.0),
        Duration(milliseconds: 500),)
      ..add(
        AnimationType.translateX,
        Tween(begin: 30.0, end: 1.0),
        Duration(milliseconds: 500),
      );

    return PlayAnimation<MultiTweenValues<AnimationType>>(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (context, child, value) => Opacity(
        opacity: value.get(AnimationType.opacity),
        child: Transform.translate(
            offset: Offset(value.get(AnimationType.translateX), 0), child: child),
      ),
    );
  }
}
class FadeAnimationRight extends StatelessWidget {
  final double delay;
  final Widget child;

  const FadeAnimationRight(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<AnimationType>()
      ..add(AnimationType.opacity, Tween(begin: 0.0, end: 1.0),
        Duration(milliseconds: 500),)
      ..add(
        AnimationType.translateX,
        Tween(begin: -30.0, end: 0.0),
        Duration(milliseconds: 500),
      );

    return PlayAnimation<MultiTweenValues<AnimationType>>(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (context, child, value) => Opacity(
        opacity: value.get(AnimationType.opacity),
        child: Transform.translate(
            offset: Offset(value.get(AnimationType.translateX), 0), child: child),
      ),
    );
  }
}

class FadeAnimationtop extends StatelessWidget {
  final double delay;
  final Widget child;

   FadeAnimationtop(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<AnimationType>()
      ..add(AnimationType.opacity, Tween(begin: 0.0, end: 1.0),
        Duration(milliseconds: 500),)
      ..add(
        AnimationType.translateX,
        Tween(begin: 0.0, end: 1.0),
        Duration(milliseconds: 500),
      );

    return PlayAnimation<MultiTweenValues<AnimationType>>(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      curve: Curves.bounceIn,
      builder: (context, child, value) => Opacity(
        opacity: value.get(AnimationType.opacity),
        child: Transform.translate(
            offset: Offset(value.get(AnimationType.translateX), 0), child: child),
      ),
    );
  }
}
/*class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeAnimation(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track("opacity").add(Duration(milliseconds: 500), Tween(begin: 0.0, end: 1.0)),
      Track("translateY").add(
          Duration(milliseconds: 500), Tween(begin: -130.0, end: 0.0),
          curve: Curves.easeOut)
    ]);

    return ControlledAnimation(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builderWithChild: (context, child, animation) => Opacity(
        opacity:animation!["opacity"] ,
        child: Transform.translate(
            offset: Offset(0, animation!["translateY"]),
            child: child
        ),
      ),
    );
  }
}*/

/*class FadeAnimationRight extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeAnimationRight(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track("opacity").add(Duration(milliseconds: 500), Tween(begin: 0.0, end: 1.0)),
      Track("translateX").add(
          Duration(milliseconds: 500), Tween(begin: 120.0, end: 0.0),
          curve: Curves.easeOut)
    ]);

    return ControlledAnimation(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builderWithChild: (context, child, animation) => Opacity(
        opacity: animation["opacity"],
        child: Transform.translate(
            offset: Offset( animation["translateX"],0),//chance driection
            child: child
        ),
      ),
    );
  }
}





class FadeAnimationLeft extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeAnimationLeft(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track("opacity").add(Duration(milliseconds: 500), Tween(begin: 0.0, end: 1.0)),
      Track("translateX").add(
          Duration(milliseconds: 500), Tween(begin: 120.0, end: 0.0),
          curve: Curves.easeOut)
    ]);

    return ControlledAnimation(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builderWithChild: (context, child, animation) => Opacity(
        opacity: animation["opacity"],
        child: Transform.translate(
            offset: Offset(0, animation["translateX"]),//chance driection
            child: child
        ),
      ),
    );
  }
}







class FadeAnimationBootm extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeAnimationBootm(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track("opacity").add(Duration(milliseconds: 500), Tween(begin: 0.0, end: 1.0)),
      Track("translateX").add(
          Duration(milliseconds: 500), Tween(begin: 200.0, end: 0.0),
          curve: Curves.easeOut)
    ]);

    return ControlledAnimation(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builderWithChild: (context, child, animation) => Opacity(
        opacity: animation["opacity"],
        child: Transform.translate(
            offset: Offset(0, animation["translateX"]),
            child: child
        ),
      ),
    );
  }
}*/
