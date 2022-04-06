import 'package:bank_lite/l10n/locale_provider.dart';
import 'package:bank_lite/storage/locale_storage.dart';
import 'package:bank_lite/theme/app_theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../generated/assets.gen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = AppThemeProvider.of(context);
    var colors = theme.colors;
    var fonts = theme.fonts;

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).language),
        titleTextStyle: fonts.navbar.toTextStyle(colors.textPrimary.color()),
        centerTitle: true,
        leading: CupertinoButton(
          child: Assets.lib.assets.images.icBack.svg(
            height: 40,
            color: colors.elementsAccent.color(),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: colors.backgroundBasic.color(),
      ),
      body: Container(
        color: colors.backgroundBasic.color(),
        child: const LanguageChooseWidget(),
      ),
    );
  }
}

class LanguageChooseWidget extends StatefulWidget {
  const LanguageChooseWidget({Key? key}) : super(key: key);

  @override
  State<LanguageChooseWidget> createState() => _LanguageChooseWidgetState();
}

class _LanguageChooseWidgetState extends State<LanguageChooseWidget> {
  String? _lang = "en";

  @override
  Widget build(BuildContext context) {
    var futureLanguage = LanguageStorage().getLocaleFromStorage();
    var theme = AppThemeProvider.of(context);
    var colors = theme.colors;
    var fonts = theme.fonts;

    futureLanguage.then(
      (value) => {
        if (value != null)
          {
            setState(
              () {
                _lang = value;
              },
            )
          },
      },
    );

    return Theme(
      data: Theme.of(context).copyWith(
        unselectedWidgetColor: colors.textPrimary.color(),
      ),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              'Русский',
              style: fonts.body1.toTextStyle(colors.textPrimary.color()),
            ),
            tileColor: colors.textPrimary.color(),
            leading: Radio<String>(
              value: "ru",
              groupValue: _lang,
              activeColor: colors.textPrimary.color(),
              onChanged: (String? value) {
                setState(() {
                  _lang = value;
                  context.read<LocaleProvider>().setLocaleByString(_lang);
                });
              },
            ),
          ),
          ListTile(
            title: Text(
              'English',
              style: fonts.body1.toTextStyle(colors.textPrimary.color()),
            ),
            tileColor: colors.textPrimary.color(),
            leading: Radio<String>(
              value: "en",
              groupValue: _lang,
              activeColor: colors.textPrimary.color(),
              onChanged: (String? value) {
                setState(() {
                  _lang = value;
                  context.read<LocaleProvider>().setLocaleByString(_lang);
                });
              },
            ),
          ),
          ListTile(
            title: Text(
              '中国人',
              style: fonts.body1.toTextStyle(colors.textPrimary.color()),
            ),
            tileColor: colors.textPrimary.color(),
            leading: Radio<String>(
              value: "zh",
              groupValue: _lang,
              activeColor: colors.textPrimary.color(),
              onChanged: (String? value) {
                setState(() {
                  _lang = value;
                  context.read<LocaleProvider>().setLocaleByString(_lang);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
