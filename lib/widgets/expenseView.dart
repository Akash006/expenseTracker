import 'package:flutter/material.dart';
import 'package:expense_tracker/modals/expenseModal.dart';
import 'package:go_router/go_router.dart';

class ExpenseView extends StatelessWidget {
  final String view;

  const ExpenseView({super.key, required this.view});

  @override
  Widget build(BuildContext context) {
    // Determine whether to show expenses or income based on `view`
    var expense = (view == "expense") ? expenseList : incomeList;

    return GridView.builder(
      itemCount: expense.length, // Use the correct list length
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 2.2 / 3,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
      ),
      itemBuilder: (ctx, index) {
        final clickedTile = expense[index];
        return GestureDetector(
          onTap: () {
            // Use the clicked tile's data for navigation
            context.push("/addtransaction/$view/${clickedTile.name}");
          },
          child: Card(
            color: Colors.white,
            shadowColor: Colors.black87,
            margin: EdgeInsets.all(2),
            elevation: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  child: Text(
                    clickedTile.name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                IconTheme(
                  data: const IconThemeData(
                    color: Colors.black87,
                    size: 30, // Set the icon size
                  ),
                  child: Icon(clickedTile.iconName),
                ),
                Text(
                  "200",
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
