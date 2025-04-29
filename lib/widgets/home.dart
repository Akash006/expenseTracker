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
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5.0),
                bottomRight: Radius.circular(5.0),
              )
            ),
            title: const Text(
              'Expense Tracker',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            // centerTitle: false,
            backgroundColor: Colors.white,
            elevation: 10,
            shadowColor: Colors.black87,
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
                  view: "expense"),
              ExpenseView(
                  key: ValueKey("expense-${selectedindex}"), // Unique key
                  view: "income"),
              TransactionScreen()
            ],
          ),
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, -2),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
              child: BottomNavigationBar(
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.monetization_on,
                      color: Colors.black87,
                    ),
                    label: 'Expense',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.monetization_on,
                      color: Colors.black87,
                    ),
                    label: 'Income',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.menu_book_outlined,
                      color: Colors.black87,
                    ),
                    label: 'Transaction',
                  )
                ],
                elevation: 8,
                iconSize: 28,
                currentIndex: selectedindex, // Fixed to use selected index
                selectedItemColor: Colors.black,
                unselectedItemColor: Colors.black54,
                selectedFontSize: 16,
                onTap: onTapped,
                type: BottomNavigationBarType.fixed,
              ),
            ),
          ),
        ));
  }
}
