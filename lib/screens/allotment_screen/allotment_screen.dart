import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../export_port.dart';

class AllotmentScreen extends StatefulWidget {
  const AllotmentScreen({super.key});

  @override
  State<AllotmentScreen> createState() => _AllotmentScreenState();
}

class _AllotmentScreenState extends State<AllotmentScreen> {
  List? daa;
  Future<dynamic> getdataa() async {
    var url = "https://fakestoreapi.in/api/products";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var daaa = jsonDecode(response.body)["products"] as List;
      List<String> fetchedTitles = [];
      for (var paa in daaa) {
        fetchedTitles.add(paa["brand"].toString());
      }
      setState(() {
        daa = fetchedTitles;
      });
      return daa;
    }
  }

  @override
  void initState() {
    getdataa();

    super.initState();
  }

  String _dropDownValue = "Selete IPO";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text("Allotment"),
        actions: [
          IconButton(
            style: const ButtonStyle(
              fixedSize: MaterialStatePropertyAll(
                Size(50, 50),
              ),
            ),
            onPressed: () {},
            icon: SvgPicture.asset("assets/svg_image/youtube.svg"),
          ),
          const SizedBox(width: 5),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: DropdownButton(
                    icon: daa == null
                        ? Container(
                            padding: const EdgeInsets.only(
                                top: 16, right: 8, bottom: 16, left: 24),
                            height: 45,
                            width: 45,
                            child: const CircularProgressIndicator(),
                          )
                        : const Icon(Icons.arrow_downward),
                    padding: const EdgeInsets.only(right: 8, left: 8),
                    isExpanded: true,
                    underline: const SizedBox(),
                    hint: Text(_dropDownValue),
                    items: daa?.map((e) {
                      return DropdownMenuItem<String>(
                        value: e,
                        child: Text(e),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        _dropDownValue = val!;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    "assets/svg_image/youtube.svg",
                    width: 60,
                    height: 60,
                  ),
                ),
                const Text("Tap here for video help!"),
                const SizedBox(height: 40),
                const Text(
                  "if you experiance any difficulties checking alloment"
                  "status here due to occasional have load on the registor server,"
                  " you can directly verify it on the registor website.",
                  style: TextStyle(color: Colors.red),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
