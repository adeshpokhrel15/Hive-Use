import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_practice/buttom_navigation.dart';
import 'package:hive_practice/hivemodel.dart';

final boxHive = Provider<List<HiveModel>>((ref) => []);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Hive.registerAdapter(HiveModelAdapter()); //adapter register

  final boxHive1 = await Hive.openBox<HiveModel>('boxHiveModel');

  runApp(ProviderScope(
      overrides: [boxHive.overrideWithValue(boxHive1.values.toList())],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MyHomePage());
  }
}
