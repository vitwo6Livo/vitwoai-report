import 'package:flutter/material.dart';

class RegionWidget extends StatelessWidget {
  const RegionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tranding Region',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 8,
              ),
              title: Text('Kolkata',
                  style: Theme.of(context).textTheme.bodyMedium!),
              trailing:
                  Text('93562', style: Theme.of(context).textTheme.bodySmall!),
            ),
            Divider(
              height: 1,
              thickness: 0,
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.purple,
                radius: 8,
              ),
              title: Text('Mumbai',
                  style: Theme.of(context).textTheme.bodyMedium!),
              trailing:
                  Text('6517', style: Theme.of(context).textTheme.bodySmall!),
            ),
            Divider(
              height: 1,
              thickness: 0,
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.purple,
                radius: 8,
              ),
              title: Text('Banglore',
                  style: Theme.of(context).textTheme.bodyMedium!),
              trailing:
                  Text('6517', style: Theme.of(context).textTheme.bodySmall!),
            ),
            Divider(
              height: 1,
              thickness: 0,
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.purple,
                radius: 8,
              ),
              title:
                  Text('Pune', style: Theme.of(context).textTheme.bodyMedium!),
              trailing:
                  Text('6517', style: Theme.of(context).textTheme.bodySmall!),
            ),
          ],
        ),
      ),
    );
  }
}
