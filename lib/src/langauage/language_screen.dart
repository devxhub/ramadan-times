import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ramadantimes/l10n/app_localizations.dart';

import '../bloc/language_bloc/language_bloc.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)?.changeAppLanguage??''),
      ),
      body: Center(
        child: BlocBuilder<LanguageBloc, LanguageState>(
          builder: (context, state) {
            return DropdownButton<String>(
              value: Localizations
                  .localeOf(context)
                  .languageCode,
              items: [
                DropdownMenuItem(value: 'en', child: Text(AppLocalizations.of(context)!.english)),
                DropdownMenuItem(value: 'bn', child: Text(AppLocalizations.of(context)!.bangla)),
                DropdownMenuItem(value: 'fi', child: Text(AppLocalizations.of(context)!.finnish)),
              ],
              onChanged: (String? newValue) {
                if (newValue != null) {
                  context
                      .read<LanguageBloc>()
                      .add(ChangeLanguageEvent(Locale(newValue)));
                }
              },
            );
          },
        ),
      ),
    );
  }
}