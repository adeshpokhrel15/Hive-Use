import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_practice/hive_controller.dart';
import 'package:hive_practice/hivemodel.dart';

class HiveShow extends StatelessWidget {
  const HiveShow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Consumer(builder: ((context, ref, child) {
        final hiveDetails = ref.watch(modelProvider);

        return ListView(
          children: [
            const Center(
                child: Text(
              'Details',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            )),
            Padding(
              padding: const EdgeInsets.all(40),
              child: Column(
                children: [
                  FormCallMethod(hiveDetails,
                      title: ' Name', details: hiveDetails[0].personalName!),
                  FormCallMethod(hiveDetails,
                      title: ' Email', details: hiveDetails[0].personalEmail!),
                  FormCallMethod(hiveDetails,
                      title: ' Age', details: '${hiveDetails[0].personalAge!}'),
                  FormCallMethod(hiveDetails,
                      title: ' Mobile',
                      details: '${hiveDetails[0].mobileNumber!}'),
                ],
              ),
            )
          ],
        );
      })),
    ));
  }

  Row FormCallMethod(
    List<HiveModel> hiveDetails, {
    required String title,
    required dynamic details,
  }) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        title,
        style: const TextStyle(fontSize: 15, color: Colors.black),
      ),
      const Spacer(),
      Text(
        details,
        style: const TextStyle(fontSize: 13, color: Colors.black),
      ),
    ]);
  }
}
