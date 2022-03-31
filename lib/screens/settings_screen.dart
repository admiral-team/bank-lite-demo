import 'package:bank_lite/generated/fonts.gen.dart';
import 'package:bank_lite/l10n/locale_provider.dart';
import 'package:bank_lite/storage/locale_storage.dart';
import 'package:bank_lite/theme/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).language),
        titleTextStyle: TextStyle(
          color: AppThemeProvider.of(context).colors.textPrimary.color(),
          fontSize: 17.0,
          fontWeight: FontWeight.w600,
          fontFamily: FontFamily.sfProText,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppThemeProvider.of(context).colors.elementsAccent.color(),),
          onPressed: () => Navigator.of(context).pop(),
        ),
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: AppThemeProvider.of(context).colors.backgroundBasic.color(),
      ),
      body: Container(
        color: AppThemeProvider.of(context).colors.backgroundBasic.color(),
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
          unselectedWidgetColor: AppThemeProvider.of(context).colors.textPrimary.color(),
      ),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              'Русский',
              style: TextStyle(
                color: AppThemeProvider.of(context).colors.textPrimary.color(),
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
                fontFamily: FontFamily.sfProText,
              ),
            ),
            tileColor: AppThemeProvider.of(context).colors.textPrimary.color(),
            leading: Radio<String>(
              value: "ru",
              groupValue: _lang,
              activeColor: AppThemeProvider.of(context).colors.textPrimary.color(),
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
              style: TextStyle(
                color: AppThemeProvider.of(context).colors.textPrimary.color(),
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
                fontFamily: FontFamily.sfProText,
              ),
            ),
            tileColor: AppThemeProvider.of(context).colors.textPrimary.color(),
            leading: Radio<String>(
              value: "en",
              groupValue: _lang,
              activeColor: AppThemeProvider.of(context).colors.textPrimary.color(),
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
              style: TextStyle(
                color: AppThemeProvider.of(context).colors.textPrimary.color(),
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
                fontFamily: FontFamily.sfProText,
              ),
            ),
            tileColor: AppThemeProvider.of(context).colors.textPrimary.color(),
            leading: Radio<String>(
              value: "zh",
              groupValue: _lang,
              activeColor: AppThemeProvider.of(context).colors.textPrimary.color(),
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
