import 'package:flutter/material.dart';
import 'package:expense_tracker/modals/expenseModal.dart';

class ExpenseView extends StatelessWidget {
  final String view;

  const ExpenseView({super.key, required this.view});

  @override
  Widget build(BuildContext context) {
    var expense = (this.view == "expense") ? expenseList : incomeList;
    return GridView.builder(
      itemCount: expenseList.length,
      padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 2.2 / 3,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
      ),
      itemBuilder: (ctx, index) {
        return Card(
            color: expense[index].colorName,
            elevation: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  expense[index].name,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                IconTheme(
                  data: IconThemeData(
                    // color: darkenColor(expense[index].colorName),
                    color: Colors.black54,
                    size: 30,          // Set the icon size
                  ),
                  child: expense[index].iconName,
                ),
                Text(
                    expense[index].amount.toString(),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            )
        );
      },
    );
  }
}
