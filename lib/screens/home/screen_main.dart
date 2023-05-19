import 'package:flutter/material.dart';
import 'package:money_management/screens/add_transactions/add_transactions.dart';
import 'package:money_management/screens/category/category_add_popup.dart';
import 'package:money_management/screens/category/screen_category.dart';
import 'package:money_management/screens/home/screen_home.dart';
import 'package:money_management/screens/home/widgets/bottom_navigation.dart';
import 'package:money_management/screens/statistics/screen_statistics.dart';
import 'package:money_management/screens/transaction/screen_transactions.dart';

class ScreenMain extends StatelessWidget {
  ScreenMain({super.key});
  static ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);
  final _pages = [
    ScreenHome(),
    const ScreenCategory(),
    const Screen_Transaction(),
    Statistics_Screen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const MoneyManagerBottomNavigation(),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: selectedIndexNotifier,
          builder: (BuildContext context, int updatedIndex, _) {
            return _pages[updatedIndex];
          },
        ),
      ),
      floatingActionButton: ValueListenableBuilder(
        valueListenable: selectedIndexNotifier,
        builder: (context, value, child) => selectedIndexNotifier.value < 2
            ? FloatingActionButton(
                backgroundColor: Color.fromARGB(255, 4, 78, 207),
                onPressed: () {
                  if (selectedIndexNotifier.value == 0) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddTransaction()));
                  } else if (selectedIndexNotifier.value == 1) {
                    print('Add Category');
                    showCategoryAddPopup(context);
                  }
                },
                child: const Icon(Icons.add),
              )
            : Text(''),
      ),
    );
  }
}
