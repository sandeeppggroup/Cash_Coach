import 'package:flutter/material.dart';
import 'package:money_management/screens/dropdown_button/dropdown_button.dart';

class ScreenTransactions extends StatefulWidget {
  const ScreenTransactions({super.key});

  @override
  State<ScreenTransactions> createState() => _ScreenTransactionsState();
}

class _ScreenTransactionsState extends State<ScreenTransactions> {
  @override
  Widget build(BuildContext context) {
    var dropdownValue;
    return Scaffold(
      appBar: AppBar(
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
                  labelText: 'Search...',
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(width: .5, color: Colors.blue),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fillColor: Colors.grey[100],
                  filled: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text(
                      'Select',
                      style: TextStyle(fontSize: 17),
                    ),
                    SizedBox(
                      width: 120,
                      height: 40,
                      child: DropdownButtonWidge(),
                    ),
                  ],
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
