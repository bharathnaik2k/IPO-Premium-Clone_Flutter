import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          title: const Text("Accounts"),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
            const SizedBox(width: 5),
          ],
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Image.asset(
                      "assets/image/no_account.png",
                      scale: 3,
                    ),
                    const SizedBox(height: 8),
                    const Text("No Accounts Found"),
                    const SizedBox(height: 12),
                    TextButton(
                      style: ButtonStyle(
                        minimumSize: const MaterialStatePropertyAll(
                          Size(double.infinity, 30),
                        ),
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.grey.shade600),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      onPressed: () {
                        // Add To here Function Of demat account linking here
                      },
                      child: const Text(
                        'Add Account',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
