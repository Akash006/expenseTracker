import 'package:flutter/material.dart';

class ExpenseModal {
  final String name;
  final IconData iconName;
  final Color colorName;

  ExpenseModal({
    required this.name,
    required this.iconName,
    required this.colorName,
  });
}

ExpenseModal getExpenseByName(String name) {
  return expenseList.firstWhere(
    (expense) => expense.name == name,
    orElse: () {
      print(name);
      throw Exception("Expense not found");
    },
  );
}

// Define a List instead of an Enum
final List<ExpenseModal> expenseList = [
  ExpenseModal(
    name: "Groceries",
    // iconName: Icons.shopping_cart,
    iconName: IconData(57374, fontFamily: 'MaterialIcons'),
    colorName: Colors.teal.shade200,
  ),
  ExpenseModal(
    name: "Personal",
    iconName: Icons.person,
    colorName: Colors.blueAccent.shade200,
  ),
  ExpenseModal(
    name: "Rent",
    iconName: Icons.home,
    colorName: Colors.orangeAccent.shade200,
  ),
  ExpenseModal(
    name: "Transportation",
    iconName: Icons.directions_car,
    colorName: Colors.greenAccent.shade200,
  ),
  ExpenseModal(
    name: "Entertainment",
    iconName: Icons.movie,
    colorName: Colors.redAccent.shade200,
  ),
  ExpenseModal(
    name: "Utilities",
    iconName: Icons.lightbulb,
    colorName: Colors.yellowAccent.shade200,
  ),
  ExpenseModal(
    name: "Healthcare",
    iconName: Icons.local_hospital,
    colorName: Colors.purpleAccent.shade200,
  ),
  ExpenseModal(
    name: "Dining Out",
    iconName: Icons.restaurant,
    colorName: Colors.pinkAccent.shade200,
  ),
  ExpenseModal(
    name: "Shopping",
    iconName: Icons.shopping_bag,
    colorName: Colors.cyanAccent.shade200,
  ),
  ExpenseModal(
    name: "Travel",
    iconName: Icons.flight,
    colorName: Colors.blueGrey.shade200,
  ),
  ExpenseModal(
    name: "Fuel",
    iconName: Icons.local_gas_station,
    colorName: Colors.brown.shade200,
  ),
];

// Define a List instead of an Enum
final List<ExpenseModal> incomeList = [
  ExpenseModal(
    name: "Salary",
    iconName: Icons.shopping_cart,
    colorName: Colors.yellow.shade200,
  ),
  ExpenseModal(
    name: "Rent",
    iconName: Icons.person,
    colorName: Colors.green.shade200,
  ),
];
