import 'package:flutter/material.dart';
import 'package:vitwoai_report/src/settings/texts.dart';
import '../../../settings/colors.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
            const SizedBox(height: 16),
            ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 8,
              ),
              title: Text('Net Pay',
                  style: Theme.of(context).textTheme.bodyMedium!),
              trailing:
                  Text('93562', style: Theme.of(context).textTheme.bodySmall!),
            ),
            const Divider(
              height: 1,
              thickness: 0,
            ),
            ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.purple,
                radius: 8,
              ),
              title: Text('Bettry',
                  style: Theme.of(context).textTheme.bodyMedium!),
              trailing:
                  Text('6517', style: Theme.of(context).textTheme.bodySmall!),
            ),
            const Divider(
              height: 1,
              thickness: 0,
            ),
            ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.purple,
                radius: 8,
              ),
              title:
                  Text('juice', style: Theme.of(context).textTheme.bodyMedium!),
              trailing:
                  Text('6517', style: Theme.of(context).textTheme.bodySmall!),
            ),
            const Divider(
              height: 1,
              thickness: 0,
            ),
            ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.purple,
                radius: 8,
              ),
              title:
                  Text('Car', style: Theme.of(context).textTheme.bodyMedium!),
              trailing:
                  Text('6517', style: Theme.of(context).textTheme.bodySmall!),
            ),
            ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.purple,
                radius: 8,
              ),
              title:
                  Text('Bike', style: Theme.of(context).textTheme.bodyMedium!),
              trailing:
                  Text('6517', style: Theme.of(context).textTheme.bodySmall!),
            ),
          ],
        ),
      ),
    );
  }
}
