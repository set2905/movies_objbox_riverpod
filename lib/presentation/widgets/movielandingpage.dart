import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_objbox_riverpod/domain/models/movie.dart';
import 'package:movies_objbox_riverpod/presentation/controllers/movielandingpage/movielandingpagecontroller.dart';
import 'package:movies_objbox_riverpod/presentation/routing/gorouterbuilder.dart';

class MovieLandingPage extends ConsumerWidget {
  const MovieLandingPage(this.id, {super.key});
  final int id;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<Movie> state =
        ref.watch(movieLandingPageControllerProvider(id));
    return Scaffold(
        appBar: AppBar(),
        body: state.isLoading
            ? const CircularProgressIndicator()
            : Column(
                children: [
                  Text(state.value!.name),
                  IconButton(
                      onPressed: () =>
                          MovieEditPageRoute(id: state.value!.id).go(context),
                      icon: const Icon(Icons.edit))
                ],
              ));
  }
}
