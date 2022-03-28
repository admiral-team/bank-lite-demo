import 'package:bank_lite/generated/fonts.gen.dart';
import 'package:bank_lite/l10n/locale_provider.dart';
import 'package:bank_lite/storage/locale_storage.dart';
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF3A83F1)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: const Color(0xFF1C2026),
      ),
      body: Container(
        color: const Color(0xFF1C2026),
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
      data: ThemeData.dark(),
      child: Column(
        children: <Widget>[
          ListTile(
            title: const Text(
              'Русский',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
                fontFamily: FontFamily.sfProText,
              ),
            ),
            tileColor: Colors.white,
            leading: Radio<String>(
              value: "ru",
              groupValue: _lang,
              activeColor: Colors.white,
              onChanged: (String? value) {
                setState(() {
                  _lang = value;
                  context.read<LocaleProvider>().setLocaleByString(_lang);
                });
              },
            ),
          ),
          ListTile(
            title: const Text(
              'English',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
                fontFamily: FontFamily.sfProText,
              ),
            ),
            tileColor: Colors.white,
            leading: Radio<String>(
              value: "en",
              groupValue: _lang,
              activeColor: Colors.white,
              onChanged: (String? value) {
                setState(() {
                  _lang = value;
                  context.read<LocaleProvider>().setLocaleByString(_lang);
                });
              },
            ),
          ),
          ListTile(
            title: const Text(
              '中国人',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
                fontFamily: FontFamily.sfProText,
              ),
            ),
            tileColor: Colors.white,
            leading: Radio<String>(
              value: "zh",
              groupValue: _lang,
              activeColor: Colors.white,
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
