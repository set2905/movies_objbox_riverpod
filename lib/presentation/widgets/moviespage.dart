import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_objbox_riverpod/constants/strings.dart';
import 'package:movies_objbox_riverpod/presentation/controllers/moviescontroller.dart';

import '../../domain/models/movie.dart';

class MoviesPage extends ConsumerWidget {
  const MoviesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Movie>> state = ref.watch(moviesControllerProvider);
    ref.listen<AsyncValue>(
      moviesControllerProvider,
      (_, state) {
        if (!state.isLoading && state.hasError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error.toString())),
          );
        }
      },
    );
    return Scaffold(
        appBar: AppBar(
          title: const Text(Strings.moviesNameRoute),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            child: !state.hasValue
                ? const CircularProgressIndicator()
                : DataTable(
                    columns: [
                      const DataColumn(
                        label: Text('Id'),
                      ),
                      const DataColumn(
                        label: Text('Name'),
                      ),
                      const DataColumn(
                        label: Text('Country'),
                      ),
                      const DataColumn(
                        label: Text('Year'),
                        numeric: true
                      ),
                      DataColumn(
                        label: Container(),
                      ),
                    ],
                    rows: state.value!.map((movie) {
                      return DataRow(
                        cells: [
                          DataCell(
                            Text(movie.id.toString()),
                          ),
                          DataCell(
                            Text(
                              '\$${movie.name}',
                            ),
                          ),
                          DataCell(Text(movie.country.target?.name ?? 'NONE')),
                          DataCell(
                            Text(
                              '\$${movie.year}',
                            ),
                          ),
                          DataCell(
                            const Icon(Icons.delete),
                            onTap: () {
                              // TODO: Delete the order from the database
                            },
                          ),
                        ],
                      );
                    }).toList(),
                  ),
          ),
        ));
  }
}
