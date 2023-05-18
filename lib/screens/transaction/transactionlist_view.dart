import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';
import 'package:money_management/screens/transaction/view_transaction.dart';

import '../../../models/category/category_model.dart';
import '../../../models/transaction/transaction_model.dart';
import '../edit_transaction/edit_transaction.dart';

late var dropDownVale;

class TransationListView extends StatefulWidget {
  TransationListView({
    Key? key,
    required this.results,
  }) : super(key: key);

  List<TransactionModel> results = [];

  @override
  State<TransationListView> createState() => _DropdownListState();
}

class _DropdownListState extends State<TransationListView> {
  String parseDate(DateTime date) {
    return DateFormat.MMMd().format(date);
  }

  String dropdownvalue = 'All';
  var items = [
    'All',
    'income',
    'Expense',
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log(widget.results.length.toString());
    return Material(
        color: Colors.white,
        child: widget.results.isNotEmpty
            ? ListView.separated(
                padding: const EdgeInsets.all(10),
                itemBuilder: (context, index) {
                  final _value = widget.results[index];
                  log(_value.id.toString(), name: 'valu check');
                  return GestureDetector(
                    onTap: () {
                      log(_value.id.toString(), name: 'gesture');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => View_Transaction(
                                    amount: _value.amount,
                                    category: _value.category.name,
                                    description: _value.discription,
                                    date: _value.date,
                                  )));
                    },
                    child: Slidable(
                      startActionPane:
                          ActionPane(motion: const StretchMotion(), children: [
                        SlidableAction(
                          borderRadius: BorderRadius.circular(30),
                          padding: EdgeInsets.all(8),
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.black,
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditTransaction(
                                          model: model,
                                        )));
                          },
                        ),
                        SlidableAction(
                            borderRadius: BorderRadius.circular(30),
                            spacing: 8,
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.black,
                            icon: IconlyLight.delete,
                            label: 'Delete',
                            onPressed: (context) {
                              _value;

                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Delete'),
                                      content: Text(
                                          'Are you sure?Do you want to delete this transaction?'),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('Cancel')),
                                        TextButton(
                                            onPressed: () {
                                              // TransactionDB.instance
                                              //     .deleteTransaction(_value.id);
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('Ok'))
                                      ],
                                    );
                                  });
                            })
                      ]),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: _value.type == CategoryType.income
                                ? Colors.white
                                : Colors.white,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [Colors.white, Colors.white]),
                                borderRadius: BorderRadius.circular(10)),
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
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
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 10,
                  );
                },
                itemCount: widget.results.length,
              )
            : Center(
                child: Container(
                    height: 150,
                    width: 150,
                    child: Center(child: Text('Empty'))),
              ));
  }
}
