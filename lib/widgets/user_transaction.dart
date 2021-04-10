import 'package:flutter/material.dart';
import 'package:expense_app/models/transaction.dart';

import '../widgets/new_transaction.dart';
import '../widgets/transaction_list.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _usertransaction = [];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      amount: txAmount,
      title: txTitle,
      date: DateTime.now(),
    );

    setState(() {
      _usertransaction.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(
          _addNewTransaction,
        ),
        TransactionList(_usertransaction),
      ],
    );
  }
}
