import 'package:flutter/material.dart';
import 'package:money_management/screens/dropdown_button/dropdown_button.dart';
import 'package:money_management/screens/home/screen_home.dart';
import 'package:money_management/screens/home/screen_main.dart';

import '../../db_functions/category/category_db.dart';

class ScreenTransactions extends StatefulWidget {
  const ScreenTransactions({super.key});

  @override
  State<ScreenTransactions> createState() => _ScreenTransactionsState();
}

class _ScreenTransactionsState extends State<ScreenTransactions>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    CategoryDB().refreshUI();
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var dropdownValue;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => ScreenMain()));
            },
            icon: Icon(
              Icons.arrow_back,
              size: 30,
            )),
        backgroundColor: const Color.fromARGB(255, 4, 78, 207),
        centerTitle: true,
        title: const Text(
          'Transactions',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 12.0, right: 8, left: 8),
        child: Column(
          children: [
            SizedBox(
              height: 40,
              child: TextFormField(
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.search),
                  labelText: 'Search....',
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(width: .5, color: Colors.blue),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fillColor: Colors.grey[100],
                  filled: true,
                ),
              ),
            ),
            Container(
              child: Card(
                child: TabBar(
                  indicator: BoxDecoration(
                    color: const Color.fromARGB(255, 4, 78, 207),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  labelColor: Colors.white,
                  labelStyle: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w700),
                  unselectedLabelColor: const Color.fromARGB(255, 4, 78, 207),
                  controller: _tabController,
                  tabs: const [
                    Tab(
                      text: 'Overview',
                    ),
                    Tab(
                      text: 'Income',
                    ),
                    Tab(
                      text: 'Expense',
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Sort',
                        style: TextStyle(fontSize: 17),
                      ),
                      SizedBox(
                        width: 120,
                        height: 35,
                        child: DropdownButtonWidge(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      title: const Text('Shopping'),
                      subtitle: const Text('Buy some grocery'),
                      trailing: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text(
                            '-5120',
                            style: TextStyle(color: Colors.red),
                          ),
                          Text('data')
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
