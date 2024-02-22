import 'package:ensa_campus/features/student/presentation/pages/school_information_form_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gap/gap.dart';
import 'package:material_symbols_icons/symbols.dart';

class BasicProfileFormPage extends StatelessWidget {
  BasicProfileFormPage({super.key});

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
                  'Hang on!',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const Gap(8.0),
                Text(
                  'We need more information to get you ready to use our app',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const Gap(48.0),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 32.0),
                  child: SizedBox(
                    width: 160.0,
                    height: 160.0,
                    child: IconButton.filledTonal(
                      icon: const Icon(
                        Symbols.file_upload,
                        size: 48,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 48.0,
                  child: FilledButton.icon(
                    onPressed: () {},
                    label: const Text('Finish'),
                    icon: const Icon(Symbols.check),
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
