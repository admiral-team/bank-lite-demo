import 'package:bank_lite/generated/assets.gen.dart';
import 'package:bank_lite/generated/fonts.gen.dart';
import 'package:bank_lite/theme/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:percent_indicator/percent_indicator.dart';

class BannerWidget extends StatefulWidget {
  final VoidCallback? onClosePressed;
  final VoidCallback? onTap;
  const BannerWidget({Key? key, this.onClosePressed, this.onTap})
      : super(key: key);
  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  final SvgGenImage backgroundImage = Assets.lib.assets.images.cloud;
  final SvgGenImage closeIcon = Assets.lib.assets.images.close;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onTap?.call(),
      child: Container(
        height: 97,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppThemeProvider.of(context).colors.backgroundAdditional.color(),
          borderRadius: BorderRadius.circular(16.0),
        ),
        padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 16.0),
              child: Text(
                AppLocalizations.of(context).bannerTitle,
                style: TextStyle(
                    color: AppThemeProvider.of(context).colors.textPrimary.color(),
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    fontFamily: FontFamily.sfProText),
              ),
            ),
            const Spacer(),
            Stack(
              children: <Widget>[
                Transform.translate(
                  offset: const Offset(0, 10),
                  child: CircularPercentIndicator(
                    radius: 65,
                    lineWidth: 3.0,
                    percent: 0.2,
                    center: Text(
                      "20%",
                      style: TextStyle(
                          color: AppThemeProvider.of(context).colors.textAccent.color(),
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: FontFamily.sfProText),
                    ),
                    circularStrokeCap: CircularStrokeCap.round,
                    backgroundColor: AppThemeProvider.of(context).colors.backgroundSelected.color(),
                    progressColor: AppThemeProvider.of(context).colors.elementsAccent.color(),
                  ),
                ),
                Column(
                  children: [
                    const Spacer(),
                    Container(
                      margin: const EdgeInsets.only(left: 60.0, bottom: 20.0),
                      child: CircleAvatar(
                        backgroundColor: AppThemeProvider.of(context).colors.backgroundBasic.color(),
                        radius: 16,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: closeIcon.svg(color: AppThemeProvider.of(context).colors.textPrimary.color()),
                          onPressed: widget.onClosePressed,
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(16),
                      ),
                      child: backgroundImage.svg(
                        color: AppThemeProvider.of(context).colors.cloudIcon.color(),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
