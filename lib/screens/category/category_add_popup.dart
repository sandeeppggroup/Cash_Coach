import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:money_management/db_functions/category/category_db.dart';
import 'package:money_management/models/category/category_model.dart';

ValueNotifier<CategoryType> selectedCategoryNotifier =
    ValueNotifier(CategoryType.income);

Future<void> showCategoryAddPopup(BuildContext context) async {
  final nameEditingController = TextEditingController();

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
                controller: nameEditingController,
                decoration: InputDecoration(
                  hintText: 'Category Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 40, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                    final categoryName = nameEditingController.text;

                    final check = selectedCategoryNotifier.value ==
                            CategoryType.income
                        ? CategoryDB.instance.incomeCategoryListListener.value
                            .where((element) {
                            return element.name.contains(categoryName);
                          })
                        : CategoryDB.instance.expenseCategoryListListener.value
                            .where((element) {
                            return element.name.contains(categoryName);
                          });

                    if (check.isNotEmpty) {
                      return;
                    }
                    if (categoryName.isEmpty) {
                      return;
                    }
                    final type = selectedCategoryNotifier.value;
                    final category = CategoryModel(
                      id: DateTime.now().millisecondsSinceEpoch.toString(),
                      name: categoryName,
                      type: type,
                    );
                    CategoryDB.instance.insertCategory(category);
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
