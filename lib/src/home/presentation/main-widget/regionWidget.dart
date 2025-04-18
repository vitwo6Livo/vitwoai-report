import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vitwoai_report/src/home/data/dashboardDataFatch.dart';

class RegionWidget extends ConsumerWidget {
  const RegionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trandingRegionList = ref.watch(trandingRegionProvider);
    return Card(
      color: Colors.white,
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        child: Column(
          children: [
            Text(
              'Trending Region',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            trandingRegionList.when(
              data: (data) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: data['topList'].length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.purple[200],
                            radius: 8,
                          ),
                          title: Text(
                            data['topList'][index]['Region'],
                            style: Theme.of(context).textTheme.bodyMedium!,
                          ),
                          trailing: Text(
                            data['topList'][index]['Total Price'].toString(),
                            style: Theme.of(context).textTheme.bodySmall!,
                          ),
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
              error: (error, stack) => Center(child: Text('Error: $error')),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
