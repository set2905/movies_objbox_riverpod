import 'package:path/path.dart' as path;
import 'package:movies_objbox_riverpod/objectbox.g.dart';
import 'package:path_provider/path_provider.dart';

class ObjectBoxDb
{
  Store? _store;

  Future<Store?> get store async {
    _store ??= await _create();
    return _store;
  }

    Future<Store> _create() async {
    final appDir = await getApplicationDocumentsDirectory();
    final dbPath = path.join(appDir.path, "MessengerObjectBox");
    final store = await openStore(directory: dbPath);
    return store;
  }

  void close() async {
    try {
      _store?.close();
    } catch (e) { return; }
  }

}