import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

class ExpenseCategoryList extends StatelessWidget {
  const ExpenseCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (ctx, index) {
        return Card(
          child: ListTile(
            title: Text('Expense category $index'),
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
                  onPressed: () {},
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
      itemCount: 1000,
    );
  }
}
