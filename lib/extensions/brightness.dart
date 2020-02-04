import 'package:flutter/material.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';

extension BrigthnessExtension on Brightness {
  BannerStyle toBannerStyle() {
    if (this == Brightness.dark) return BannerStyle.dark;
    else return BannerStyle.light;
  }
}