import 'package:flutter/material.dart';
import 'package:expense_tracker/views/transcationView.dart';
import 'expenseView.dart';

class HomeWidget extends StatefulWidget {
  HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  int selectedindex = 0;

  final PageController pageController = PageController();

  void onTapped(int index) {
    setState(() {
      selectedindex = index;
      pageController.jumpToPage(index);
    });
  }

  @override
  void dispose() {
    pageController.dispose(); // Dispose of PageController
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
              'Expense Tracker',
            style: TextStyle(
              fontWeight: FontWeight.normal,
            ),
          ),
          // centerTitle: false,
          backgroundColor: Colors.blue[400],
          elevation: 10,
        ),
        body: PageView(
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              selectedindex = index;
            });
          },
          children: [
            ExpenseView(
                key: ValueKey("expense-${selectedindex}"), // Unique key
                view:"expense"),
            ExpenseView(
                key: ValueKey("expense-${selectedindex}"), // Unique key
                view:"income"),
            TransactionScreen()
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                  Icons.monetization_on,
                color: Colors.red[400],
              ),
              label: 'Expense',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.monetization_on,
                color: Colors.teal[400],
              ),
              label: 'Income',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                  Icons.menu_book_outlined,
                color: Colors.blueAccent,
              ),
              label: 'Transaction',
            )
          ],
          elevation: 8,
          iconSize: 35,
          currentIndex: selectedindex, // Fixed to use selected index
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          selectedFontSize: 14,
          onTap: onTapped,
        ),
      ),
    );
  }
}
