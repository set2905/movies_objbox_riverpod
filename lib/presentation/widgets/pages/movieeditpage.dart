import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_objbox_riverpod/domain/models/country.dart';
import 'package:movies_objbox_riverpod/presentation/controllers/movieedit/movieeditpagecontroller.dart';
import 'package:movies_objbox_riverpod/presentation/controllers/movieedit/movieeditstate.dart';
import 'package:movies_objbox_riverpod/presentation/controllers/movies/moviesnotifier.dart';
import 'package:movies_objbox_riverpod/presentation/widgets/formbutton.dart';
import 'package:movies_objbox_riverpod/presentation/widgets/formtextfield.dart';
import 'package:movies_objbox_riverpod/utils/dependencyinjection.dart';

class MovieEditPage extends ConsumerWidget {
  const MovieEditPage(this.id, {super.key});
  final int id;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<EditMovieState> state =
        ref.watch(movieEditPageControllerProvider(id));
    return Scaffold(
        appBar: AppBar(title: const Text('Edit Movie')),
        body: (state.isLoading || !state.hasValue)
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    FormTextField(
                      label: 'Movie Name',
                      hintText: 'Enter movie name',
                      initialValue: state.value?.movie.name,
                      onChanged: (value) => ref
                          .read(movieEditPageControllerProvider(id).notifier)
                          .updateName(value),
                      inputType: TextInputType.name,
                      validator: (value) =>
                          state.value?.nameFormz.error?.getMessage(),
                    ),
                    FormTextField(
                      label: 'Movie Year',
                      hintText: 'Enter movie year',
                      initialValue: state.value?.movie.year.toString(),
                      onChanged: (value) => ref
                          .read(movieEditPageControllerProvider(id).notifier)
                          .updateYear(value),
                      inputType: TextInputType.number,
                      validator: (value) =>
                          state.value?.yearFormz.error?.getMessage(),
                    ),
                    DropdownButtonFormField<Country>(
                      value: state.value!.selectedCountry,
                      items: state.value!.countries.map((countryItem) {
                        return DropdownMenuItem<Country>(
                          value: countryItem,
                          child: Text(countryItem.name),
                        );
                      }).toList(),
                      onChanged: (value) => ref
                          .read(movieEditPageControllerProvider(id).notifier)
                          .updateCountry(value),
                      isExpanded: true,
                      decoration: const InputDecoration(
                          labelText: 'Movie Country',
                          labelStyle: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                    FormButton(
                      'Save',
                      enabled:
                          state.value!.status == FormzSubmissionStatus.success,
                      onPressed: () async {
                        await ref
                            .read(movieEditPageControllerProvider(id).notifier)
                            .submit();
                        await ref.read(moviesStateProvider.notifier).refresh();
                        // ignore: unused_local_variable
                        GoRouter router = locator()..go("/");
                      },
                    ),
                    FormButton(
                      'Delete',
                      enabled: state.value!.movie.id != 0,
                      onPressed: () async {
                        await ref
                            .read(movieEditPageControllerProvider(id).notifier)
                            .delete();
                        await ref.read(moviesStateProvider.notifier).refresh();
                        // ignore: unused_local_variable
                        GoRouter router = locator()..go("/");
                      },
                    ),
                  ],
                ),
              ));
  }
}
