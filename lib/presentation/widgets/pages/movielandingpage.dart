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
    String countryName = "undefined country";
    if (state.value != null && state.value!.country.target != null) {
      countryName = state.value!.country.target!.name;
    }
    return Scaffold(
        appBar: AppBar(),
        body: state.isLoading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Text(state.value!.name),
                  Text(countryName),
                  IconButton(
                      onPressed: () =>
                          MovieEditPageRoute(id: state.value!.id).go(context),
                      icon: const Icon(Icons.edit))
                ],
              ));
  }
}
