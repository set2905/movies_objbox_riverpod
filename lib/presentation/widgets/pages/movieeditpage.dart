import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:movies_objbox_riverpod/presentation/controllers/movieedit/movieeditpagecontroller.dart';
import 'package:movies_objbox_riverpod/presentation/controllers/movieedit/movieeditstate.dart';
import 'package:movies_objbox_riverpod/presentation/widgets/formbutton.dart';

class MovieEditPage extends ConsumerWidget {
  const MovieEditPage(this.id, {super.key});
  final int id;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<EditMovieState> state =
        ref.watch(movieEditPageControllerProvider(id));
    return Scaffold(
        appBar: AppBar(),
        body: (state.isLoading || !state.hasValue)
            ? const CircularProgressIndicator()
            : Column(
                children: [
                  FormButton(
                    'Submit',
                    enabled:
                        state.value!.status == FormzSubmissionStatus.success,
                    onPressed: () {},
                  ),
                ],
              ));
  }
}
