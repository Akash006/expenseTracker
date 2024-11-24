import 'package:flutter/material.dart';

class ExpenseModal {
  final String name;
  final Icon iconName;
  final double amount;

  ExpenseModal({
    required this.name,
    required this.iconName,
    required this.amount,
  });
}

// Define a List instead of an Enum
final List<ExpenseModal> expenseList = [
  ExpenseModal(
    name: "Groceries",
    iconName: Icon(Icons.shopping_cart),
    amount: 150.0,
  ),
  ExpenseModal(
    name: "Personal",
    iconName: Icon(Icons.person),
    amount: 150.0,
  ),
];
