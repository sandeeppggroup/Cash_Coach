import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:money_management/db_functions/category/category_db.dart';

import '../../models/category/category_model.dart';

class ExpenseCategoryList extends StatelessWidget {
  const ExpenseCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: CategoryDB().expenseCategoryListListener,
      builder: (BuildContext ctx, List<CategoryModel> newList, Widget? _) {
        return ListView.separated(
          itemBuilder: (ctx, index) {
            final category = newList[index];
            return Card(
              elevation: 30,
              child: ListTile(
                title: Text(category.name),
                trailing: Wrap(
                  spacing: 2, // space between two icons
                  children: <Widget>[
                    // IconButton(
                    //   onPressed: () {},
                    //   icon: const Icon(
                    //     Icons.edit,
                    //     color: Colors.blueGrey,
                    //   ),
                    // ),
                    IconButton(
                      onPressed: () {
                        showDeleteDialog(context, category.id);
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ), // icon-2
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (ctx, index) {
            return const SizedBox(
              height: 10,
            );
          },
          itemCount: newList.length,
        );
      },
    );
  }

  void showDeleteDialog(BuildContext context, String id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete category'),
          content: const Text('Are you sure you want to delete this category?'),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('CANCEL'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: const Text('DELETE'),
              onPressed: () {
                CategoryDB.instance.deleteCategory(id);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
