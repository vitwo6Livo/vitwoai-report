import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vitwoai_report/src/settings/colors.dart';
import 'package:vitwoai_report/src/settings/texts.dart';

class SummaryShimmer extends StatelessWidget {
  const SummaryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 120,
      left: 10,
      right: 10,
      child: Card(
        color: AppColor.lightFontCpy,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade400,
            highlightColor: Colors.grey.shade200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          HandText.prTotalAmount,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Text("0.0"),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          HandText.prTotalCGST,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("0.0"),
                      ],
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          HandText.prTotalSGST,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("0.0"),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          HandText.prTotalIGST,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("0.0"),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
