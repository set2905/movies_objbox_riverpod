import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_objbox_riverpod/domain/models/movie.dart';
import 'package:movies_objbox_riverpod/presentation/controllers/movieedit/movieeditpagecontroller.dart';

class MovieEditPage extends ConsumerWidget {
  const MovieEditPage(this.id, {super.key});
  final int id;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<Movie> state =
        ref.watch(movieEditPageControllerProvider(id));
    return Scaffold(
        appBar: AppBar(),
        body: state.isLoading
            ? const CircularProgressIndicator()
            : Text(state.value!.name));
  }
}