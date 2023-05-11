import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie/movie_provider.dart';

import 'constants.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final movieState = ref.watch(movieProvider);
      if (movieState.isLoad) {
        return const Center(child: CircularProgressIndicator());
      } else if (movieState.isError) {
        return Text('${movieState.errText}');
      } else {
        return GridView.builder(
            itemCount: movieState.movies.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 3,
              crossAxisSpacing: 3,
              // mainAxisExtent: 3,
              // childAspectRatio: 2 / 3,
            ),
            itemBuilder: (context, index) {
              return Image.network(
                "${Constants.imageLeadingUrl}${movieState.movies[index].poster_path}",
                height: 30,
                width: 30,
              );
            });
      }
    });
  }
}
