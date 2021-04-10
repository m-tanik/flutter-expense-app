import 'package:expense_app/models/transaction.dart';
import 'package:expense_app/widgets/user_transaction.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Transaction> transactions = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Daily Expense'),
        ),
        body: Container(
          child: ListView(
            children: [
              Container(
                width: double.infinity,
                child: Card(
                  elevation: 5,
                  color: Colors.green,
                  child: Text(
                    'Chart',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              UserTransactions(),
            ],
          ),
        ),
      ),
    );
  }
}
