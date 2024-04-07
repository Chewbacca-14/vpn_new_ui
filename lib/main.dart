import 'package:flutter/material.dart';

import 'package:vpn_new_ui/countries_list/countries_list_tab_bar.dart';
import 'package:vpn_new_ui/onboarding/onboarding_page.dart';
import 'package:vpn_new_ui/subscription_notification/subscription_notification.dart';
import 'package:vpn_new_ui/user_profile/user_profile_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: StartNavigationPage());
  }
}

class StartNavigationPage extends StatelessWidget {
  const StartNavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
            },
            child: const Text(
              'Баннер',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CountryListTabBarTest()));
            },
            child: const Text(
              'Табы',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      OnBoardingPage(onBuy: () {}, onSkip: () {}),
                ),
              );
            },
            child: const Text(
              'Онбординг',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserProfilePage(
                    email: 'email@mail.com',
                    validUntil: '31.08.2023',
                    subscriptionType: 'Premium + Выделенный IP',
                    onIconTap: () {},
                    onLogoutTap: () {},
                  ),
                ),
              );
            },
            child: const Text(
              'Профиль',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          )
        ],
      )),
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
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
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

class CountryListTabBarTest extends StatefulWidget {
  const CountryListTabBarTest({super.key});

  @override
  State<CountryListTabBarTest> createState() => _CountryListTabBarTestState();
}

class _CountryListTabBarTestState extends State<CountryListTabBarTest>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

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
        padding: const EdgeInsets.only(top: 70),
        child: CountryListTabBar(
          tabController: _tabController!,
          dedicatedIpCountryList: const SizedBox(),
          dynamicIpContryList: const SizedBox(),
          multihopContryList: const SizedBox(),
          staticIpCountryList: const SizedBox(),
        ),
      ),
    );
  }
}
