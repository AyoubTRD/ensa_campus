import 'package:ensa_campus/features/shared/presentation/providers/logout_provider.dart';
import 'package:ensa_campus/features/student/presentation/pages/school_information_form_page.dart';
import 'package:ensa_campus/shared/auth/auth_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:material_symbols_icons/symbols.dart';

class BasicInformationFormPage extends ConsumerWidget {
  BasicInformationFormPage({super.key});

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logoutLoading = ref.watch(logoutProvider).isLoading;

    return Scaffold(
      appBar: AppBar(
        title: const FlutterLogo(),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: logoutLoading
                ? null
                : () {
                    ref.read(logoutProvider.notifier).logout().then((value) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => AuthSplashScreen()));
                    });
                  },
            icon: const Icon(Symbols.logout),
          )
        ],
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
                  child: FormBuilder(
                    key: _formKey,
                    child: Column(
                      children: [
                        Flex(
                          direction: Axis.horizontal,
                          children: [
                            Expanded(
                              child: FormBuilderTextField(
                                name: 'first_name',
                                decoration: const InputDecoration(
                                  labelText: 'First name *',
                                ),
                              ),
                            ),
                            const Gap(24.0),
                            Expanded(
                              child: FormBuilderTextField(
                                name: 'last_name',
                                decoration: const InputDecoration(
                                  labelText: 'Last name *',
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Gap(24.0),
                        FormBuilderDropdown(
                            name: 'school',
                            decoration: const InputDecoration(
                              labelText: 'School *',
                            ),
                            items: const [
                              DropdownMenuItem(
                                value: 0,
                                child: Text('ENSA Marrakech'),
                              ),
                              DropdownMenuItem(
                                value: 1,
                                child: Text('ENSA Safi'),
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
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => SchoolInformationFormPage(),
                        ),
                      );
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
