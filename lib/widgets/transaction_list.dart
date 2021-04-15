import 'package:expense_app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
          elevation: 6,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green,
              radius: 30,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: FittedBox(
                  child: Text(
                    '\$${transactions[index].amount}',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            title: Text('${transactions[index].title}',
                style: Theme.of(context).textTheme.headline6),
            subtitle: Text(
              DateFormat.yMMMd().format(transactions[index].date),
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: () => deleteTx(transactions[index].id),
            ),
          ),
        );
      },
    );
  }
}
