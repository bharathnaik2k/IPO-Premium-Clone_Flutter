import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'export_port.dart';

class BottomNaviBar extends StatefulWidget {
  const BottomNaviBar({super.key});

  @override
  State<BottomNaviBar> createState() => _BottomNaviBarState();
}

List<StatefulWidget> homescreenn = [
  const IpoScreen(),
  const AccountScreen(),
  const ListScreen(),
  const AllotmentScreen(),
];

int seletindexx = 0;

final _contt = PageController();

class _BottomNaviBarState extends State<BottomNaviBar> {
  void onChanged(var index) {
    setState(() {
      seletindexx = index;
    });
  }

  void onitemchange(var i) {
    _contt.jumpToPage(i);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: onChanged,
        controller: _contt,
        children: homescreenn,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/FlotingScreen");
        },
        backgroundColor: Colors.grey.shade800,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 28,
        ),
      ),
      backgroundColor: Colors.transparent,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        color: Colors.white,
        height: 68,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            bottomNaviItem(Icons.home, "IPO", () {
              onitemchange(0);
            }),
            bottomNaviItem(Icons.supervisor_account, "Account", () {
              onitemchange(1);
            }),
            const SizedBox(width: 18),
            bottomNaviItem(CupertinoIcons.doc_text_fill, "List", () {
              onitemchange(2);
            }),
            bottomNaviItem(FontAwesomeIcons.bullhorn, "Allotment", () {
              onitemchange(3);
            }),
          ],
        ),
      ),
    );
  }

  Widget bottomNaviItem(var icon, var label, var onpressed) {
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(6),
        onTap: onpressed,
        child: SizedBox(
          height: 62,
          width: MediaQuery.of(context).size.width * 0.23,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.black87,
              ),
              Text(
                label,
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87),
              )
            ],
          ),
        ),
      ),
    );
  }
}
