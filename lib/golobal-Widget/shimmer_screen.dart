import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget screen_shimmer(double h, double w) {
  return SizedBox(
    height: 350,
    child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            direction: ShimmerDirection.ltr,
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade200,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              height: h,
              width: w,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          );
        }),
  );
}
