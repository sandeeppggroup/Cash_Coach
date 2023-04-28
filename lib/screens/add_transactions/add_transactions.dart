import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AddTransaction extends StatelessWidget {
  const AddTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    final _amountController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Add Transaction',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 35,
            ),
            Text(
              'Amount',
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              height: 3,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Amount',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              ),
              controller: _amountController,
              keyboardType: TextInputType.text,
              onChanged: (value) {
                print('Name changed to $value');
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter amount';
                }
                return null;
              },
              textInputAction: TextInputAction.done,
            ),
            SizedBox(
              height: 70,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Category',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              ),
              controller: _amountController,
              keyboardType: TextInputType.text,
              onChanged: (value) {
                print('Name changed to $value');
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Select category';
                }
                return null;
              },
              textInputAction: TextInputAction.done,
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Discription',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              ),
              controller: _amountController,
              keyboardType: TextInputType.text,
              onChanged: (value) {
                print('changed to $value');
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your discription';
                }
                return null;
              },
              textInputAction: TextInputAction.done,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 30,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Income'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Expense'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Pick your date',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              ),
              controller: _amountController,
              keyboardType: TextInputType.text,
              onChanged: (value) {
                print('Name changed to $value');
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please select date';
                }
                return null;
              },
              textInputAction: TextInputAction.done,
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                  width: 340,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Continue'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
