import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:money_management/db_functions/category/category_db.dart';
import 'package:money_management/models/category/category_model.dart';

ValueNotifier<CategoryType> selectedCategoryNotifier =
    ValueNotifier(CategoryType.income);

Future<void> showCategoryAddPopup(BuildContext context) async {
  final _nameEditingController = TextEditingController();
  String? _inputValue;

  final _formKey = GlobalKey<FormState>();
  showDialog(
    context: context,
    builder: (ctx) {
      return Form(
        key: _formKey,
        child: SimpleDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          backgroundColor: Colors.white,
          elevation: 100,
          title: Center(child: Text('Add Category')),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter category name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _inputValue = value;
                },
                controller: _nameEditingController,
                decoration: InputDecoration(
                  hintText: 'Category Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 40, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  RadioButton(title: 'Income', type: CategoryType.income),
                  RadioButton(title: 'Expense', type: CategoryType.expense),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState?.save();
                    final _name = _nameEditingController.text;
                    if (_name.isEmpty) {
                      return;
                    }
                    final _type = selectedCategoryNotifier.value;
                    final _category = CategoryModel(
                      id: DateTime.now().millisecondsSinceEpoch.toString(),
                      name: _name,
                      type: _type,
                    );
                    CategoryDB.instance.insertCategory(_category);
                    Navigator.of(ctx).pop();
                  }
                },
                child: const Text('Add'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: const Text('Close'),
              ),
            ),
          ],
        ),
      );
    },
  );
}

class RadioButton extends StatelessWidget {
  final String title;
  final CategoryType type;
  const RadioButton({super.key, required this.title, required this.type});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ValueListenableBuilder(
          valueListenable: selectedCategoryNotifier,
          builder: (BuildContext ctx, CategoryType newCategory, Widget? _) {
            return Radio<CategoryType>(
              value: type,
              groupValue: newCategory,
              onChanged: (value) {
                if (value == null) {
                  return;
                }
                selectedCategoryNotifier.value = value;
                selectedCategoryNotifier.notifyListeners();
              },
            );
          },
        ),
        Text(title),
      ],
    );
  }
}
