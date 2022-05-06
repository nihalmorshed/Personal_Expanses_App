// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:personal_expanses/new_transaction.dart';
import 'package:personal_expanses/transaction_list.dart';
import 'package:personal_expanses/user_transaction.dart';

void main(List<String> args) {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter App",
      home: Myhomepage(),
    );
  }
}

class Myhomepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
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
            UserTransaction(),
          ],
        ),
      ),
    );
  }
}
