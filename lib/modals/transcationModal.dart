import 'expenseModal.dart';

class TransactionModal {
  final ExpenseModal modalType;
  final double amount;
  final DateTime transactionDateTime;
  final bool isIncome;
  final String description;


  TransactionModal({
    required this.modalType,
    required this.amount,
    required this.transactionDateTime,
    required this.isIncome,
    required this.description,
  });

  /// Groups transactions by their transaction date.
  static Map<DateTime, List<TransactionModal>> groupTransactionsByDate() {
    // Create a map to hold grouped transactions
    Map<DateTime, List<TransactionModal>> groupedTransactions = {};

    for (var transaction in transactionList) {
      // Normalize the date to only include year, month, and day
      DateTime dateKey = DateTime(
        transaction.transactionDateTime.year,
        transaction.transactionDateTime.month,
        transaction.transactionDateTime.day,
      );

      // Add the transaction to the list for that date
      if (groupedTransactions.containsKey(dateKey)) {
        groupedTransactions[dateKey]!.add(transaction);
      } else {
        groupedTransactions[dateKey] = [transaction];
      }
    }

    // Sort the map by keys (dates) in descending order
    var sortedKeys = groupedTransactions.keys.toList()
      ..sort((a, b) => b.compareTo(a));

    // Create a sorted map using the sorted keys
    Map<DateTime, List<TransactionModal>> sortedGroupedTransactions = {
      for (var key in sortedKeys) key: groupedTransactions[key]!,
    };

    // print(sortedGroupedTransactions);
    return sortedGroupedTransactions;
  }

  static List<TransactionModal> transactionList = [
    TransactionModal(
      modalType: getExpenseByName("Groceries"),
      amount: 50.0,
      transactionDateTime: DateTime(2024, 11, 25, 10, 30),
      isIncome: false,
      description: "Food",
    ),
    TransactionModal(
      modalType: getExpenseByName("Fuel"),
      amount: 20.0,
      transactionDateTime: DateTime(2024, 11, 25, 10, 30),
      isIncome: false,
      description: "Gas",
    ),
    TransactionModal(
      modalType: getExpenseByName("Utilities"),
      amount: 100.0,
      transactionDateTime: DateTime(2024, 11, 30),
      isIncome: false,
      description: "Bills",
    ),
    TransactionModal(
      modalType: getExpenseByName("Dining Out"),
      amount: 30.0,
      transactionDateTime: DateTime(2024, 11, 20),
      isIncome: false,
      description: "Restaurant",
    ),
    TransactionModal(
      modalType: getExpenseByName("Rent"),
      amount: 1200.0,
      transactionDateTime: DateTime(2024, 12, 1),
      isIncome: true,
      description: "Housing",
    ),
    TransactionModal(
      modalType: getExpenseByName("Entertainment"),
      amount: 15.0,
      transactionDateTime: DateTime(2024, 11, 22, 18, 0),
      isIncome: false,
      description: "Fun",
    ),
    TransactionModal(
      modalType: getExpenseByName("Transportation"),
      amount: 10.0,
      transactionDateTime: DateTime(2024, 11, 22, 18, 0),
      isIncome: false,
      description: "Commute",
    ),
    TransactionModal(
      modalType: getExpenseByName("Shopping"),
      amount: 75.0,
      transactionDateTime: DateTime(2024, 11, 27, 16, 45),
      isIncome: false,
      description: "Clothing",
    ),
    TransactionModal(
      modalType: getExpenseByName("Healthcare"),
      amount: 200.0,
      transactionDateTime: DateTime(2024, 11, 15, 14, 20),
      isIncome: false,
      description: "Medical",
    ),
    TransactionModal(
      modalType: getExpenseByName("Travel"),
      amount: 500.0,
      transactionDateTime: DateTime(2024, 11, 15, 14, 20),
      isIncome: false,
      description: "Vacation",
    ),
    TransactionModal(
      modalType: getExpenseByName("Personal"),
      amount: 40.0,
      transactionDateTime: DateTime(2024, 11, 28, 13, 10),
      isIncome: false,
      description: "Self",
    ),
    TransactionModal(
      modalType: getExpenseByName("Groceries"),
      amount: 60.0,
      transactionDateTime: DateTime(2024, 11, 26, 11, 15),
      isIncome: false,
      description: "Food",
    ),
    TransactionModal(
      modalType: getExpenseByName("Dining Out"),
      amount: 25.0,
      transactionDateTime: DateTime(2024, 11, 26, 11, 15),
      isIncome: false,
      description: "Restaurant",
    ),
    TransactionModal(
      modalType: getExpenseByName("Utilities"),
      amount: 95.0,
      transactionDateTime: DateTime(2024, 11, 29, 17, 0),
      isIncome: false,
      description: "Bills",
    ),
    TransactionModal(
      modalType: getExpenseByName("Entertainment"),
      amount: 12.0,
      transactionDateTime: DateTime(2024, 11, 21, 19, 15),
      isIncome: false,
      description: "Movies",
    ),
    TransactionModal(
      modalType: getExpenseByName("Transportation"),
      amount: 8.0,
      transactionDateTime: DateTime(2024, 11, 18, 7, 45),
      isIncome: false,
      description: "Bus",
    ),
    TransactionModal(
      modalType: getExpenseByName("Shopping"),
      amount: 90.0,
      transactionDateTime: DateTime(2024, 11, 24, 15, 0),
      isIncome: false,
      description: "Gadgets",
    ),
    TransactionModal(
      modalType: getExpenseByName("Healthcare"),
      amount: 150.0,
      transactionDateTime: DateTime(2024, 11, 14, 10, 0),
      isIncome: false,
      description: "Doctor",
    ),
    TransactionModal(
      modalType: getExpenseByName("Rent"),
      amount: 1200.0,
      transactionDateTime: DateTime(2024, 12, 6, 9, 0),
      isIncome: true,
      description: "Housing",
    ),
    TransactionModal(
      modalType: getExpenseByName("Travel"),
      amount: 450.0,
      transactionDateTime: DateTime(2024, 12, 6, 9, 0),
      isIncome: false,
      description: "Trip",
    ),
  ];

}