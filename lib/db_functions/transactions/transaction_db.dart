import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:money_management/models/category/category_model.dart';
import 'package:money_management/models/transaction/transaction_model.dart';

const TRANSACTION_DB_NAME = 'transaction-db';

abstract class TransactionDbFunctions {
  Future<void> addTransaction(TransactionModel obj);
  Future<List<TransactionModel>> getAllTransaction();
}

class TransactionDB implements TransactionDbFunctions {
  TransactionDB._internal();
  static TransactionDB instance = TransactionDB._internal();

  factory TransactionDB() {
    return instance;
  }

  ValueNotifier<List<TransactionModel>> transactionListNOtifier =
      ValueNotifier([]);

  @override
  Future<void> addTransaction(TransactionModel obj) async {
    final _transactionDB =
        await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
    await _transactionDB.put(obj.id, obj);
  }

  Future<void> refresh() async {
    final _list = await getAllTransaction();
    transactionListNOtifier.value.clear();
    transactionListNOtifier.value.addAll(_list);
    transactionListNOtifier.notifyListeners();
  }

  @override
  Future<List<TransactionModel>> getAllTransaction() async {
    final _transactionDB =
        await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
    return _transactionDB.values.toList();
  }
}
