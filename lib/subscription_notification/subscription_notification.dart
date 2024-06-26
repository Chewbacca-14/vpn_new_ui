import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
        child: IntrinsicHeight(
          child: Container(
            color: Colors.white.withOpacity(0.1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 2,
                  color: const Color.fromARGB(255, 73, 225, 18),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 15),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 33,
                              width: MediaQuery.of(context).size.width - 86,
                              child: const AutoSizeText(
                                'ВОЗМОЖНОСТИ ОГРАНИЧЕНЫ',
                                maxLines: 2,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              width: MediaQuery.of(context).size.width - 86,
                              child: const AutoSizeText(
                                'Подключите Премиум-подписку, чтобы получить полный доступ к функциям',
                                maxLines: 3,
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
      ),
    );
  }
}
