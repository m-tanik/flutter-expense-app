import 'package:expense_app/widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import 'dart:core';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final recentTransactions;
  Chart(this.recentTransactions);

  // using getter for grouping the daily expenses based
  // on date
  //down
  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      var totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        // using for loop for iterate 7 times
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month ==
                weekDay
                    .month && // adding the condition for the for loop to see if
            // the date is today or not
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i]
              .amount; // here after checking the date if the date is today then
          // it adds the total amount
        }
      }
      print(
        DateFormat.E().format(weekDay),
      );
      print(totalSum);
      // here date format is used to formatting the name of the day like 'sat',
      // 'sun' 'mon'
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum
      };
    }).reversed.toList();
  }
  //up

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((data) {
            return Expanded(
              child: ChartBar(
                label: data['day'],
                spendingAmount: data['amount'],
                spendingPctOfTotal: totalSpending == 0.0
                    ? 0.0
                    : (data['amount'] as double) / totalSpending,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
