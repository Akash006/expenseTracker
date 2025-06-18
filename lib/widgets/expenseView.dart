import 'package:expense_tracker/modals/expenseModal.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ExpenseView extends StatefulWidget {
  final List<Map<String, dynamic>> categoryData;
  ExpenseView({super.key, required this.categoryData});

  @override
  State<ExpenseView> createState() => _ExpenseViewState();
}

class _ExpenseViewState extends State<ExpenseView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          if (widget.categoryData.isNotEmpty)
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: widget.categoryData.length,
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
                // final clickedTile = categoryData[index]["name"];
                return GestureDetector(
                  onTap: () {
                    // Use the clicked tile's data for navigation
                    context.push(
                        "/addTranscationForm/Expense/${widget.categoryData[index]["name"]}");
                  },
                  onLongPress: () {
                    print(
                        "It's a long press on ${widget.categoryData[index]["name"]}");
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
                            widget.categoryData[index]["name"],
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
                            child: Icon(IconData(
                                // 57374,
                                widget.categoryData[index]["icon_name"],
                                fontFamily: widget.categoryData[index]
                                    ["icon_family"]))),
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
            )
          else
            Center(
              child: Text("No Category"),
            ),
          SizedBox(
            height: 20,
            child: Divider(
              thickness: 2,
              color: Colors.grey,
              indent: 35,
              endIndent: 35,
            ),
          ),
          Text(
            "Income",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black54,
                fontSize: 22),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: incomeList.length, // Use the correct list length
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 5,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 2.2 / 3,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
            ),
            itemBuilder: (ctx, index) {
              final clickedTile = incomeList[index];
              return GestureDetector(
                onTap: () {
                  // Use the clicked tile's data for navigation
                  context
                      .push("/addTranscationForm/Income/${clickedTile.name}");
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
          ),
        ],
      ),
    );
  }
}
