// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:vitwoai_report/src/settings/colors.dart';
import 'package:vitwoai_report/src/settings/mediaQuery.dart';
import '../../../../settings/texts.dart';
import 'pieChart.dart';

class PieChartDetails extends StatefulWidget {
  const PieChartDetails({super.key});

  @override
  State<PieChartDetails> createState() => _PieChartDetailsState();
}

class _PieChartDetailsState extends State<PieChartDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          HandText.chartView,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const PieChartView(),
          SizedBox(height: SizeVariables.getHeight(context) * 0.02),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'From',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(width: 5),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: AppColor.appBarColor,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Text(
                        'DD-MM-YYYY',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'To',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(width: 5),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: AppColor.appBarColor,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Text(
                        'DD-MM-YYYY',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
