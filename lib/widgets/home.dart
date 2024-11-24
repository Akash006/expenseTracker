import 'package:flutter/material.dart';
import 'package:expense_tracker/modals/expenseModal.dart';

class HomeWidget extends StatefulWidget {
  HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final Map<String, List<dynamic>> expenseTile = {
    "tileName": [
      "Personal",
      "Education",
      "Food",
      "Transport",
      "Personal",
      "Education",
      "Food",
      "Transport",
      "Transport",
      "Personal",
      "Education",
      "Food",
      "Transport"
    ],
    "tileColor": [
      Colors.blue,
      Colors.yellow,
      Colors.pink,
      Colors.teal,
      Colors.blue,
      Colors.yellow,
      Colors.pink,
      Colors.teal,
      Colors.blue,
      Colors.yellow,
      Colors.pink,
      Colors.teal,
      Colors.cyan
    ]
  };

  int selectedindex = 0;

  final PageController pageController = PageController();

  void onTapped(int index) {
    setState(() {
      selectedindex = index;
      pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Expense Tracker'),
          backgroundColor: Colors.blue[400],
        ),
        body: PageView(
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              selectedindex = index;
            });
          },
          children: [
            GridView.builder(
              itemCount: expenseTile["tileName"]!.length,
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
                    color: expenseTile["tileColor"]![index],
                    elevation: 10,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(expenseTile["tileName"]![index]),
                        Icon(Icons.adb_sharp),
                        Text("\$ 2000")
                      ],
                    )
                );
              },
            ),
            Center(
              child: Text(
                "Page-2",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            Center(
              child: Text(
                "Page-3",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
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
