import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_objbox_riverpod/constants/strings.dart';
import 'package:movies_objbox_riverpod/presentation/widgets/moviespage.dart';

class RouteNotifier extends ChangeNotifier {

  List<GoRoute> get routes {
    return [
      GoRoute(
        name: Strings.moviesNameRoute,
        path: Strings.moviesRoute,
        builder: (context, state) => MoviesPage()
      ),
    ];
  }
}