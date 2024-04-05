import 'package:flutter/material.dart';

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
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 31),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'PREMIUM-подписка',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
            const SizedBox(height: 20),
            const Text(
              'Откройте все возможности NULL END и обходите любые ограничения',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
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
    return Container(
      height: isBig ? 97 : 78,
      color: const Color.fromARGB(255, 20, 20, 20),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23),
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
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        subtitle,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 114, 114, 114),
                          fontWeight: FontWeight.w500,
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
                  height: isBig ? 97 : 78,
                  width: 2,
                  color: const Color.fromARGB(255, 114, 114, 114)))
        ],
      ),
    );
  }
}
