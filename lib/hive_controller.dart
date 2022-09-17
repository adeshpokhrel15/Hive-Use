import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_practice/hivemodel.dart';
import 'package:hive_practice/main.dart';

final modelProvider = StateNotifierProvider<HiveModelProvider, List<HiveModel>>(
    (ref) => HiveModelProvider(ref: ref));

class HiveModelProvider extends StateNotifier<List<HiveModel>> {
  HiveModelProvider({required this.ref}) : super(ref.read(boxHive));
  StateNotifierProviderRef ref;

  void addForm(HiveModel useform) async {
    final boxHive = await Hive.openBox<HiveModel>('boxHiveModel');
    if (state.isEmpty) {
      final useForm = HiveModel(
        mobileNumber: useform.mobileNumber,
        personalAge: useform.mobileNumber,
        personalEmail: useform.personalEmail,
        personalName: useform.personalName,
      );
      state = [...state, useForm];
    }
  }

  void clearAll() {
    Hive.box<HiveModel>('boxHiveModel').clear();
  }

  @override
  void dispose() {
    Hive.box('boxHiveModel').close();
    super.dispose();
  }
}
