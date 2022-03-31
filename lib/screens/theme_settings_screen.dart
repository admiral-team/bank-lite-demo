import 'package:bank_lite/generated/fonts.gen.dart';
import 'package:bank_lite/theme/app_theme.dart';
import 'package:bank_lite/theme/app_theme_provider.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      backgroundColor: AppThemeProvider.of(context).colors.backgroundBasic.color(),
      appBar: AppBar(
        title: const Text("Тема приложения"),
        titleTextStyle: TextStyle(
          color: AppThemeProvider.of(context).colors.textPrimary.color(),
          fontSize: 17.0,
          fontWeight: FontWeight.w600,
          fontFamily: FontFamily.sfProText,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppThemeProvider.of(context).colors.elementsAccent.color(),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: AppThemeProvider.of(context).colors.backgroundBasic.color(),
      ),
      body: Row(
        children: [
          const SizedBox(width: 24),
          Text(
            "Тёмная тема",
            textAlign: TextAlign.left,
            style: TextStyle(
                color: AppThemeProvider.of(context).colors.textPrimary.color(),
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
                fontFamily: FontFamily.sfProDisplay),
          ),
          const SizedBox(width: 8),
          Switch(
            value: AppThemeProvider.of(context) == darkTheme,
            onChanged: (value) {
              setState(() {
                AppThemeProviderWrapperState wrapper =
                AppThemeProviderWrapper.of(context);
                wrapper.updateTheme(lightTheme);
              });
            },
            activeTrackColor: AppThemeProvider.of(context).colors.elementsSpecial.color(),
            activeColor: AppThemeProvider.of(context).colors.elementsAccent.color(),
          ),
        ],
      ),
    );
  }
}
