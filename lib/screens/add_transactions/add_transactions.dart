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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 4, 78, 207),
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
            SizedBox(
              height: 15,
            ),
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
            SizedBox(
              height: 15,
            ),
            TextFormField(
              onTap: () {
                Future<DateTime?> v = showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now().subtract(Duration(days: 60)),
                  lastDate: DateTime.now(),
                );
              },
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
            SizedBox(
              height: 30,
            ),
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
                Radio(
                  value: CategoryType.expense,
                  groupValue: CategoryType.expense,
                  onChanged: (newValue) {
                    newValue = CategoryType.expense;
                  },
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: DropdownButton(
                hint: Text('Select Category'),
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
            SizedBox(
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
                    child: Text(
                      'Submit',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 4, 78, 207),
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
