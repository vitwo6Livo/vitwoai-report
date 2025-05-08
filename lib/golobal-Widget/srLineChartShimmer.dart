import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vitwoai_report/src/settings/colors.dart';

Widget srlineChartShimmer() {
  return Shimmer.fromColors(
    direction: ShimmerDirection.ltr,
    baseColor: AppColor.shimmerBaseColor,
    highlightColor: AppColor.shimmerHighlightColor,
    child: Container(
      // margin: const EdgeInsets.all(15.0),
      height: 550,
      width: 450,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.grey),
    ),
  );
}
