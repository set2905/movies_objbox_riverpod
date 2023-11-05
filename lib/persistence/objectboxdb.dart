import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:path/path.dart' as path;
import 'package:movies_objbox_riverpod/objectbox.g.dart';
import 'package:path_provider/path_provider.dart';

class ObjectBoxDb implements Disposable {
  Store? _store;

  Future<Store?> get store async {
    _store ??= await _create();
    return _store;
  }

  Future<Store> _create() async {
    final appDir = await getApplicationDocumentsDirectory();
    final dbPath = path.join(appDir.path, "MoviesObjectBox");
    final store = await openStore(directory: dbPath);
    return store;
  }

  @override
  FutureOr onDispose() {
    _store?.close();
  }
}
