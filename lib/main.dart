// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:personal_expanses/new_transaction.dart';
import 'package:personal_expanses/transaction_list.dart';
import 'package:personal_expanses/transactions.dart';

void main(List<String> args) {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Personal Expanses App",
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.redAccent,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
        ),
      ),
      home: Myhomepage(),
    );
  }
}

class Myhomepage extends StatefulWidget {
  @override
  State<Myhomepage> createState() => _MyhomepageState();
}

class _MyhomepageState extends State<Myhomepage> {
  final List<Transactions> usertrx = [
    // Transactions(
    //   id: 't1',
    //   title: 'New Shoes',
    //   amount: 69.99,
    //   date: DateTime.now(),
    // ),
    // Transactions(
    //   id: 't2',
    //   title: 'Groceries',
    //   amount: 13.53,
    //   date: DateTime.now(),
    // ),
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

  void startaddnewtransactions(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {},
            child: NewTransaction(addnewtransactions),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        actions: [
          IconButton(
            onPressed: () => startaddnewtransactions(context),
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.teal,
                child: Text(
                  "Chart!",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                elevation: 5,
              ),
            ),
            TransactionList(usertrx),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => startaddnewtransactions(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
