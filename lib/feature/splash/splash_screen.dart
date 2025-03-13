import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends HookWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
      duration: Duration(milliseconds: 3000),
    );
    void animationListener() {
      if (animationController.isCompleted) {
        context.replace('/main');
      }
    }

    useEffect(() {
      animationController.addListener(animationListener);
      animationController.forward();

      return () => animationController.removeListener(animationListener);
    }, [animationController],);

    return Center(
      child: Lottie.asset(
        'assets/json/splash_animation.json',
        controller: animationController,
      ),
    );
  }
}
