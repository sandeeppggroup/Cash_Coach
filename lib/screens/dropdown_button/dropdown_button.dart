import 'package:flutter/material.dart';

class DropdownButtonWidge extends StatefulWidget {
  const DropdownButtonWidge({Key? key}) : super(key: key);
  @override
  State<DropdownButtonWidge> createState() => _DropdownButtonWidgeState();
}

class _DropdownButtonWidgeState extends State<DropdownButtonWidge> {
  String dropdownValue = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        // decoration: BoxDecoration(
        //   border: Border.all(
        //     color: Colors.black,
        //     width: 2.0,
        //   ),
        //   borderRadius: BorderRadius.circular(30.0),
        // ),
        child: DropdownButton<String>(
          elevation: 0,
          borderRadius: BorderRadius.circular(20),
          style: const TextStyle(
            color: Colors.black,
          ),
          // Step 3.
          value: dropdownValue,
          // Step 4.
          items: <String>['', 'Income', 'Expense', 'All']
              .map<DropdownMenuItem<String>>(
            (String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    value,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              );
            },
          ).toList(),
          // Step 5.
          onChanged: (String? newValue) {
            setState(
              () {
                dropdownValue = newValue!;
              },
            );
          },
        ),
      ),
    );
  }
}
