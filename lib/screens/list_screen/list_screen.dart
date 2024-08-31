import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../export_port.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  String _dropDownValue = "Selete IPO";

  bool all = true, success = false, pending = false;

  List<String>? titles;
  Future<dynamic> getdata() async {
    var url = "https://fakestoreapi.in/api/products";
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var decode = jsonDecode(response.body)['products'] as List;

      List<String> fetchedTitles = [];

      for (var product in decode) {
        fetchedTitles.add(product["brand"].toString());
      }

      setState(() {
        titles = fetchedTitles;
        log(titles.toString());
      });

      return titles;
    }
  }

  @override
  void initState() {
    getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Container(
          height: 42,
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(width: 1),
              borderRadius: BorderRadius.circular(5)),
          child: DropdownButton(
            padding: const EdgeInsets.only(right: 8, left: 8),
            underline: const SizedBox(),
            hint: Text(_dropDownValue),
            isExpanded: true,
            iconSize: 30,
            style: const TextStyle(
              color: Colors.blue,
            ),
            items: titles?.map(
              (val) {
                return DropdownMenuItem<String>(
                  value: val.toString(),
                  child: Text(val.toString()),
                );
              },
            ).toList(),
            onChanged: (val) {
              setState(
                () {
                  _dropDownValue = val!;
                },
              );
            },
          ),
        ),
        actions: [
          IconButton(
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.grey.shade200),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)))),
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: titles == null
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: () async {
                await Future.delayed(const Duration(seconds: 2));
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
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
                        child: Row(
                          children: [
                            Checkbox(
                              value: all,
                              onChanged: (value) {
                                setState(() {
                                  all = value!;
                                });
                              },
                            ),
                            const Text("All"),
                            Checkbox(
                              value: success,
                              onChanged: (value) {
                                setState(() {
                                  success = value!;
                                });
                              },
                            ),
                            const Text("Success"),
                            Checkbox(
                              value: pending,
                              onChanged: (value) {
                                setState(() {
                                  pending = value!;
                                });
                              },
                            ),
                            const Text("Pending"),
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.65,
                        width: double.infinity,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/image/no_account.png",
                                scale: 3.5,
                              ),
                              const Text('No Bids Found')
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
