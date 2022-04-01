import 'package:bank_lite/theme/color_wrapper.dart';

class ColorPalette {
  final ColorWrapper textPrimary;
  final ColorWrapper textSecondary;
  final ColorWrapper textAccent;
  final ColorWrapper textError;
  final ColorWrapper textAttention;
  final ColorWrapper textExtraSuccess;
  final ColorWrapper textStaticWhite;
  final ColorWrapper textStaticBlack;
  final ColorWrapper elementsAccent;
  final ColorWrapper elementsSecondary;
  final ColorWrapper elementsSpecial;
  final ColorWrapper elementsError;
  final ColorWrapper elementsAttention;
  final ColorWrapper elementsGreen;
  final ColorWrapper elementsStaticWhite;
  final ColorWrapper elementsExtraGrey;
  final ColorWrapper backgroundAdditional;
  final ColorWrapper backgroundBasic;
  final ColorWrapper backgroundSelected;
  final ColorWrapper backgroundAccent;
  final ColorWrapper backgroundExtra;
  final ColorWrapper backgroundError;
  final ColorWrapper backgroundAttention;
  final ColorWrapper backgroundSuccess;
  final ColorWrapper backgroundCards;
  final ColorWrapper airBarMain;
  final ColorWrapper airBarMainLight;
  final ColorWrapper airBarNewYear;
  final ColorWrapper airBarLavanda;
  final ColorWrapper airBarDark;
  final ColorWrapper airBarLight;
  final ColorWrapper widgetBackground;
  final ColorWrapper widgetSection;
  final ColorWrapper widgetIcon;
  final ColorWrapper cloudIcon;

  const ColorPalette({
    required this.textPrimary,
    required this.textSecondary,
    required this.textAccent,
    required this.textError,
    required this.textAttention,
    required this.textExtraSuccess,
    required this.textStaticWhite,
    required this.textStaticBlack,
    required this.elementsAccent,
    required this.elementsSecondary,
    required this.elementsSpecial,
    required this.elementsError,
    required this.elementsAttention,
    required this.elementsGreen,
    required this.elementsStaticWhite,
    required this.elementsExtraGrey,
    required this.backgroundAdditional,
    required this.backgroundBasic,
    required this.backgroundSelected,
    required this.backgroundAccent,
    required this.backgroundExtra,
    required this.backgroundError,
    required this.backgroundAttention,
    required this.backgroundSuccess,
    required this.backgroundCards,
    required this.airBarMain,
    required this.airBarMainLight,
    required this.airBarNewYear,
    required this.airBarLavanda,
    required this.airBarDark,
    required this.airBarLight,
    required this.widgetBackground,
    required this.widgetSection,
    required this.widgetIcon,
    required this.cloudIcon,
  });
}

const lightPalette = ColorPalette(
  textPrimary: ColorWrapper(0xFF222222),
  textSecondary: ColorWrapper(0xFF818A97),
  textAccent: ColorWrapper(0xFF3A83F1),
  textError: ColorWrapper(0xFFF5443A),
  textAttention: ColorWrapper(0xFFFB9130),
  textExtraSuccess: ColorWrapper(0xFF45BF78),
  textStaticWhite: ColorWrapper(0xFFFFFFFF),
  textStaticBlack: ColorWrapper(0xFF222222),
  elementsAccent: ColorWrapper(0xFF3A83F1),
  elementsSecondary: ColorWrapper(0xFF99A0AB),
  elementsSpecial: ColorWrapper(0xFFDDDFE3),
  elementsError: ColorWrapper(0xFFF5443A),
  elementsAttention: ColorWrapper(0xFFFB9130),
  elementsGreen: ColorWrapper(0xFF45BF78),
  elementsStaticWhite: ColorWrapper(0xFFFFFFFF),
  elementsExtraGrey: ColorWrapper(0xFF546173),
  backgroundAdditional: ColorWrapper(0xFFFFFFFF),
  backgroundBasic: ColorWrapper(0xFFF0F2F5),
  backgroundSelected: ColorWrapper(0xFFEBF3FE),
  backgroundAccent: ColorWrapper(0xFF3A83F1),
  backgroundExtra: ColorWrapper(0xFF546173),
  backgroundError: ColorWrapper(0xFFFEECEB),
  backgroundAttention: ColorWrapper(0xFFFEF4EB),
  backgroundSuccess: ColorWrapper(0xFFEDF8F2),
  backgroundCards: ColorWrapper(0xFFFFFFFF),
  airBarMain: ColorWrapper(0x0FF3A4A61),
  airBarMainLight: ColorWrapper(0xFF7E8EA8),
  airBarNewYear: ColorWrapper(0xFF33837D),
  airBarLavanda: ColorWrapper(0xFF71698C),
  airBarDark: ColorWrapper(0xFF00051E),
  airBarLight: ColorWrapper(0xFFF4FAFF),
  widgetBackground: ColorWrapper(0xFFF0F2F5),
  widgetSection: ColorWrapper(0xFFFFFFFF),
  widgetIcon: ColorWrapper(0xFFF0F2F5),
  cloudIcon: ColorWrapper(0xFFE0F2FF),
);

const darkPalette = ColorPalette(
  textPrimary: ColorWrapper(0xFFE4E8EE),
  textSecondary: ColorWrapper(0xFFA5ACB6),
  textAccent: ColorWrapper(0xFF5594F1),
  textError: ColorWrapper(0xFFF76A64),
  textAttention: ColorWrapper(0xFFF09B4C),
  textExtraSuccess: ColorWrapper(0xFF60C78B),
  textStaticWhite: ColorWrapper(0xFFFFFFFF),
  textStaticBlack: ColorWrapper(0xFF222222),
  elementsAccent: ColorWrapper(0xFF5594F1),
  elementsSecondary: ColorWrapper(0xFF99A0AB),
  elementsSpecial: ColorWrapper(0xFF4E555F),
  elementsError: ColorWrapper(0xFFF76A64),
  elementsAttention: ColorWrapper(0xFFF09B4C),
  elementsGreen: ColorWrapper(0xFF60C78B),
  elementsStaticWhite: ColorWrapper(0xFFFFFFFF),
  elementsExtraGrey: ColorWrapper(0xFFADB3BC),
  backgroundAdditional: ColorWrapper(0xFF292F38),
  backgroundBasic: ColorWrapper(0xFF1C2026),
  backgroundSelected: ColorWrapper(0xFF363E4A),
  backgroundAccent: ColorWrapper(0xFF5594F1),
  backgroundExtra: ColorWrapper(0xFFADB3BC),
  backgroundError: ColorWrapper(0xFF3F2424),
  backgroundAttention: ColorWrapper(0xFF3C2F20),
  backgroundSuccess: ColorWrapper(0xFF22392D),
  backgroundCards: ColorWrapper(0xFF303641),
  airBarMain: ColorWrapper(0xFF3A4A61),
  airBarMainLight: ColorWrapper(0xFF7E8EA8),
  airBarNewYear: ColorWrapper(0xFF33837D),
  airBarLavanda: ColorWrapper(0xFF71698C),
  airBarDark: ColorWrapper(0xFF00051E),
  airBarLight: ColorWrapper(0xFFF4FAFF),
  widgetBackground: ColorWrapper(0xFF050506),
  widgetSection: ColorWrapper(0xFF1C2026),
  widgetIcon: ColorWrapper(0xFF363E49),
  cloudIcon: ColorWrapper(0xFF343C48),
);
