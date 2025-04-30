import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vitwoai_report/src/settings/colors.dart';

Widget loadingShimmer(double h, double w) {
  return SizedBox(
    height: h,
    width: w,
    child: Shimmer.fromColors(
      baseColor: AppColor.shimmerBaseColor,
      highlightColor: AppColor.shimmerHighlightColor,
      child: Card(
        color: AppColor.shimmerBoxDecorationColor,
      ),
    ),
  );
}
