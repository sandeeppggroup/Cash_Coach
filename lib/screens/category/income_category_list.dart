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
              child: ListTile(
                title: Text(category.name),
                trailing: Wrap(
                  spacing: 2, // space between two icons
                  children: <Widget>[
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.blueGrey,
                      ),
                    ), // icon-1
                    IconButton(
                      onPressed: () {
                        CategoryDB.instance.deleteCategory(category.id);
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
}
