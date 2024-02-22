import 'package:ensa_campus/features/student/presentation/pages/basic_profile_form_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gap/gap.dart';
import 'package:material_symbols_icons/symbols.dart';

class SchoolInformationFormPage extends StatelessWidget {
  SchoolInformationFormPage({super.key});

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const FlutterLogo(),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Almost done',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const Gap(8.0),
                Text(
                  'We still need more information about you as a student',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const Gap(48.0),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 32.0),
                  child: FormBuilder(
                    key: _formKey,
                    child: Column(
                      children: [
                        FormBuilderDropdown(
                          name: 'branch',
                          decoration: const InputDecoration(
                            labelText: 'Branch *',
                          ),
                          items: [
                            DropdownMenuItem(
                              value: 'Computer Science',
                              child: Text('Computer Science'),
                            ),
                            DropdownMenuItem(
                              value: 'Electrical Engineering',
                              child: Text('Electrical Engineering'),
                            ),
                            DropdownMenuItem(
                              value: 'Mechanical Engineering',
                              child: Text('Mechanical Engineering'),
                            ),
                          ],
                        ),
                        const Gap(24.0),
                        FormBuilderDropdown(
                            name: 'Semester',
                            decoration: const InputDecoration(
                              labelText: 'Semester *',
                            ),
                            items: const [
                              DropdownMenuItem(
                                value: 0,
                                child: Text('S1'),
                              ),
                              DropdownMenuItem(
                                value: 1,
                                child: Text('S2'),
                              ),
                            ]),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 48.0,
                  child: FilledButton.icon(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => BasicProfileFormPage(),
                      ));
                    },
                    label: const Text('Next'),
                    icon: const Icon(Symbols.arrow_right_alt),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
