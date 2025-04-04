/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Instagram_Gradient.png
  AssetGenImage get instagramGradient =>
      const AssetGenImage('assets/images/Instagram_Gradient.png');

  /// File path: assets/images/Instagram_Logo.png
  AssetGenImage get instagramLogo =>
      const AssetGenImage('assets/images/Instagram_Logo.png');

  /// List of all assets
  List<AssetGenImage> get values => [instagramGradient, instagramLogo];
}

class $AssetsSvgsGen {
  const $AssetsSvgsGen();

  /// File path: assets/svgs/ic_accounts.svg
  AssetGenSvg get icAccounts => AssetGenSvg('assets/svgs/ic_accounts.svg');

  /// File path: assets/svgs/ic_add.svg
  AssetGenSvg get icAdd => AssetGenSvg('assets/svgs/ic_add.svg');

  /// File path: assets/svgs/ic_back.svg
  AssetGenSvg get icBack => AssetGenSvg('assets/svgs/ic_back.svg');

  /// File path: assets/svgs/ic_camera.svg
  AssetGenSvg get icCamera => AssetGenSvg('assets/svgs/ic_camera.svg');

  /// File path: assets/svgs/ic_change_camera.svg
  AssetGenSvg get icChangeCamera =>
      AssetGenSvg('assets/svgs/ic_change_camera.svg');

  /// File path: assets/svgs/ic_comment.svg
  AssetGenSvg get icComment => AssetGenSvg('assets/svgs/ic_comment.svg');

  /// File path: assets/svgs/ic_facebook.svg
  AssetGenSvg get icFacebook => AssetGenSvg('assets/svgs/ic_facebook.svg');

  /// File path: assets/svgs/ic_gallery.svg
  AssetGenSvg get icGallery => AssetGenSvg('assets/svgs/ic_gallery.svg');

  /// File path: assets/svgs/ic_google.svg
  AssetGenSvg get icGoogle => AssetGenSvg('assets/svgs/ic_google.svg');

  /// File path: assets/svgs/ic_igtv.svg
  AssetGenSvg get icIgtv => AssetGenSvg('assets/svgs/ic_igtv.svg');

  /// File path: assets/svgs/ic_live.svg
  AssetGenSvg get icLive => AssetGenSvg('assets/svgs/ic_live.svg');

  /// File path: assets/svgs/ic_menu.svg
  AssetGenSvg get icMenu => AssetGenSvg('assets/svgs/ic_menu.svg');

  /// File path: assets/svgs/ic_messanger.svg
  AssetGenSvg get icMessanger => AssetGenSvg('assets/svgs/ic_messanger.svg');

  /// File path: assets/svgs/ic_private.svg
  AssetGenSvg get icPrivate => AssetGenSvg('assets/svgs/ic_private.svg');

  /// File path: assets/svgs/ic_more.svg
  AssetGenSvg get icMore => AssetGenSvg('assets/svgs/ic_more.svg');

  /// File path: assets/svgs/ic_official.svg
  AssetGenSvg get icOfficial => AssetGenSvg('assets/svgs/ic_official.svg');

  /// File path: assets/svgs/ic_save.svg
  AssetGenSvg get icSave => AssetGenSvg('assets/svgs/ic_save.svg');

  /// File path: assets/svgs/ic_like.svg
  AssetGenSvg get icLike => AssetGenSvg('assets/svgs/ic_like.svg');

  /// File path: assets/svgs/ic_tv.svg
  AssetGenSvg get icTv => AssetGenSvg('assets/svgs/ic_tv.svg');

  /// File path: assets/svgs/ic_shop.svg
  AssetGenSvg get icShop => AssetGenSvg('assets/svgs/ic_shop.svg');

  /// File path: assets/svgs/ic_search.svg
  AssetGenSvg get icSearch => AssetGenSvg('assets/svgs/ic_search.svg');

  /// File path: assets/svgs/ic_video.svg
  AssetGenSvg get icVideo => AssetGenSvg('assets/svgs/ic_video.svg');

  /// File path: assets/svgs/ic_tags.svg
  AssetGenSvg get icTags => AssetGenSvg('assets/svgs/ic_tags.svg');

  /// File path: assets/svgs/ic_grid.svg
  AssetGenSvg get icGrid => AssetGenSvg('assets/svgs/ic_grid.svg');

  /// File path: assets/svgs/ic_setting.svg
  AssetGenSvg get icSetting => AssetGenSvg('assets/svgs/ic_setting.svg');

  /// File path: assets/svgs/ic_openfb.svg
  AssetGenSvg get icOpenfb => AssetGenSvg('assets/svgs/ic_openfb.svg');

  /// File path: assets/svgs/ic_add_people.svg
  AssetGenSvg get icAddPeople => AssetGenSvg('assets/svgs/ic_add_people.svg');

  /// File path: assets/svgs/ic_menu_start.svg
  AssetGenSvg get icMenuStart => AssetGenSvg('assets/svgs/ic_menu_start.svg');

  /// File path: assets/svgs/ic_history_oclok.svg
  AssetGenSvg get icHistoryOclk =>
      AssetGenSvg('assets/svgs/ic_history_oclok.svg');

  /// File path: assets/svgs/ic_history.svg
  AssetGenSvg get icHistory => AssetGenSvg('assets/svgs/ic_history.svg');

  /// List of all assets
  List<AssetGenSvg> get values => [
    icAccounts,
    icAdd,
    icBack,
    icCamera,
    icChangeCamera,
    icComment,
    icFacebook,
    icGallery,
    icGoogle,
    icIgtv,
    icLive,
    icMenu,
    icMessanger,
    icPrivate,
    icSearch,
    icVideo,
    icTags,
    icGrid,
    icSetting,
    icOpenfb,
    icAddPeople,
    icMenuStart,
    icHistoryOclk,
    icHistory,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsSvgsGen svgs = $AssetsSvgsGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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

class AssetGenSvg {
  const AssetGenSvg(this._assetName);

  final String _assetName;

  SvgPicture svg({
    double? width,
    double? height,
    Color? color,
    BoxFit fit = BoxFit.contain,
  }) {
    return SvgPicture.asset(
      _assetName,
      width: width,
      height: height,
      colorFilter:
          color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
      fit: fit,
    );
  }

  String get path => _assetName;
}
