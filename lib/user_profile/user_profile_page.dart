import 'package:flutter/material.dart';

class UserProfilePage extends StatelessWidget {
  final String subscriptionType;
  final String validUntil;
  final String email;
  final void Function()? onIconTap;
  const UserProfilePage({
    super.key,
    required this.email,
    required this.subscriptionType,
    required this.validUntil,
    required this.onIconTap,
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
                Text(
                  email,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
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
                    Text(
                      subscriptionType,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
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
            )
          ],
        ),
      ),
    );
  }
}
