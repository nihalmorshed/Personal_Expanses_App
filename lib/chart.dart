// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expanses/transactions.dart';

class chart extends StatelessWidget {
  final List<Transactions> recentTransactions;

  chart(this.recentTransactions);

  List<Map<String, Object>> get groupedtransactionvalues {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(
        Duration(days: index),
      );
      double totalsum = 0.0;
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekday.day &&
            recentTransactions[i].date.month == weekday.month &&
            recentTransactions[i].date.year == weekday.year) {
          totalsum += recentTransactions[i].amount;
        }
      }
      print(DateFormat.E().format(weekday));
      print(totalsum);
      String day = DateFormat.E().format(weekday).substring(0, 3);
      return {
        'day': day,
        'amount': totalsum,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: groupedtransactionvalues.map((e) {
          return Text('${e['day']} : ${e['amount']}');
        }).toList(),
      ),
    );
  }
}
