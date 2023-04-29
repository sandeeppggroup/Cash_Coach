import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:money_management/screens/drawer%20pages/about.dart';
import 'package:money_management/screens/drawer%20pages/privacy_policy.dart';
import 'package:money_management/screens/drawer%20pages/terms.dart';
import 'package:money_management/screens/screen_splash/splash_two.dart';
import 'package:money_management/screens/transaction/screen_transactions.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 3, 20, 114),
        title: const Text(
          'Welcome To Cash Coach',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 3, 20, 114),
              ),
              child: Center(
                child: Text(
                  'Cash Coach',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
            ),
            ListTile(
              title: Row(
                children: const [
                  Icon(Icons.person),
                  SizedBox(
                    width: 20,
                  ),
                  Text('About'),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutScreen()),
                );
              },
            ),
            ListTile(
              title: Row(
                children: const [
                  Icon(Icons.restore_page_outlined),
                  SizedBox(
                    width: 20,
                  ),
                  Text('Reset'),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Row(
                children: const [
                  Icon(Icons.share),
                  SizedBox(
                    width: 20,
                  ),
                  Text('Share'),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Row(
                children: const [
                  Icon(Icons.money_outlined),
                  SizedBox(
                    width: 20,
                  ),
                  Text('Terms and conditions'),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TermsConditions()),
                );
              },
            ),
            ListTile(
              title: Row(
                children: const [
                  Icon(Icons.privacy_tip),
                  SizedBox(
                    width: 20,
                  ),
                  Text('Privacy policy'),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PrivacyPolicy()),
                );
              },
            ),
            ListTile(
              title: Row(
                children: const [
                  Icon(Icons.arrow_back),
                  SizedBox(
                    width: 20,
                  ),
                  Text('Back to app'),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              height: 120,
            ),
            const Center(
              child: Text(
                'Version 1.0.1',
                style: TextStyle(fontSize: 13),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 270,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 3, 20, 114),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        'Current balance',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        '₹35000.00',
                        style: TextStyle(color: Colors.white, fontSize: 35),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 70,
                        width: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 4, 78, 207),
                        ),
                        child: Row(
                          children: [
                            Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(6.0),
                                  child: Icon(
                                    Icons.wallet_travel,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Income',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 13),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      '₹50000',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 22),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 70,
                        width: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 4, 78, 207),
                        ),
                        child: Row(
                          children: [
                            Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(6.0),
                                  child: Icon(
                                    Icons.attach_money,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Expenses',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 13),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      '₹50000',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 22),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Recent transactions',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'View all',
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    title: const Text('Shopping'),
                    subtitle: const Text('Buy some grocery'),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          '-5120',
                          style: TextStyle(color: Colors.red),
                        ),
                        Text('26/02/2023')
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
