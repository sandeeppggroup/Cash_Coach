import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:money_management/db_functions/category/category_db.dart';
import 'package:money_management/db_functions/transactions/transaction_db.dart';
import 'package:money_management/models/category/category_model.dart';
import 'package:money_management/models/transaction/transaction_model.dart';

class EditTransaction extends StatefulWidget {
  const EditTransaction({
    super.key,
    required this.model,
  });
  final TransactionModel model;

  @override
  State<EditTransaction> createState() => _EditTransactionState();
}

class _EditTransactionState extends State<EditTransaction> {
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
    _discriptionController.text = widget.model.discription;
    _amountController.text = widget.model.amount.toString();
    _selectedDate = widget.model.date;
    _selectedCategoryType = widget.model.type;
    _selectedCategoryModel = widget.model.category;
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
                // inputFormatters: <TextInputFormatter>[
                //   FilteringTextInputFormatter.digitsOnly,
                // ],
                onChanged: (value) {
                  _inputValue == value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter amount';
                  }
                  // Ensure input contains only digits and at most one decimal point
                  final RegExp regex = RegExp(r'^\d*\.?\d*$');
                  if (!regex.hasMatch(value)) {
                    return 'Input must contain only numbers and at most one decimal point';
                  }

                  // Ensure input is a valid decimal value
                  if (double.tryParse(value) == null) {
                    return 'Input must be a valid decimal value';
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
                    height: 32,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _selectedCategoryType = CategoryType.income;
                          _categoryID = null;
                        });
                      },
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
                      onPressed: () {
                        setState(() {
                          _selectedCategoryType = CategoryType.expense;
                          _categoryID = null;
                        });
                      },
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
              SizedBox(
                height: 50,
                width: 340,
                child: ElevatedButton(
                  onPressed: () {
                    editTransactionOnclicked();

                    _amountController.clear();

                    _discriptionController.clear();

                    _dateController.clear();

                    _categoryController.clear();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 4, 78, 207),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Submit',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ),
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
      firstDate: DateTime.now().subtract(const Duration(days: 60)),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = DateFormat('dd-MMM-yyyy').format(_selectedDate!);
      });
    }
  }

  Future<void> editTransactionOnclicked() async {
    final amountText = _amountController.text;
    final discriptionText = _discriptionController.text;

    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      final amount = _amountController.text;
      if (amount.isEmpty) {
        return;
      }
    }

    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      final discription = _discriptionController.text;
      if (discription.isEmpty) {
        return;
      }
    }

    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      final date = _dateController.text;
      if (date.isEmpty) {
        return;
      }
    }

    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();

      if (_selectedCategoryType == null) {
        return;
      }
    }

    final parsedAmount = double.tryParse(amountText);
    if (parsedAmount == null) {
      return;
    }

    final model = TransactionModel(
        amount: parsedAmount,
        discription: discriptionText,
        date: _selectedDate!,
        type: _selectedCategoryType!,
        category: _selectedCategoryModel!,
        id: widget.model.id);
    await TransactionDB.instance.editTransaction(model);
    Navigator.of(context).pop();
    TransactionDB.instance.refresh();
  }
}
