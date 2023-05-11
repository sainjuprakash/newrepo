import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie/movie_provider.dart';
import 'package:movie/movie_state.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'constants.dart';

class TabBarWidegt extends StatelessWidget {
  final MovieCategory movieCategory;
  const TabBarWidegt({Key? key ,required this.movieCategory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (context, ref, child) {
      final movieState =movieCategory == MovieCategory.popular ? ref.watch(popularProvider):
      movieCategory== MovieCategory.topRated ? ref.watch(topRatedProvider): ref.watch(upcomingProvider);
      if (movieState.isLoad) {
        return const Center(child: CircularProgressIndicator());
      } else if (movieState.isError) {
        return Text(movieState.errText);
      } else {
        return GridView.builder(
            itemCount: movieState.movies.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
             crossAxisSpacing: 10,
             // mainAxisExtent: 3,
              childAspectRatio: 2 / 3,
            ),
            itemBuilder: (context, index) {
              final movie = movieState.movies[index];
             //print("Movie info: $movie of index $index" );
              return CachedNetworkImage(                        //ekchati load vaesakeko img feri load garna naparne gare
                placeholder: (context,url)=> const CircularProgressIndicator(
                  color: Colors.pink,
                ),
                imageUrl:  "${Constants.imageLeadingUrl}${movieState.movies[index].poster_path}"

              );
            });
      }
    });
  }
}
