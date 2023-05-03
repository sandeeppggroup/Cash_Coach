import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:money_management/db_functions/category/category_db.dart';
import 'package:money_management/models/category/category_model.dart';

class AddTransaction extends StatelessWidget {
  const AddTransaction({super.key});
  // final newValue = CategoryType.income;

  @override
  Widget build(BuildContext context) {
    final _amountController = TextEditingController();

    final _categoryController = TextEditingController();

    final _discriptionController = TextEditingController();

    final _dateController = TextEditingController();

    DateTime _selectedDate;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 4, 78, 207),
        centerTitle: true,
        title: const Text(
          'Add Transaction',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 35,
            ),
            const Text(
              'Amount',
              style: TextStyle(fontSize: 25),
            ),
            const SizedBox(
              height: 3,
            ),
            // Textformfield for amount *******************************************  1
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Amount',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              ),
              controller: _amountController,
              keyboardType: TextInputType.number,
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
            const SizedBox(
              height: 15,
            ),
            // Textformfield for Discription *******************************************   2
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Discription',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              ),
              controller: _discriptionController,
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
            const SizedBox(
              height: 15,
            ),
            // Textformfield for Date picker *******************************************  3
            TextFormField(
              onTap: () {},
              decoration: InputDecoration(
                labelText: 'Pick your date',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              ),
              controller: _dateController,
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
            const SizedBox(
              height: 30,
            ),

            // Radiobutton and elevatedButtons *******************************************
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Radio(
                  value: CategoryType.income,
                  groupValue: CategoryType.income,
                  onChanged: (newValue) {
                    newValue = CategoryType.income;
                  },
                ),
                SizedBox(
                  height: 30,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text('Income'),
                  ),
                ),
                SizedBox(
                  height: 30,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text('Expense'),
                  ),
                ),
                Radio(
                  value: CategoryType.expense,
                  groupValue: CategoryType.expense,
                  onChanged: (newValue) {
                    newValue = CategoryType.expense;
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            // Dropdown button *******************************************
            Center(
              child: DropdownButton(
                hint: const Text('Select Category'),
                // value: ,
                items: CategoryDB.instance.expenseCategoryListListener.value
                    .map((e) {
                  return DropdownMenuItem(
                    value: e.id,
                    child: Text(e.name),
                  );
                }).toList(),
                onChanged: (selectedValue) {
                  print('selected value');
                },
              ),
            ),
            // Textformfield for category *******************************************   4
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Category',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              ),
              controller: _categoryController,
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
            const SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                  width: 340,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 4, 78, 207),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Submit',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
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

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picker = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(Duration(days: 60)),
      lastDate: DateTime.now(),
    );
  }
}
