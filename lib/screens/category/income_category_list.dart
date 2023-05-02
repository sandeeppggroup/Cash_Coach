import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../db_functions/category/category_db.dart';
import '../../models/category/category_model.dart';

class IncomeCategoryList extends StatelessWidget {
  const IncomeCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: CategoryDB().incomeCategoryListListener,
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
          title: Text('Delete Category'),
          content: Text('Are you sure you want to delete this category?'),
          actions: <Widget>[
            ElevatedButton(
              child: Text('CANCEL'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text('DELETE'),
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
