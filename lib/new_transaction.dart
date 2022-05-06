import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addtx;
  final amountcnt = TextEditingController();
  final titlecnt = TextEditingController();

  NewTransaction(this.addtx);

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
          ),
          TextField(
            controller: amountcnt,
            decoration: InputDecoration(
              labelText: 'Amount',
            ),
          ),
          FlatButton(
            onPressed: () {
              addtx(titlecnt.text, double.parse(amountcnt.text));
            },
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
