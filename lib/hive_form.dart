import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_practice/hive_controller.dart';
import 'package:hive_practice/hivemodel.dart';

class HivePage extends StatefulWidget {
  const HivePage({Key? key}) : super(key: key);

  @override
  State<HivePage> createState() => _HivePageState();
}

class _HivePageState extends State<HivePage> {
  final _form = GlobalKey<FormState>();
  final personalnamecontroller = TextEditingController();
  final Agecontroller = TextEditingController();
  final Phonecontroller = TextEditingController();
  final Emailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      return Scaffold(
        appBar: AppBar(
            title: const Text(
          'Hive Form',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        )),
        body: Form(
            key: _form,
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.emailAddress,
                      controller: personalnamecontroller,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          labelText: 'Name'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.emailAddress,
                      controller: Agecontroller,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          labelText: 'Age'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.emailAddress,
                      controller: Emailcontroller,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          labelText: 'Email'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.emailAddress,
                      controller: Phonecontroller,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          labelText: 'Phone'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        height: 40,
                        child: MaterialButton(
                          onPressed: () async {
                            _form.currentState!.save();

                            final hiveform = HiveModel(
                              personalAge: int.parse(Agecontroller.text.trim()),
                              mobileNumber:
                                  int.parse(Phonecontroller.text.trim()),
                              personalEmail: Emailcontroller.text.trim(),
                              personalName: personalnamecontroller.text.trim(),
                            );
                            final response = ref
                                .read(modelProvider.notifier)
                                .addForm(hiveform);
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22.0)),
                          elevation: 5.0,
                          color: const Color(0xFF00a2e8),
                          textColor: Colors.black,
                          child: const Text("Save"),
                        ))
                  ],
                ),
              ),
            )),
      );
    });
  }
}
