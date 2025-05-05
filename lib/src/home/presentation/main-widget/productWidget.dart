import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:vitwoai_report/golobal-Widget/shimmer_screen.dart';
import 'package:vitwoai_report/src/home/data/dashboardDataFatch.dart';
import 'package:vitwoai_report/src/settings/texts.dart';
import '../../../settings/colors.dart';

class ProductWidget extends ConsumerWidget {
  const ProductWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trandingProductList = ref.watch(trandingProductProvider);
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Card(
      color: AppColor.cardBackgroundColor,
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        child: Column(
          children: [
            Text(HandText.product,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            trandingProductList.when(
                data: (data) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: data['topList'].length,
                    itemBuilder: (context, index) {
                      return data.isEmpty
                          ? Center(
                              child: LottieBuilder.asset(
                                'assets/json/NoDataFound.json',
                                fit: BoxFit.fill,
                                height: screenHeight * 0.196,
                                width: screenWidth * 0.25,
                              ),
                            )
                          : Column(
                              children: [
                                ListTile(
                                  leading: const CircleAvatar(
                                    backgroundColor: Colors.blue,
                                    radius: 8,
                                  ),
                                  title: Text(
                                      data['topList'][index]['Product Name'],
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!),
                                  trailing: Text(
                                      data['topList'][index]['Quantity']
                                          .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!),
                                ),
                                const Divider(
                                  height: 1,
                                  thickness: 0,
                                ),
                              ],
                            );
                    },
                  );
                },
                error: (error, stack) => Center(
                      child: LottieBuilder.asset(
                        'assets/json/ErrorLoading.json',
                        fit: BoxFit.fill,
                        height: screenHeight * 0.196,
                        width: screenWidth * 0.25,
                      ),
                    ),
                loading: () => screen_shimmer(50, 800))
          ],
        ),
      ),
    );
  }
}
