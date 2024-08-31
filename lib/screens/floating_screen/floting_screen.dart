import 'package:flutter/material.dart';

import '../../../export_port.dart';

class FlotingButtonScreen extends StatefulWidget {
  const FlotingButtonScreen({super.key});

  @override
  State<FlotingButtonScreen> createState() => _FlotingButtonScreenState();
}

class _FlotingButtonScreenState extends State<FlotingButtonScreen> {
  int accountType = 1, bankdeteils = 0;
  bool bankDetailsVisibile = false, accountNSDLVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Demat Account",
          style: TextStyle(fontSize: 16.0),
        ),
        actions: [
          SizedBox(
            height: 36.0,
            width: 36.0,
            child: SvgPicture.asset("assets/svg_image/youtube.svg"),
          ),
          const SizedBox(width: 8.0),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 12.0, bottom: 48.0, right: 12.0, left: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      style: ButtonStyle(
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        fixedSize: const MaterialStatePropertyAll(
                            Size(double.infinity, 48.0)),
                        backgroundColor:
                            const MaterialStatePropertyAll(Colors.blue),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Center(
                              child: SingleChildScrollView(
                                child: AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  actionsAlignment: MainAxisAlignment.center,
                                  title: const Column(
                                    children: [
                                      Icon(Icons.contact_support_outlined),
                                      SizedBox(height: 28),
                                      Text(
                                        textAlign: TextAlign.center,
                                        "Where to find my Demat Details?",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(height: 12),
                                      Text(
                                        textAlign: TextAlign.center,
                                        "if your Demat account is with NSDL, both the DP ID and client ID will consist of eight charaters"
                                        "each. For instance, if your Demat Number is IN123456 12345678, then the DP ID Would be IN123456"
                                        "and the DP ID Would be IN123456 and the Client ID would be 123456"
                                        "\n"
                                        "To find these details, you can"
                                        "access the profit section of your broker app or contact your broker",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.black54),
                                      ),
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              const MaterialStatePropertyAll(
                                                  Colors.green),
                                          shape: MaterialStatePropertyAll(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                            ),
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                          "ok",
                                          style: TextStyle(color: Colors.white),
                                        ))
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: const Text(
                        "HELP",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextButton(
                      style: ButtonStyle(
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        fixedSize: const MaterialStatePropertyAll(
                            Size(double.infinity, 48)),
                        backgroundColor:
                            const MaterialStatePropertyAll(Colors.red),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "VIDEO HELP",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Text("Selete Account Type"),
              Row(
                children: [
                  Radio(
                    value: 1,
                    groupValue: accountType,
                    onChanged: (value) {
                      setState(() {
                        accountType = value!;
                        accountNSDLVisible = false;
                      });
                    },
                  ),
                  const Text("CDSL"),
                  const SizedBox(width: 12),
                  Radio(
                    value: 0,
                    groupValue: accountType,
                    onChanged: (value) {
                      setState(() {
                        accountType = value!;
                        accountNSDLVisible = true;
                      });
                    },
                  ),
                  const Text("NSDL")
                ],
              ),
              textfieldWidget("Applicant Name"),
              textfieldWidget("PAN Number"),
              Visibility(
                  visible: accountNSDLVisible, child: textfieldWidget("DP Id"),),
              textfieldWidget("Client Id/Beneficiary Number"),
              textfieldWidget("UPI Id(PhonePe, GPay,BHIM etc.)"),
              const Text("Bank Details For Form Print"),
              Row(
                children: [
                  Radio(
                    value: 1,
                    groupValue: bankdeteils,
                    onChanged: (value) {
                      setState(() {
                        bankdeteils = value!;
                        bankDetailsVisibile = true;
                      });
                    },
                  ),
                  const Text("Yes"),
                  const SizedBox(width: 12),
                  Radio(
                    value: 0,
                    groupValue: bankdeteils,
                    onChanged: (value) {
                      setState(() {
                        bankdeteils = value!;
                        bankDetailsVisibile = false;
                      });
                    },
                  ),
                  const Text("No")
                ],
              ),
              Visibility(
                visible: bankDetailsVisibile,
                child: Column(
                  children: [
                    textfieldWidget("Bank Name (For Form Print)"),
                    textfieldWidget("Bank Account Number (For Form Print)"),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              TextButton(
                style: ButtonStyle(
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),),
                  ),
                  fixedSize: MaterialStatePropertyAll(
                      Size(MediaQuery.of(context).size.width, 48.0),),
                  backgroundColor:
                      const MaterialStatePropertyAll(Colors.black87),
                ),
                onPressed: () {},
                child: const Text(
                  "ADD",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showDilogBox() {
    return showAboutDialog(
      context: context,
      applicationName: "loading",
    );
  }
}
