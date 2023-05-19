// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:money_management/db_functions/transactions/transaction_db.dart';
// import 'package:money_management/models/category/category_model.dart';
// import 'package:money_management/screens/dropdown_button/dropdown_button.dart';
// import 'package:money_management/screens/home/screen_home.dart';
// import 'package:money_management/screens/home/screen_main.dart';

// import '../../db_functions/category/category_db.dart';
// import '../../models/transaction/transaction_model.dart';

// class ScreenTransactions extends StatefulWidget {
//   const ScreenTransactions({super.key});

//   @override
//   State<ScreenTransactions> createState() => _ScreenTransactionsState();
// }

// class _ScreenTransactionsState extends State<ScreenTransactions>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;

//   @override
//   void initState() {
//     _tabController = TabController(length: 3, vsync: this);
//     CategoryDB().refreshUI();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var dropdownValue;
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
// leading: IconButton(
//     onPressed: () {
//       Navigator.pushReplacement(context,
//           MaterialPageRoute(builder: (context) => ScreenMain()));
//     },
//     icon: Icon(
//       Icons.arrow_back,
//       size: 30,
//     )),
//         backgroundColor: const Color.fromARGB(255, 4, 78, 207),
//         centerTitle: true,
//         title: const Text(
//           'Transactions',
//           style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(top: 12.0, right: 8, left: 8),
//         child: Column(
//           children: [
//             SizedBox(
//               height: 40,
//               child: TextFormField(
//                 decoration: InputDecoration(
//                   suffixIcon: Icon(Icons.search),
//                   labelText: 'Search....',
//                   border: OutlineInputBorder(
//                     borderSide: const BorderSide(width: .5, color: Colors.blue),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   fillColor: Colors.grey[100],
//                   filled: true,
//                 ),
//                 onChanged: (discription) {
//                   TransactionDB.instance.search(discription);
//                 },
//               ),
//             ),
//             Card(
//               child: TabBar(
//                 indicator: BoxDecoration(
//                   color: const Color.fromARGB(255, 4, 78, 207),
//                   borderRadius: BorderRadius.circular(18),
//                 ),
//                 labelColor: Colors.white,
//                 labelStyle:
//                     const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
//                 unselectedLabelColor: const Color.fromARGB(255, 4, 78, 207),
//                 controller: _tabController,
//                 tabs: const [
//                   Tab(
//                     text: 'Overview',
//                   ),
//                   Tab(
//                     text: 'Income',
//                   ),
//                   Tab(
//                     text: 'Expense',
//                   ),
//                 ],
//               ),
//             ),
//             const Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Card(
//                 child: Padding(
//                   padding: EdgeInsets.all(5.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'Sort',
//                         style: TextStyle(
//                             fontSize: 25, fontWeight: FontWeight.w800),
//                       ),
//                       SizedBox(
//                         width: 120,
//                         height: 35,
//                         child: DropdownButtonWidge(),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: ValueListenableBuilder(
//                   valueListenable:
//                       TransactionDB.instance.transactionListNOtifier,
//                   builder: (BuildContext context,
//                       List<TransactionModel> newList, Widget? _) {
//                     return ListView.builder(
//                       itemCount: newList.length,
//                       itemBuilder: (BuildContext context, int index) {
//                         final values = newList[index];
//                         return Card(
//                           child: ListTile(
//                             title: Text(
//                               values.category.name,
//                               style: TextStyle(
//                                   fontSize: 20, fontWeight: FontWeight.w600),
//                             ),
//                             subtitle: Text(
//                               values.discription,
//                               style: TextStyle(
//                                   fontSize: 15, fontWeight: FontWeight.w600),
//                             ),
//                             trailing: Column(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 Text(
//                                   '₹${values.amount}',
//                                   style: TextStyle(
//                                     color: values.type == CategoryType.income
//                                         ? Colors.green
//                                         : Colors.red,
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.w700,
//                                   ),
//                                 ),
//                                 Text(
//                                   parseDateForTransactionList(values.date),
//                                   style: TextStyle(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                     );
//                   }),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   String parseDateForTransactionList(DateTime date) {
//     final date0 = DateFormat.MMMd().format(date);
//     final splitedDate = date0.split(' ');
//     return '  ${splitedDate.last} ${splitedDate.first}';
//   }

// }

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_management/db_functions/category/category_db.dart';
import 'package:money_management/db_functions/transactions/transaction_db.dart';
import 'package:money_management/screens/transaction/transactionlist_view.dart';

import '../../../models/transaction/transaction_model.dart';
import '../home/screen_main.dart';

class Screen_Transaction extends StatefulWidget {
  const Screen_Transaction({super.key});

  @override
  State<Screen_Transaction> createState() => _Screen_TransactionState();
}

