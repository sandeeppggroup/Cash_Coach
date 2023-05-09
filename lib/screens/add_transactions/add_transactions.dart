import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:money_management/db_functions/category/category_db.dart';
import 'package:money_management/db_functions/transactions/transaction_db.dart';
import 'package:money_management/models/category/category_model.dart';
import 'package:money_management/models/transaction/transaction_model.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final _amountController = TextEditingController();

  final _categoryController = TextEditingController();

  final _discriptionController = TextEditingController();

  final _dateController = TextEditingController();

  DateTime? _selectedDate;

  CategoryType? _selectedCategoryType;

  CategoryModel? _selectedCategoryModel;

  String? _categoryID;

  final _formKey = GlobalKey<FormState>();

  String? _inputValue;

  @override
  void initState() {
    _selectedCategoryType = CategoryType.income;
    super.initState();
  }

  // final newValue = CategoryType.income;
  @override
  Widget build(BuildContext context) {
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
        child: Form(
          key: _formKey,
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
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
                controller: _amountController,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  _inputValue == value;
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
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
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
              // if (_selectedDate == null)
              TextFormField(
                onTap: () {},
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      selectDate(context);
                    },
                    icon: Icon(Icons.calendar_today),
                  ),
                  labelText: 'Pick your date',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
                readOnly: true,
                controller: _dateController,
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  print('Name changed to $value');
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please select a date';
                  }
                  return null;
                },
                textInputAction: TextInputAction.done,
              ),
              // else

              const SizedBox(
                height: 30,
              ),

              // Radiobutton and elevatedButtons *******************************************
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Radio(
                    value: CategoryType.income,
                    groupValue: _selectedCategoryType,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedCategoryType = CategoryType.income;
                        _categoryID = null;
                      });
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
                    groupValue: _selectedCategoryType,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedCategoryType = CategoryType.expense;
                        _categoryID = null;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),

              // Textformfield for category *******************************************   4

              DropdownButtonFormField<String>(
                borderRadius: BorderRadius.circular(20),
                value: _categoryID,
                items: (_selectedCategoryType == CategoryType.income
                        ? CategoryDB().incomeCategoryListListener
                        : CategoryDB().expenseCategoryListListener)
                    .value
                    .map((e) {
                  return DropdownMenuItem(
                    value: e.id,
                    child: Text(e.name),
                    onTap: () {
                      _selectedCategoryModel = e;
                    },
                  );
                }).toList(),
                onChanged: (selectedValue) {
                  setState(() {
                    _categoryID = selectedValue;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a category option';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: 'Select Category',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),

              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                    width: 340,
                    child: ElevatedButton(
                      onPressed: () {
                        addTransaction();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 4, 78, 207),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Submit',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(Duration(days: 60)),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = DateFormat('dd-MMM-yyyy').format(_selectedDate!);
      });
    }
  }

  Future<void> addTransaction() async {
    final _amountText = _amountController.text;
    final _discriptionText = _discriptionController.text;
    // if (_amountText.isEmpty) {
    //   return;
    // }
    // if (_discriptionText.isEmpty) {
    //   return;
    // }
    // if (_categoryID == null) {
    //   return;
    // }
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      final _amount = _amountController.text;
      if (_amount.isEmpty) {
        return;
      }
    }
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      final _discription = _discriptionController.text;
      if (_discription.isEmpty) {
        return;
      }
    }
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      final _date = _dateController.text;
      if (_date.isEmpty) {
        return;
      }
    }
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();

      if (_selectedCategoryType == null) {
        return;
      }
    }

    // _selectedDate;
    // _selectedCategoryType;
    // _categoryID;

    final _parsedAmount = double.tryParse(_amountText);
    if (_parsedAmount == null) {
      return;
    }

    final _model = TransactionModel(
      amount: _parsedAmount,
      discription: _discriptionText,
      date: _selectedDate!,
      type: _selectedCategoryType!,
      category: _selectedCategoryModel!,
    );
    TransactionDB.instance.addTransaction(_model);
  }
}
