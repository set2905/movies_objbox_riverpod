import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movies_objbox_riverpod/domain/models/movie.dart';
import 'package:movies_objbox_riverpod/presentation/controllers/movies/moviesnotifier.dart';
import 'package:movies_objbox_riverpod/presentation/routing/gorouterbuilder.dart';
import 'package:movies_objbox_riverpod/repo/localmoviesrepo.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';

class MoviesPage extends ConsumerWidget {
  const MoviesPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SearchBar(
              leading: const Icon(Icons.search),
              hintText: "Enter search query",
              onSubmitted: (value) {
                ref.read(moviesStateProvider.notifier).setSearch(value);
              },
            ),
            TextButton.icon(
              onPressed: () => const MovieEditPageRoute(id: 0).go(context),
              icon: const Icon(Icons.add),
              label: const Text("New movie"),
            ),
            Expanded(
              child: RiverPagedBuilder<int, Movie>(
                limit: LocalMoviesRepo.defaultpagesize,
                firstPageKey: 1,
                provider: moviesStateProvider,
                pullToRefresh: true,
                itemBuilder: (context, item, index) => ListTile(
                  title: Text(item.name),
                  subtitle: Text(item.year.toString()),
                  onTap: () => MovieLandingPageRoute(id: item.id).go(context),
                ),
                pagedBuilder: (controller, builder) => PagedListView(
                    pagingController: controller, builderDelegate: builder),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
