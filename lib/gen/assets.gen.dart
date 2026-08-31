// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsImgGen {
  const $AssetsImgGen();

  /// Directory path: assets/img/logo
  $AssetsImgLogoGen get logo => const $AssetsImgLogoGen();

  /// Directory path: assets/img/onboarding
  $AssetsImgOnboardingGen get onboarding => const $AssetsImgOnboardingGen();
}

class $AssetsImgLogoGen {
  const $AssetsImgLogoGen();

  /// File path: assets/img/logo/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/img/logo/logo.png');

  /// List of all assets
  List<AssetGenImage> get values => [logo];
}

class $AssetsImgOnboardingGen {
  const $AssetsImgOnboardingGen();

  /// File path: assets/img/onboarding/onBoarding1.png
  AssetGenImage get onBoarding1 =>
      const AssetGenImage('assets/img/onboarding/onBoarding1.png');

  /// File path: assets/img/onboarding/onBoarding3.png
  AssetGenImage get onBoarding3 =>
      const AssetGenImage('assets/img/onboarding/onBoarding3.png');

  /// File path: assets/img/onboarding/onboarding2.png
  AssetGenImage get onboarding2 =>
      const AssetGenImage('assets/img/onboarding/onboarding2.png');

  /// List of all assets
  List<AssetGenImage> get values => [onBoarding1, onBoarding3, onboarding2];
}

abstract final class Assets {
  static const $AssetsImgGen img = $AssetsImgGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
