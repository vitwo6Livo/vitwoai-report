import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vitwoai_report/src/settings/colors.dart';

Widget graphShimmer() {
  return Container(
    child: Shimmer.fromColors(
      direction: ShimmerDirection.ltr,
      baseColor: AppColor.shimmerBaseColor,
      highlightColor: AppColor.shimmerHighlightColor,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(15),
              height: 40,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            const Center(
              child: SizedBox(
                height: 220,
                width: 220,
                child: CircleAvatar(),
              ),
            ),
            const SizedBox(height: 35),
            ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 20,
                            width: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(width: 15),
                          Container(
                            height: 20,
                            width: 150,
                            color: Colors.grey,
                          ),
                          const SizedBox(height: 40)
                        ],
                      ),
                    ],
                  );
                }),
          ],
        ),
      ),
    ),
  );
}
