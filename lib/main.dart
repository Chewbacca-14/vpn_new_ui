import 'package:flutter/material.dart';
import 'package:vpn_new_ui/subscription_notification/subscription_notification.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  Animatable<Offset> tween =
      Tween<Offset>(begin: const Offset(2, 0), end: Offset.zero)
          .chain(CurveTween(curve: Curves.ease));
  AnimationController? animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  void showBanner() {
    animationController!.forward();
  }

  void hideBanner() {
    animationController!.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const SizedBox(height: 200),
          ElevatedButton(
            onPressed: showBanner,
            child: const Text(
              'show',
            ),
          ),
          ElevatedButton(
            onPressed: hideBanner,
            child: const Text(
              'hide',
            ),
          ),
          Center(
              child: SubscriptionNotification(
            animationController: animationController!,
            animation: tween,
            icon: const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.grey,
              size: 18,
            ),
          )),
        ],
      ),
    );
  }
}
