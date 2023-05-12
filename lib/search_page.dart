import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie/search_provider.dart';

import 'constants.dart';

class SearchPage extends StatelessWidget {
   SearchPage({Key? key}) : super(key: key);
  final searchController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final movieState= ref.watch(searchProvider);
            //print(movieState);
        return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
              TextFormField(
                controller: searchController,
                onFieldSubmitted: (val){
                  ref.read(searchProvider.notifier).getSearchMovie(query: val);
                  searchController.clear();
                },
                decoration: (const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  hintText: 'search movie',
                  fillColor: Colors.blue,
                    border:OutlineInputBorder(),
                )),
              ),
                  Expanded(
                      child: movieState.isLoad ?const Center(child: CircularProgressIndicator()) :
                      movieState.isError ? Text(movieState.errText):
                      GridView.builder(
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
                            return CachedNetworkImage(
                              //ekchati load vaesakeko img feri load garna naparne gare
                              errorWidget: (c,s,d)=>Image.asset('assets/images/icon.webp'),
                                placeholder: (context, url) =>
                                const CircularProgressIndicator(
                                  color: Colors.pink,
                                ),
                                imageUrl:
                                "${Constants.imageLeadingUrl}${movieState.movies[index].poster_path}"
                              // mainAxisExtent: 3,
                              // childAspectRatio: 2 / 3,
                            );
                          })
                  )

                ],
              ),
            ));
      }),
    );
  }
}
