import 'package:flutter/material.dart';
import 'package:money_management/db_functions/category/category_db.dart';
import 'package:money_management/screens/category/expense_category_list.dart';
import 'package:money_management/screens/category/income_category_list.dart';

class ScreenCategory extends StatefulWidget {
  const ScreenCategory({super.key});

  @override
  State<ScreenCategory> createState() => _ScreenCategoryState();
}

class _ScreenCategoryState extends State<ScreenCategory>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    CategoryDB().refreshUI();
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width *
                  0.930, // set width to 80% of screen width
              height: MediaQuery.of(context).size.height * 1, //
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.white,
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Container(
                    child: Card(
                      child: TabBar(
                        indicator: BoxDecoration(
                          color: const Color.fromARGB(255, 4, 78, 207),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        labelColor: Colors.white,
                        labelStyle: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                        unselectedLabelColor:
                            const Color.fromARGB(255, 4, 78, 207),
                        controller: _tabController,
                        tabs: const [
                          Tab(
                            text: 'Income',
                          ),
                          Tab(
                            text: 'Expense',
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: IncomeCategoryList(),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: ExpenseCategoryList(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
