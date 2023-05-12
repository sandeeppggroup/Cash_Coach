import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';
import 'package:money_management/db_functions/category/category_db.dart';
import 'package:money_management/db_functions/transactions/transaction_db.dart';
import 'package:money_management/models/category/category_model.dart';
import 'package:money_management/models/transaction/transaction_model.dart';
import 'package:money_management/screens/add_transactions/add_transactions.dart';
import 'package:money_management/screens/category/income_category_list.dart';
import 'package:money_management/screens/drawer_pages/about.dart';
import 'package:money_management/screens/drawer_pages/privacy_policy.dart';
import 'package:money_management/screens/drawer_pages/terms.dart';
import 'package:money_management/screens/screen_splash/splash_two.dart';
import 'package:money_management/screens/transaction/screen_transactions.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  Widget build(BuildContext context) {
    TransactionDB.instance.refresh();
    CategoryDB.instance.refreshUI();
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 3, 20, 114),
        title: const Text(
          'Welcome To Cash Coach',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 3, 20, 114),
              ),
              child: Center(
                child: Text(
                  'Cash Coach',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
            ),
            ListTile(
              title: Row(
                children: const [
                  Icon(Icons.person),
                  SizedBox(
                    width: 20,
                  ),
                  Text('About'),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutScreen()),
                );
              },
            ),
            ListTile(
              title: Row(
                children: const [
                  Icon(Icons.restore_page_outlined),
                  SizedBox(
                    width: 20,
                  ),
                  Text('Reset'),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Row(
                children: const [
                  Icon(Icons.share),
                  SizedBox(
                    width: 20,
                  ),
                  Text('Share'),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Row(
                children: const [
                  Icon(Icons.money_outlined),
                  SizedBox(
                    width: 20,
                  ),
                  Text('Terms and conditions'),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TermsConditions()),
                );
              },
            ),
            ListTile(
              title: Row(
                children: const [
                  Icon(Icons.privacy_tip),
                  SizedBox(
                    width: 20,
                  ),
                  Text('Privacy policy'),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PrivacyPolicy()),
                );
              },
            ),
            ListTile(
              title: Row(
                children: const [
                  Icon(Icons.arrow_back),
                  SizedBox(
                    width: 20,
                  ),
                  Text('Back to app'),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              height: 120,
            ),
            const Center(
              child: Text(
                'Version 1.0.1',
                style: TextStyle(fontSize: 13),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.35,
            // width: MediaQuery.of(context).size.width * 0.7,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 3, 20, 114),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        'Current balance',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        '₹35000.00',
                        style: TextStyle(color: Colors.white, fontSize: 35),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.41,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 4, 78, 207),
                        ),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(6.0),
                              child: Icon(
                                Icons.arrow_downward,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Income',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 13),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '₹50000',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.41,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 4, 78, 207),
                        ),
                        child: Row(
                          children: [
                            Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(6.0),
                                  child: Icon(
                                    Icons.arrow_upward,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Expenses',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 13),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      '₹50000',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 22),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Recent transactions',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ScreenTransactions(),
                        ));
                  },
                  child: const Text(
                    'View all',
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: TransactionDB.instance.transactionListNOtifier,
              builder: (BuildContext context, List<TransactionModel> newList,
                  Widget? _) {
                return ListView.builder(
                  itemCount: newList.length,
                  // values
                  itemBuilder: (BuildContext context, int index) {
                    final _value = newList[index];
                    final _date = _value.date;
                    final _formatedDate = DateFormat('dd-MMM').format(_date);
                    return Slidable(
                      key: Key(_value.id!),
                      startActionPane: ActionPane(
                        motion: const StretchMotion(),
                        children: [
                          SlidableAction(
                            borderRadius: BorderRadius.circular(30),
                            padding: EdgeInsets.all(8),
                            backgroundColor: Color.fromARGB(255, 4, 78, 207),
                            foregroundColor: Colors.white,
                            icon: IconlyLight.edit,
                            label: 'Edit',
                            onPressed: (context) {
                              final model = TransactionModel(
                                  discription: _value.discription,
                                  amount: _value.amount,
                                  date: _value.date,
                                  category: _value.category,
                                  type: _value.type,
                                  id: _value.id);
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => EditTransaction(
                              //               model: model,
                              //             )));
                            },
                          ),
                          SlidableAction(
                            borderRadius: BorderRadius.circular(30),
                            spacing: 8,
                            backgroundColor: Color.fromARGB(255, 4, 78, 207),
                            foregroundColor: Colors.white,
                            icon: IconlyLight.delete,
                            label: 'Delete',
                            onPressed: (context) {
                              _value.id;

                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Delete'),
                                    content: const Text(
                                        'Are you sure?Do you want to delete this transaction?'),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Cancel')),
                                      TextButton(
                                          onPressed: () {
                                            TransactionDB.instance
                                                .deleteTransaction(_value.id!);
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Ok'))
                                    ],
                                  );
                                },
                              );
                            },
                          )
                        ],
                      ),
                      child: Card(
                        elevation: 20,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: ListTile(
                          leading: Text(
                            parseDate(_value.date),
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          trailing: Column(
                            children: [
                              Text(
                                ' ${_value.category.name}',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: _value.type == CategoryType.income
                                      ? Colors.green
                                      : Colors.red,
                                ),
                              ),
                              Text(
                                "₹ ${_value.amount}",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: _value.type == CategoryType.income
                                      ? Colors.green
                                      : Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  String parseDate(DateTime date) {
    final date0 = DateFormat.MMMd().format(date);
    final splitedDate = date0.split(' ');
    return '${splitedDate.last}\n${splitedDate.first}';
  }
}
