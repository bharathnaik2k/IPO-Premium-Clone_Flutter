import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../export_port.dart';

class IpoScreen extends StatefulWidget {
  const IpoScreen({super.key});

  @override
  State<IpoScreen> createState() => _IpoScreenState();
}

List<StatefulWidget> homescreen = [
  const OpenScreen(),
  const UpcomingScreen(),
  const ClosedScreen()
];

int seletindex = 0;

final _cont = PageController();

class _IpoScreenState extends State<IpoScreen> {
  void onChanged(var index) {
    setState(() {
      seletindex = index;
    });
  }

  void onitemchange(var i) {
    _cont.jumpToPage(i);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Live Subcripstion",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
        ),
        actions: [
          appbarIcons(CupertinoIcons.search, () {}),
          appbarIcons(CupertinoIcons.calendar, () {}),
          appbarIcons(CupertinoIcons.bell, () {
            Navigator.of(context).pushNamed("/NotificationScreen");
          }),
          appbarIcons(CupertinoIcons.settings, () {
            Navigator.of(context).pushNamed("/SettingScreen");
          })
        ],
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 25),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8, left: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(6),
                      onTap: () {
                        onitemchange(0);
                      },
                      child: SizedBox(
                        height: 30,
                        width: MediaQuery.of(context).size.width * 0.31,
                        child: const Center(
                          child: Text(
                            "  OPEN  ",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.green),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(6),
                      onTap: () {
                        onitemchange(1);
                      },
                      child: SizedBox(
                        height: 30,
                        width: MediaQuery.of(context).size.width * 0.31,
                        child: const Center(
                          child: Text(
                            "UPCOMING",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.orange,
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(6),
                      onTap: () {
                        onitemchange(2);
                      },
                      child: SizedBox(
                        height: 30,
                        width: MediaQuery.of(context).size.width * 0.31,
                        child: const Center(
                          child: Text(
                            " CLOSED ",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SmoothPageIndicator(
                axisDirection: Axis.horizontal,
                controller: _cont,
                count: homescreen.length,
                effect: ExpandingDotsEffect(
                  spacing: MediaQuery.of(context).size.width * 0.3,
                  dotWidth: 9,
                  dotHeight: 4,
                  // offset: MediaQuery.of(context).size.width * 2,
                  dotColor: Colors.transparent,
                  expansionFactor: 2.5,
                  activeDotColor: Colors.black,
                  radius: 30,
                ),
              )
            ],
          ),
        ),
      ),
      body: PageView(
        onPageChanged: onChanged,
        controller: _cont,
        children: homescreen,
      ),
    );
  }

  Padding appbarIcons(var icon, var onpressed) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey.shade300,
        ),
        child: IconButton(
          style: ButtonStyle(
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
          onPressed: onpressed,
          icon: Icon(icon, size: 18),
          splashRadius: 100,
        ),
      ),
    );
  }
}
