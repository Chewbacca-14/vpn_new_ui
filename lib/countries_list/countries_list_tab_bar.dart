import 'package:flutter/material.dart';

class CountryListTabBar extends StatefulWidget {
  final TabController tabController;
  final Widget dedicatedIpCountryList;
  final Widget staticIpCountryList;
  final Widget multihopContryList;
  final Widget dynamicIpContryList;
  const CountryListTabBar({
    super.key,
    required this.tabController,
    required this.dedicatedIpCountryList,
    required this.dynamicIpContryList,
    required this.multihopContryList,
    required this.staticIpCountryList,
  });

  @override
  State<CountryListTabBar> createState() => _CountryListTabBarState();
}

class _CountryListTabBarState extends State<CountryListTabBar>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          tabAlignment: TabAlignment.start,
          padding: const EdgeInsets.only(right: 11, left: 11),
          labelPadding: const EdgeInsets.symmetric(horizontal: 1),
          onTap: (value) {
            widget.tabController.animateTo(value);
            setState(() {});
          },
          isScrollable: true,
          dividerColor: Colors.transparent,
          indicatorColor: Colors.transparent,
          labelColor: Colors.white,
          controller: widget.tabController,
          tabs: [
            Container(
              height: 31,
              color: widget.tabController.index == 0
                  ? const Color.fromARGB(255, 49, 49, 49)
                  : const Color.fromARGB(255, 14, 14, 14),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Center(
                  child: Text(
                    'Выделенный IP',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
            ),
            Container(
              height: 31,
              color: widget.tabController.index == 1
                  ? const Color.fromARGB(255, 49, 49, 49)
                  : const Color.fromARGB(255, 14, 14, 14),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Center(
                  child: Text(
                    'Статический IP-адрес',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
            ),
            Container(
              height: 31,
              color: widget.tabController.index == 2
                  ? const Color.fromARGB(255, 49, 49, 49)
                  : const Color.fromARGB(255, 14, 14, 14),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Center(
                  child: Text(
                    'MultiHop',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
            ),
            Container(
              height: 31,
              color: widget.tabController.index == 3
                  ? const Color.fromARGB(255, 49, 49, 49)
                  : const Color.fromARGB(255, 14, 14, 14),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Center(
                  child: Text(
                    'Динамический IP-адрес',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: widget.tabController,
            children: [
              Column(
                children: [
                  const SizedBox(height: 10),
                  const Text(
                    'IP-адрес, принадлежащий только вам',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 5),
                  widget.dedicatedIpCountryList,
                ],
              ),
              Column(
                children: [
                  const SizedBox(height: 10),
                  const Text(
                    'IP-адрес сохраняется в рамках одной сессии',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 5),
                  widget.staticIpCountryList,
                ],
              ),
              Column(
                children: [
                  const SizedBox(height: 10),
                  const Text(
                    'Усиленная защита за счет двойной смены IP-адреса',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 5),
                  widget.multihopContryList,
                ],
              ),
              Column(
                children: [
                  const SizedBox(height: 10),
                  const Text(
                    'Устройство будет периодически менять IP\nв зависимости от состояния сети',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 5),
                  widget.dynamicIpContryList,
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
