import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingPage extends StatelessWidget {
  final void Function()? onBuy;
  final void Function()? onSkip;
  const OnBoardingPage({
    super.key,
    required this.onBuy,
    required this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: BackButton(
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //   ),
      // ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 31),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
              width: MediaQuery.of(context).size.width - 36,
              child: const AutoSizeText(
                'PREMIUM-подписка',
                textAlign: TextAlign.center,
                maxLines: 1,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ),
            const SizedBox(height: 7),
            SizedBox(
              height: 60,
              width: MediaQuery.of(context).size.width - 36,
              child: const AutoSizeText(
                'Откройте все возможности NULL END и обходите любые ограничения',
                textAlign: TextAlign.center,
                maxLines: 3,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(height: 30),
            const OnBoardingInfoBox(
              imagePath: 'assets/icon2.svg',
              subtitle: 'Настраивайте подключение под себя',
              title: 'Адаптивность',
            ),
            const SizedBox(height: 15),
            const OnBoardingInfoBox(
              imagePath: 'assets/icon3.svg',
              subtitle: 'Без постоянных проверок CAPTCHA и блокировок',
              title: 'Защита',
              isBig: true,
            ),
            const SizedBox(height: 15),
            const OnBoardingInfoBox(
              imagePath: 'assets/icon1.svg',
              subtitle: 'Большой выбор стран и регионов',
              title: 'Глобальность',
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: onBuy,
              child: Container(
                height: 45,
                color: Colors.white,
                child: const Center(
                  child: Text(
                    'Приобрести',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: onSkip,
              child: Container(
                height: 45,
                color: const Color.fromARGB(255, 20, 20, 20),
                child: const Center(
                  child: Text(
                    'Пропустить',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 184, 184, 184),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnBoardingInfoBox extends StatelessWidget {
  final bool isBig;
  final String imagePath;
  final String title;
  final String subtitle;
  const OnBoardingInfoBox(
      {super.key,
      this.isBig = false,
      required this.imagePath,
      required this.subtitle,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        color: const Color.fromARGB(255, 20, 20, 20),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 23, vertical: isBig ? 20 : 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    imagePath,
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 25,
                          width: MediaQuery.of(context).size.width / 3,
                          child: AutoSizeText(
                            title,
                            maxLines: 1,
                            style: const TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          width: MediaQuery.of(context).size.width / 1.8,
                          child: AutoSizeText(
                            subtitle,
                            maxLines: 2,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 114, 114, 114),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Container(
                    width: 2, color: const Color.fromARGB(255, 114, 114, 114)))
          ],
        ),
      ),
    );
  }
}
