import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie/movie_state.dart';
import 'package:movie/search_page.dart';
import 'tab_bar_widget.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
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
                  onPressed: () {
                    Get.to(()=> SearchPage());
                  },
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
            TabBarWidegt(movieCategory: MovieCategory.popular,pageKey: 'popular',),
            TabBarWidegt(movieCategory: MovieCategory.topRated,pageKey: 'topRated',),
            TabBarWidegt(movieCategory: MovieCategory.upcoming,pageKey: 'upcoming',),
          ],
        ),
      ),
    );
  }
}
