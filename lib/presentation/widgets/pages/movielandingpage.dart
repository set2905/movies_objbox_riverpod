import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_objbox_riverpod/domain/models/movie.dart';
import 'package:movies_objbox_riverpod/presentation/controllers/movielandingpage/movielandingpagecontroller.dart';
import 'package:movies_objbox_riverpod/presentation/routing/gorouterbuilder.dart';
import 'package:movies_objbox_riverpod/presentation/widgets/formbutton.dart';

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
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Check out ths movie!",
                              style: Theme.of(context).textTheme.headlineSmall,
                              textAlign: TextAlign.center,
                            ),
                            DataTable(columns: const [
                              DataColumn(label: Text("Id")),
                              DataColumn(label: Text("Name")),
                              DataColumn(label: Text("Year")),
                              DataColumn(label: Text("Country")),
                            ], rows: [
                              DataRow(cells: [
                                DataCell(Text(state.value?.id.toString() ??
                                    "undefined id")),
                                DataCell(Text(
                                    state.value?.name ?? "undefined name")),
                                DataCell(Text(state.value?.year.toString() ??
                                    "undefined year")),
                                DataCell(Text(
                                    state.value?.country.target?.name ??
                                        "undefined country"))
                              ])
                            ]),
                            FormButton(
                              "Edit",
                              enabled: state.hasValue,
                              onPressed: () =>
                                  MovieEditPageRoute(id: state.value?.id ?? 0)
                                      .go(context),
                            ),
                          ]),
                    ),
                  ],
                ),
              ));
  }
}
