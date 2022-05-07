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
      child: trx.isEmpty
          ? Column(
              children: [
                Text(
                  'No Transactions Added Yet!!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    )),
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).primaryColorLight,
                            width: 2,
                          ),
                        ),
                        child: Text(
                          '\$${trx[index].amount.toStringAsFixed(2)}',
                          style: Theme.of(context).textTheme.headline6,
                          // TextStyle(
                          //   fontSize: 20,
                          //   fontWeight: FontWeight.bold,
                          //   color: Theme.of(context).primaryColorDark,

                          // ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            trx[index].title,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Text(
                            DateFormat('EEEE, d-MMMM-y')
                                .format(trx[index].date),
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              itemCount: trx.length,
            ),
    );
  }
}
