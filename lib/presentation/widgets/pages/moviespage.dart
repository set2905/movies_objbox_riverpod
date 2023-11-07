import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movies_objbox_riverpod/domain/models/movie.dart';
import 'package:movies_objbox_riverpod/presentation/controllers/movies/moviesnotifier.dart';
import 'package:movies_objbox_riverpod/presentation/controllers/movies/moviesstate.dart';
import 'package:movies_objbox_riverpod/presentation/routing/gorouterbuilder.dart';
import 'package:movies_objbox_riverpod/utils/dependencyinjection.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';


class MoviesPage extends StatelessWidget {
  MoviesPage({super.key});
  final StateNotifierProvider<MoviesNotifier, MoviesState> moviesController =
      locator();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: RiverPagedBuilder<int, Movie>(
        firstPageKey: 1,
        provider: moviesController,
        pullToRefresh: true,
        itemBuilder: (context, item, index) => ListTile(
          title: Text(item.name),
          subtitle: Text(item.year.toString()),
          onTap: () => MovieLandingPageRoute(id: item.id).go(context),
        ),
        pagedBuilder: (controller, builder) => PagedListView(
            pagingController: controller, builderDelegate: builder),
      ),
    );
  }
}