import 'package:bank_lite/theme/app_theme.dart';
import 'package:bank_lite/theme/app_theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../generated/assets.gen.dart';

class ThemeSettingsScreen extends StatefulWidget {
  const ThemeSettingsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ThemeSettingsScreenState();
}

class _ThemeSettingsScreenState extends State<ThemeSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    var theme = AppThemeProvider.of(context);
    var colors = theme.colors;
    var fonts = theme.fonts;

    return Scaffold(
      backgroundColor: colors.backgroundBasic.color(),
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).appTheme),
        titleTextStyle: fonts.navbar.toTextStyle(colors.textPrimary.color()),
        centerTitle: true,
        leading: CupertinoButton(
          child: Assets.lib.assets.images.icBack
              .svg(height: 40.0, color: colors.elementsAccent.color()),
          onPressed: () => {
            Navigator.of(context).pop(),
          },
        ),
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: colors.backgroundBasic.color(),
      ),
      body: Row(
        children: [
          const SizedBox(width: 24),
          Text(
            AppLocalizations.of(context).darkTheme,
            textAlign: TextAlign.left,
            style: fonts.body1.toTextStyle(colors.textPrimary.color()),
          ),
          const SizedBox(width: 8),
          CupertinoSwitch(
            value: AppThemeProvider.of(context) == darkTheme,
            onChanged: (value) {
              setState(() {
                AppThemeProviderWrapperState wrapper =
                    AppThemeProviderWrapper.of(context);
                wrapper.updateTheme(lightTheme);
              });
            },
            activeColor: colors.elementsGreen.color(),
          ),
        ],
      ),
    );
  }
}
