import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
  final List<Transaction> _transactions = [
    Transaction(
        id: 1,
        description: "Salary",
        amount: 5000.0,
        isIncome: true,
        date: DateTime.now().subtract(Duration(days: 1))),
    Transaction(
        id: 2,
        description: "Groceries",
        amount: 200.0,
        isIncome: false,
        date: DateTime.now().subtract(Duration(days: 2))),
    Transaction(
        id: 3,
        description: "Bonus",
        amount: 1000.0,
        isIncome: true,
        date: DateTime.now().subtract(Duration(days: 3))),
    Transaction(
        id: 4,
        description: "Dinner",
        amount: 50.0,
        isIncome: false,
        date: DateTime.now().subtract(Duration(days: 4))),
    Transaction(
        id: 5,
        description: "Rent",
        amount: 1500.0,
        isIncome: false,
        date: DateTime.now().subtract(Duration(days: 5))),
    Transaction(
        id: 6,
        description: "Freelance",
        amount: 800.0,
        isIncome: true,
        date: DateTime.now().subtract(Duration(days: 6))),
    Transaction(
        id: 7,
        description: "Shopping",
        amount: 300.0,
        isIncome: false,
        date: DateTime.now().subtract(Duration(days: 7))),
  ];

  @override
  Widget build(BuildContext context) {
    // Calculate total income and expense
    final double totalIncome = TransactionModal.transactionList
        .where((transaction) => transaction.isIncome)
        .fold(0, (sum, transaction) => sum + transaction.amount);
    final double totalExpense = TransactionModal.transactionList
        .where((transaction) => !transaction.isIncome)
        .fold(0, (sum, transaction) => sum + transaction.amount);

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 250.0, // Increased height
            floating: true,
            pinned: true,
            elevation: 10,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              titlePadding: EdgeInsets.all(10),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.arrow_upward, color: Colors.green, size: 18),
                      SizedBox(width: 4.0),
                      Text(
                        'Income: \$${totalIncome.toStringAsFixed(2)}',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.arrow_downward, color: Colors.red, size: 18),
                      SizedBox(width: 4.0),
                      Text(
                        'Expense: \$${totalExpense.toStringAsFixed(2)}',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0),
                      ),
                    ],
                  ),
                ],
              ),
              background: Text(
                'Transactions',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                final transaction = TransactionModal.transactionList[index];
                return TransactionItem(transaction: transaction);
              },
              childCount: TransactionModal.transactionList.length,
            ),
          ),
        ],
      ),
    );
  }
}

class TransactionItem extends StatelessWidget {
  final TransactionModal transaction;

  const TransactionItem({Key? key, required this.transaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      elevation: 4.0, // Add shadow
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0), // Rounded corners
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(
              transaction.modalType.iconName,
              size: 28,
              color: transaction.modalType.colorName,
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transaction.description,
                    style: TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 16), // Medium
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    DateFormat('dd MMM yyyy')
                        .format(transaction.transactionDateTime),
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
            ),
            Text(
              '${transaction.isIncome ? "+" : "-"}\$${transaction.amount.toStringAsFixed(2)}',
              style: TextStyle(
                color: transaction.isIncome ? Colors.green : Colors.red,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
