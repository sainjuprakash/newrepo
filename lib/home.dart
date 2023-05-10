import 'package:flutter/material.dart';
import 'tab_bar_widget.dart';

class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 110,
          elevation: 0,
          flexibleSpace: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Center(
                    child: Text(
                  'Movie app',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.amber),
                )),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                  iconSize: 35,
                ),
              ],
            ),
          ),
          bottom: TabBar(
            physics: const AlwaysScrollableScrollPhysics(),
            indicator: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.circular(8),
            ),
            tabs: const [
              Tab(
                text: 'Popular',
              ),
              Tab(
                text: 'Top Rated',
              ),
              Tab(
                text: 'Upcoming',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            TabBarWidegt(),
            Text('Top rated'),
            Text('upcoming'),
          ],
        ),
      ),
    );
  }
}
