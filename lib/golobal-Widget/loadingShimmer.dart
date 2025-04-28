import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vitwoai_report/src/settings/colors.dart';

Widget loadingShimmer(double h, double w) {
  return Container(
    height: h,
    width: w,
    child: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Shimmer.fromColors(
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
            ),
          );
        }),
  );
}
