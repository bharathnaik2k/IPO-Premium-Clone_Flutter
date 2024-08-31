import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../export_port.dart';

class OpenScreen extends StatefulWidget {
  const OpenScreen({
    super.key,
  });

  @override
  State<OpenScreen> createState() => _OpenScreenState();
}

class _OpenScreenState extends State<OpenScreen> {
  Future<void> _refresh() async {
    setState(() {
      getdata();
    });
  }

  var apidata;
  var reverse;

  reversData() {
    Iterable inReverse = apidata.reversed;
    var fruitsInReverse = inReverse.toList();
    setState(() {
      reverse = fruitsInReverse;
      
    });
  }

  Future<Map<String, dynamic>?> listdat() async {
    var url = "https://reqres.in/api/users?page=2";
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print("Failed to load data: ${response.statusCode}");
      return null;
    }
  }

  getdata() {
    listdat().then((value) {
      setState(() {
        apidata = value?['data'];
      });
      reversData();
    }).catchError((error) {
      throw Exception("Error fetching data: $error");
    });
  }

  @override
  void initState() {
    getdata();
    super.initState();
  }

  bool valuE = true, valUE = true;
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
                              itemCount: apidata?.length,
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
                                            "${apidata?[index]["first_name"] ?? ""} ${apidata?[index]["last_name"] ?? ""}",
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
                                                              ["avatar"],
                                                        )),
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
                                                        duration:
                                                            const Duration(
                                                                seconds: 2),
                                                        beginColor:
                                                            Colors.green,
                                                        "${apidata?[index]["id"].toString() ?? ""} (${reverse[index]["id"].toString()}%)",
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
