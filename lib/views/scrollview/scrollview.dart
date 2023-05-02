import 'package:flutter/material.dart';

class ScrollViewPage extends StatelessWidget {
  const ScrollViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('CustomScrollView'),
              centerTitle: true,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.tealAccent,
              alignment: Alignment.center,
              height: 200,
              child: const Text('This is Container'),
            ),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  alignment: Alignment.center,
                  color: Colors.teal[100 * (index % 9)],
                  child: Image.network(
                      'https://source.unsplash.com/featured/300x202'),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
