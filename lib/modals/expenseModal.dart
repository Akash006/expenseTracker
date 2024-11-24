import 'package:flutter/material.dart';

class ExpenseModal {
  final String name;
  final Icon iconName;
  final double amount;
  final Color colorName;

  ExpenseModal({
    required this.name,
    required this.iconName,
    required this.amount,
    required this.colorName,
  });
}

// Define a List instead of an Enum
final List<ExpenseModal> expenseList = [
  ExpenseModal(
    name: "Groceries",
    iconName: Icon(Icons.shopping_cart),
    amount: 150.0,
    colorName: Colors.teal.shade200,

  ),
  ExpenseModal(
    name: "Personal",
    iconName: Icon(Icons.person),
    amount: 150.0,
    colorName: Colors.blueAccent.shade200,
  ),
];

// Define a List instead of an Enum
final List<ExpenseModal> incomeList = [
  ExpenseModal(
    name: "Salary",
    iconName: Icon(Icons.shopping_cart),
    amount: 150.0,
    colorName: Colors.yellow.shade200,

  ),
  ExpenseModal(
    name: "Rent",
    iconName: Icon(Icons.person),
    amount: 150.0,
    colorName: Colors.green.shade200,
  ),
];
