// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addtx;
  NewTransaction(this.addtx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final amountcnt = TextEditingController();

  final titlecnt = TextEditingController();

  void submitdata() {
    final enteredtitle = titlecnt.text;
    final enteredamount = double.parse(amountcnt.text);

    if (enteredtitle.isEmpty || enteredamount <= 0) {
      return;
    }

    widget.addtx(
      enteredtitle,
      enteredamount,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          TextField(
            controller: titlecnt,
            decoration: InputDecoration(
              labelText: 'Title',
            ),
            onSubmitted: (_) => submitdata,
          ),
          TextField(
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            controller: amountcnt,
            decoration: InputDecoration(
              labelText: 'Amount',
            ),
            onSubmitted: (_) => submitdata,
          ),
          FlatButton(
            onPressed: submitdata,
            child: Text(
              "Add Transactions",
              style: TextStyle(color: Colors.purple),
            ),
          ),
        ]),
      ),
    );
  }
}