class _Screen_TransactionState extends State<Screen_Transaction>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  dynamic dropDownVale = 'All';
  @override
  void initState() {
    dropDownVale = 'All';
    results.value.clear();
    results.notifyListeners();
    results.value = TransactionDB.instance.transactionListNOtifier.value;
    results.notifyListeners();
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    _tabController.addListener(() {
      // results.value.clear();

      results.value = TransactionDB.instance.transactionListNOtifier.value;
      results.notifyListeners();
      setState(() {
        filter(dropDownVale);
      });
      results.notifyListeners();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  DateTime selectedmonth = DateTime.now();
  void _selectDate(context) async {
    final DateTime? picked = await showDatePicker(
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary:
                    Color.fromARGB(213, 20, 27, 38), // header background color
                onPrimary: Colors.white, // header text color
                onSurface: Color.fromARGB(213, 20, 27, 38), // body text color
              ),
            ),
            child: child!,
          );
        },
        context: context,
        initialDate: selectedmonth,
        firstDate: DateTime(2021),
        lastDate: DateTime(2030));

    if (picked != null && picked != selectedmonth) {
      setState(() {
        selectedmonth = picked;
      });
    }
  }

  ValueNotifier<List<TransactionModel>> results = ValueNotifier([]);

  List items = ['All', 'today', 'yesterday', 'week', 'month'];

  String parseDate(DateTime date) {
    return DateFormat.MMMd().format(date);
  }

  void _runFilter(String enteredKeyword) {
    if (enteredKeyword.isEmpty) {
      setState(() {
        filter(dropDownVale);
      });
    } else {
      setState(() {
        results.value = results.value
            .where((user) => user.category.name
                .toLowerCase()
                .contains(enteredKeyword.toLowerCase()))
            .toList();
        results.notifyListeners();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // results.clear();
    TransactionDB.instance.refresh();
    CategoryDB.instance.refreshUI();

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => ScreenMain()));
              },
              icon: Icon(
                Icons.arrow_back,
                size: 30,
              )),
          backgroundColor: Colors.blue,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Text(
            'Transactions',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.w800, color: Colors.black),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: ValueListenableBuilder(
          valueListenable: TransactionDB.instance.transationAll,
          builder: (context, value, child) => ValueListenableBuilder(
            valueListenable: results,
            builder: (context, value, child) => Column(children: [
              Padding(
                padding: const EdgeInsets.only(left: 250.0, right: 5),
                child: DropdownButton(
                    icon: const Icon(Icons.filter_list_alt),
                    underline: Container(),
                    elevation: 0,
                    borderRadius: BorderRadius.circular(10),
                    items: items.map((e) {
                      return DropdownMenuItem(
                        value: e,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(e),
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      if (newValue == 'month') {
                        _selectDate(context);
                      }
                      filter(newValue);
                    }),
              ),
              TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.blue,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 15,
                        offset: Offset(5, 5),
                      ),
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 15,
                        offset: Offset(-5, -5),
                      ),
                    ]),
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black,
                tabs: const [
                  Tab(
                    text: 'Overview',
                  ),
                  Tab(
                    text: 'Income',
                  ),
                  Tab(
                    text: 'Expense',
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                  child: TabBarView(controller: _tabController, children: [
                TransationListView(
                  results: results.value,
                ),
                TransationListView(
                  results: results.value,
                ),
                TransationListView(
                  results: results.value,
                )
              ])),
            ]),
          ),
        ));
  }

  void filter(newValue) {
    log('filter');

    results.value = TransactionDB.instance.transationAll.value;
    results.notifyListeners();
    setState(() {
      dropDownVale = newValue;
    });
    log(results.value.length.toString(), name: 'vvvvvn');
    log(dropDownVale.toString(), name: 'filter');
    final DateTime now = DateTime.now();
    if (dropDownVale == 'All') {
      setState(() {
        results.value = (_tabController.index == 0
            ? TransactionDB.instance.transactionListNOtifier.value
            : _tabController.index == 1
                ? TransactionDB().incomeListenable.value
                : TransactionDB().expenseListenable.value);
        results.notifyListeners();
      });
      results.notifyListeners();
      log(_tabController.index.toString(), name: 'filter_tabe');
    } else if (dropDownVale == 'today') {
      results.value.clear();
      log(dropDownVale);
      setState(() {
        results.value = (_tabController.index == 0
                ? TransactionDB.instance.transactionListNOtifier.value
                : _tabController.index == 1
                    ? TransactionDB().incomeListenable.value
                    : TransactionDB().expenseListenable.value)
            .where((element) => parseDate(element.date)
                .toLowerCase()
                .contains(parseDate(DateTime.now()).toLowerCase()))
            .toList();
        results.notifyListeners();
      });
      results.notifyListeners();
      log(_tabController.index.toString(), name: 'filter_tabe');
    } else if (dropDownVale == 'yesterday') {
      results.value.clear();
      setState(() {
        DateTime start = DateTime(now.year, now.month, now.day - 1);
        DateTime end = start.add(const Duration(days: 1));
        results.value = (_tabController.index == 0
                ? TransactionDB.instance.transactionListNOtifier.value
                : _tabController.index == 1
                    ? TransactionDB().incomeListenable.value
                    : TransactionDB().expenseListenable.value)
            .where((element) =>
                (element.date.isAfter(start) || element.date == start) &&
                element.date.isBefore(end))
            .toList();
        results.notifyListeners();
      });
      results.notifyListeners();
      log(_tabController.index.toString(), name: 'filter_tabe');
    } else if (dropDownVale == 'week') {
      results.value.clear();
      results.notifyListeners();
      setState(() {
        DateTime start = DateTime(now.year, now.month, now.day - 6);
        DateTime end = DateTime(start.year, start.month, start.day + 7);
        results.value = (_tabController.index == 0
                ? TransactionDB.instance.transactionListNOtifier.value
                : _tabController.index == 1
                    ? TransactionDB().incomeListenable.value
                    : TransactionDB().expenseListenable.value)
            .where((element) =>
                (element.date.isAfter(start) || element.date == start) &&
                element.date.isBefore(end))
            .toList();
        results.notifyListeners();
      });
    } else {
      results.value.clear();
      setState(() {
        DateTime start = DateTime(selectedmonth.year, selectedmonth.month, 1);
        DateTime end = DateTime(start.year, start.month + 1, start.day);
        results.value = (_tabController.index == 0
                ? TransactionDB.instance.transactionListNOtifier.value
                : _tabController.index == 1
                    ? TransactionDB().incomeListenable.value
                    : TransactionDB().expenseListenable.value)
            .where((element) =>
                (element.date.isAfter(start) || element.date == start) &&
                element.date.isBefore(end))
            .toList();
        results.notifyListeners();
      });
    }
  }
}
