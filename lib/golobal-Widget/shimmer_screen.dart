import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vitwoai_report/src/settings/colors.dart';

Widget screen_shimmer(double h, double w) {
  return SizedBox(
    height: 340,
    child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            direction: ShimmerDirection.ltr,
            baseColor: AppColor.shimmerBaseColor,
            highlightColor: AppColor.shimmerHighlightColor,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              height: h,
              width: w,
              decoration: BoxDecoration(
                color: AppColor.shimmerBoxDecorationColor,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          );
        }),
  );
}
