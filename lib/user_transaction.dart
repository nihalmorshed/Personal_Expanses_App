import 'package:flutter/material.dart';
import 'package:personal_expanses/new_transaction.dart';
import 'package:personal_expanses/transaction_list.dart';
import 'package:personal_expanses/transactions.dart';

class UserTransaction extends StatefulWidget {
  UserTransaction({Key? key}) : super(key: key);

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transactions> usertrx = [
    Transactions(
      id: 't1',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transactions(
      id: 't2',
      title: 'Groceries',
      amount: 13.53,
      date: DateTime.now(),
    ),
  ];
  void addnewtransactions(String txtitle, double txamount) {
    final newtx = Transactions(
      id: DateTime.now().toString(),
      title: txtitle,
      amount: txamount,
      date: DateTime.now(),
    );
    setState(() {
      usertrx.add(newtx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(addnewtransactions),
        TransactionList(usertrx),
      ],
    );
  }
}
