import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../export_port.dart';

class UpcomingScreen extends StatefulWidget {
  const UpcomingScreen({super.key});

  @override
  State<UpcomingScreen> createState() => _UpcomingScreenState();
}

class _UpcomingScreenState extends State<UpcomingScreen> {
  Future<void> _refresh() async {
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      get();
    });
  }

  var data;

  Future<dynamic> getdata() async {
    var url = "https://fakestoreapi.in/api/products";
    var response = await http.get(Uri.parse(url));
    var decode = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return decode["products"];
    }
  }

  get() {
    getdata().then((value) {
      setState(() {
        data = value;
      });
    });
  }

  @override
  void initState() {
    get();
    super.initState();
  }

  bool valUE = true, valuE = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: data == null
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
                              itemCount: data?.length,
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
                                            data?[index]["title"].toString() ??
                                                "",
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w800),
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
                                                  child: Image.network(
                                                      data?[index]["image"])),
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
                                                        "${data?[index]["price"].toString() ?? ""} (${data?[index]["discount"].toString() ?? ""}%)",
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
}
