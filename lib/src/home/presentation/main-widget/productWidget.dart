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
            Text(
              HandText.product,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 18),
            ),
            const SizedBox(height: 16),
            const ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 8,
              ),
              title: Text('Net Pay'),
              trailing: Text('93562'),
            ),
            const Divider(
              height: 1,
              thickness: 0,
            ),
            const ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.purple,
                radius: 8,
              ),
              title: Text('Bettry'),
              trailing: Text('6517'),
            ),
            const Divider(
              height: 1,
              thickness: 0,
            ),
            const ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.purple,
                radius: 8,
              ),
              title: Text('juice'),
              trailing: Text('6517'),
            ),
            const Divider(
              height: 1,
              thickness: 0,
            ),
            const ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.purple,
                radius: 8,
              ),
              title: Text('car'),
              trailing: Text('6517'),
            ),
            const ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.purple,
                radius: 8,
              ),
              title: Text('Bike'),
              trailing: Text('6517'),
            ),
          ],
        ),
      ),
    );
  }
}
