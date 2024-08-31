import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../export_port.dart';

class ClosedScreen extends StatefulWidget {
  const ClosedScreen({super.key});

  @override
  State<ClosedScreen> createState() => _ClosedScreenState();
}

class _ClosedScreenState extends State<ClosedScreen> {
  Future<void> _refresh() async {
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      data();
    });
  }

  List? apidata;
  Future<dynamic> getdata() async {
    var url = "https://reqres.in/api/users?page=2";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
  }

  data() {
    getdata().then((value) {
      setState(() {
        apidata = value["data"] as List;
      });
    });
  }

  @override
  void initState() {
    data();
    super.initState();
  }

  bool valUE = true, valuE = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: apidata == null
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: RefreshIndicator(
                onRefresh: _refresh,
                child: Column(
                  children: [
                    const SizedBox(height: 8),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.arrow_downward),
                        SizedBox(width: 5),
                        Text("Pull Down To Refresh"),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Container(
                      color: Colors.white,
                      height: MediaQuery.of(context).size.height * 0.68,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: valuE,
                                onChanged: (value) {
                                  setState(() {
                                    valuE = value!;
                                  });
                                },
                              ),
                              const Text(
                                "MainBoard",
                              ),
                              Checkbox(
                                value: valUE,
                                onChanged: (value) {
                                  setState(() {
                                    valUE = value!;
                                  });
                                },
                              ),
                              const Text(
                                "SME",
                              ),
                              const Spacer(),
                              const Text(
                                "Sort",
                              ),
                              IconButton(
                                  style: const ButtonStyle(
                                      padding: MaterialStatePropertyAll(
                                          EdgeInsetsDirectional.zero)),
                                  onPressed: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          width: double.infinity,
                                          decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight:
                                                      Radius.circular(10)),
                                              color: Colors.white),
                                          child: Column(
                                            children: [
                                              DropdownButton(
                                                items: const [],
                                                onChanged: (value) {},
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  icon: const Icon(Icons.list_alt)),
                            ],
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: 3,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.grey,
                                            spreadRadius: 0.1,
                                            blurRadius: 8)
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(14.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            apidata?[index]["first_name"]
                                                    .toString() ??
                                                "",
                                          ),
                                          const SizedBox(height: 6),
                                          const Text(
                                            "12 Aug - 14 Aug",
                                          ),
                                          const Divider(),
                                          Row(
                                            children: [
                                              SizedBox(
                                                height: 90,
                                                width: 90,
                                                child: apidata == null
                                                    ? const SizedBox()
                                                    : Image.network(
                                                        apidata?[index]
                                                                    ["avatar"]
                                                                .toString() ??
                                                            ""),
                                              ),
                                              const SizedBox(width: 8),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text("Price : 55 - 59",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500)),
                                                  const SizedBox(height: 5),
                                                  Row(
                                                    children: [
                                                      const Text("Premium : ",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500)),
                                                      BlinkText(
                                                        beginColor:
                                                            Colors.green,
                                                        apidata?[index]["id"]
                                                                .toString() ??
                                                            "",
                                                        style: const TextStyle(
                                                            color: Colors.green,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                      )
                                                    ],
                                                  ),
                                                  const SizedBox(height: 5),
                                                  const Text("Lot : 195",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500))
                                                ],
                                              )
                                            ],
                                          ),
                                          const Divider(),
                                          const Row(
                                            children: [
                                              Text("Allotment Date :"),
                                              Spacer(),
                                              Text("Aug 15")
                                            ],
                                          ),
                                          const SizedBox(height: 4),
                                          const Row(
                                            children: [
                                              Text("Listing Date :"),
                                              Spacer(),
                                              Text("Aug 18")
                                            ],
                                          ),
                                          const SizedBox(height: 4),
                                          const Row(
                                            children: [
                                              Text("Est. Profit :"),
                                              Spacer(),
                                              Text("2047")
                                            ],
                                          ),
                                          const Divider(),
                                          const SizedBox(height: 4),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Expanded(
                                                child: TextButton(
                                                    style: ButtonStyle(
                                                        shape: MaterialStatePropertyAll(
                                                            RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5))),
                                                        side:
                                                            const MaterialStatePropertyAll(
                                                                BorderSide(
                                                                    width: 1))),
                                                    onPressed: () {},
                                                    child: const Text("VIEW")),
                                              ),
                                              const SizedBox(width: 5),
                                              Expanded(
                                                child: TextButton(
                                                    style: ButtonStyle(
                                                        shape: MaterialStatePropertyAll(
                                                            RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadiusDirectional
                                                                        .circular(
                                                                            5))),
                                                        backgroundColor:
                                                            const MaterialStatePropertyAll(
                                                                Colors.black)),
                                                    onPressed: () {},
                                                    child: const Text(
                                                      "APPLY",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    )),
                                              )
                                            ],
                                          ),
                                          const SizedBox(height: 4),
                                          const Text(
                                            "*Estimeted Profit if listed current GMP rumors",
                                            style: TextStyle(fontSize: 10),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }

  TextStyle textstyle(
      [double fontsize = 14,
      FontWeight fontweight = FontWeight.normal,
      Color colors = Colors.black]) {
    return TextStyle(fontSize: fontsize, fontWeight: fontweight, color: colors);
  }
}
