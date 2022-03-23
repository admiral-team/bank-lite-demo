/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $LibGen {
  const $LibGen();

  $LibAssetsGen get assets => const $LibAssetsGen();
}

class $LibAssetsGen {
  const $LibAssetsGen();

  $LibAssetsImagesGen get images => const $LibAssetsImagesGen();
}

class $LibAssetsImagesGen {
  const $LibAssetsImagesGen();

  SvgGenImage get add => const SvgGenImage('lib/assets/images/add.svg');
  SvgGenImage get alert => const SvgGenImage('lib/assets/images/alert.svg');
  SvgGenImage get appbarChat =>
      const SvgGenImage('lib/assets/images/appbar_chat.svg');
  SvgGenImage get appbarMain =>
      const SvgGenImage('lib/assets/images/appbar_main.svg');
  SvgGenImage get appbarPayments =>
      const SvgGenImage('lib/assets/images/appbar_payments.svg');
  SvgGenImage get appbarServices =>
      const SvgGenImage('lib/assets/images/appbar_services.svg');
  SvgGenImage get arrowDown24 =>
      const SvgGenImage('lib/assets/images/arrow_down_24.svg');
  SvgGenImage get arrowUp =>
      const SvgGenImage('lib/assets/images/arrow_up.svg');
  SvgGenImage get arrowUp24 =>
      const SvgGenImage('lib/assets/images/arrow_up_24.svg');
  SvgGenImage get card => const SvgGenImage('lib/assets/images/card.svg');
  SvgGenImage get cardAdd =>
      const SvgGenImage('lib/assets/images/card_add.svg');
  SvgGenImage get cardVisa =>
      const SvgGenImage('lib/assets/images/card_visa.svg');
  SvgGenImage get close => const SvgGenImage('lib/assets/images/close.svg');
  SvgGenImage get growDown =>
      const SvgGenImage('lib/assets/images/grow_down.svg');
  SvgGenImage get growUp => const SvgGenImage('lib/assets/images/grow_up.svg');
  SvgGenImage get plus => const SvgGenImage('lib/assets/images/plus.svg');
  SvgGenImage get profile => const SvgGenImage('lib/assets/images/profile.svg');
  SvgGenImage get send => const SvgGenImage('lib/assets/images/send.svg');
  SvgGenImage get serviceComputer =>
      const SvgGenImage('lib/assets/images/service_computer.svg');
  SvgGenImage get serviceDone =>
      const SvgGenImage('lib/assets/images/service_done.svg');
  SvgGenImage get serviceHome =>
      const SvgGenImage('lib/assets/images/service_home.svg');
  SvgGenImage get serviceLike =>
      const SvgGenImage('lib/assets/images/service_like.svg');
  SvgGenImage get serviceNext =>
      const SvgGenImage('lib/assets/images/service_next.svg');
  SvgGenImage get staOnline =>
      const SvgGenImage('lib/assets/images/sta_online.svg');
  SvgGenImage get union => const SvgGenImage('lib/assets/images/union.svg');
  SvgGenImage get vtbTitle =>
      const SvgGenImage('lib/assets/images/vtb_title.svg');
}

class Assets {
  Assets._();

  static const $LibGen lib = $LibGen();
}

class AssetGenImage extends AssetImage {
  const AssetGenImage(String assetName) : super(assetName);

  Image image({
    Key? key,
    ImageFrameBuilder? frameBuilder,
    ImageLoadingBuilder? loadingBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? width,
    double? height,
    Color? color,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    FilterQuality filterQuality = FilterQuality.low,
  }) {
    return Image(
      key: key,
      image: this,
      frameBuilder: frameBuilder,
      loadingBuilder: loadingBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      width: width,
      height: height,
      color: color,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      filterQuality: filterQuality,
    );
  }

  String get path => assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    Color? color,
    BlendMode colorBlendMode = BlendMode.srcIn,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Clip clipBehavior = Clip.hardEdge,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      color: color,
      colorBlendMode: colorBlendMode,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
    );
  }

  String get path => _assetName;
}
