import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/modals/transcationModal.dart';

// Data class to represent a transaction
class Transaction {
  final int id;
  final String description;
  final double amount;
  final bool isIncome;
  final DateTime date;

  Transaction({
    required this.id,
    required this.description,
    required this.amount,
    required this.isIncome,
    required this.date,
  });
}

class TransactionScreen extends StatefulWidget {
  @override
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  // Sample transaction data
  @override
  Widget build(BuildContext context) {
    // Calculate total income and expense
    final double totalIncome = TransactionModal.transactionList
        .where((transaction) => transaction.isIncome)
        .fold(0, (sum, transaction) => sum + transaction.amount);
    final double totalExpense = TransactionModal.transactionList
        .where((transaction) => !transaction.isIncome)
        .fold(0, (sum, transaction) => sum + transaction.amount);

    final sortedTransactions = TransactionModal.groupTransactionsByDate();
    final groupedEntries = sortedTransactions.entries.toList();

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.grey.shade300,
            elevation: 10,
            shadowColor: Colors.grey.shade400,
            pinned: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.arrow_upward,
                      color: Colors.green,
                      size: 24,
                    ),
                    SizedBox(width: 4.0),
                    Text(
                      'Income: \$${totalIncome.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 8.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_downward,
                      color: Colors.red,
                      size: 24,
                    ),
                    SizedBox(width: 4.0),
                    Text(
                      'Expense: \$${totalExpense.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                // TransactionModal.groupTransactionsByDate();
                final entry = groupedEntries[index];
                final date = entry.key;
                final transactions = entry.value;
                return TransactionItem(
                  transactionList: transactions,
                  date: date,
                );
              },
              childCount: groupedEntries.length,
            ),
          ),
        ],
      ),
    );
  }
}

class TransactionItem extends StatelessWidget {
  final List<TransactionModal> transactionList;
  final DateTime date;

  const TransactionItem({
    Key? key,
    required this.transactionList,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4.0, // Add shadow
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0), // Rounded corners
      ),
      margin: EdgeInsets.all(4),
      child: Column(children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                DateFormat('dd-MMM-yyyy').format(date),
                style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.normal),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              DateFormat('EEE').format(date),
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w800),
            ),
          ],
        ),
        ...transactionList.map((transaction) {
          return ListTile(
            visualDensity: VisualDensity.compact,
            minVerticalPadding: 1,
            dense: true,
            leading: Icon(
              transaction.modalType.iconName,
              size: 22,
            ),
            title: Text(
              transaction.modalType.name,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(transaction.description),
            trailing: Text(
              "\$ " + transaction.amount.toString(),
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          );
        }).toList(),
        SizedBox(
          height: 12,
          // child: Divider(
          //   thickness: 1,
          //   color: Colors.grey.shade400,
          // ),
        ),
      ]),
    );
  }
}
