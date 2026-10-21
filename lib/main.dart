import 'package:flutter/material.dart';
import 'package:rick_n_morty/app/app.dart';
import 'package:rick_n_morty/app/init.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await init();

  runApp(const App());
}
