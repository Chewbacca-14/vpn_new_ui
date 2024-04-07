import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UserProfilePage extends StatelessWidget {
  final String subscriptionType;
  final String validUntil;
  final String email;
  final void Function()? onLogoutTap;
  final void Function()? onIconTap;
  const UserProfilePage({
    super.key,
    required this.email,
    required this.subscriptionType,
    required this.validUntil,
    required this.onIconTap,
    required this.onLogoutTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Профиль',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 33),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 114, 114, 114),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 60,
                  child: AutoSizeText(
                    email,
                    maxLines: 1,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 33),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Статус подписки',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 114, 114, 114),
                      ),
                    ),
                    SizedBox(
                      height: 35,
                      width: MediaQuery.of(context).size.width - 100,
                      child: AutoSizeText(
                        subscriptionType,
                        maxLines: 2,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                    Text(
                      'до $validUntil',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 114, 114, 114),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: onIconTap,
                  child: const Icon(
                    Icons.ios_share_outlined,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            const Spacer(),
            GestureDetector(
              onTap: onLogoutTap,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: Colors.white,
                    width: 1,
                  ),
                ),
                child: Center(
                  child: Text(
                    'Выйти из аккаунта',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
