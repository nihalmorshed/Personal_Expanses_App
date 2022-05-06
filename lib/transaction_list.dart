import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expanses/transactions.dart';

class TransactionList extends StatelessWidget {
  final List<Transactions> trx;
  TransactionList(this.trx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: SingleChildScrollView(
        child: Column(
          children: trx.map((t) {
            return Card(
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.purple,
                        width: 2,
                      ),
                    ),
                    child: Text(
                      '\$${t.amount}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        t.title,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        DateFormat('EEEE, d-MMMM-y').format(t.date),
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
