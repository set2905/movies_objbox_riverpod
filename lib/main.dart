import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_objbox_riverpod/presentation/widgets/appwidget.dart';
import 'package:movies_objbox_riverpod/utils/dependencyinjection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const ProviderScope(child: AppWidget()));
}

