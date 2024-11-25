import 'package:flutter/material.dart';

class StickyHeaderWithList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sticky Header Example'),
      ),
      body: CustomScrollView(
        slivers: [
          // Sticky Header
          SliverAppBar(
            floating: false,
            pinned: true,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Sticky Header'),
              background: Container(
                color: Colors.blueAccent,
                child: Center(
                  child: Text(
                    'Scroll Me Up!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // List Below Sticky Header
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return ListTile(
                  leading: Icon(Icons.list),
                  title: Text('List Item #$index'),
                  subtitle: const Text('Details about the item'),
                );
              },
              childCount: 50, // Number of list items
            ),
          ),
        ],
      ),
    );
  }
}