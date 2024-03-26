import 'package:flutter/material.dart';

class SubscriptionNotification extends StatelessWidget {
  final AnimationController animationController;
  final Animatable<Offset> animation;
  final Widget icon;
  const SubscriptionNotification(
      {super.key,
      required this.animationController,
      required this.animation,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animationController.drive(animation),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          height: 98,
          color: Colors.white.withOpacity(0.1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 98,
                width: 2,
                color: const Color.fromARGB(255, 73, 225, 18),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ВОЗМОЖНОСТИ ОГРАНИЧЕНЫ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 10),
                          SizedBox(
                            width: 300,
                            child: Text(
                              'Подключите Премиум-подписку, чтобы получить полный доступ к функциям',
                              maxLines: 2,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      icon
                    ],
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
