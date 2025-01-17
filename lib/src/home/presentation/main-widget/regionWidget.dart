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
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 8,
              ),
              title: Text('Kolkata'),
              trailing: Text('93562'),
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
              title: Text('Mumbai'),
              trailing: Text('6517'),
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
              title: Text('Banglore'),
              trailing: Text('6517'),
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
              title: Text('Pune'),
              trailing: Text('6517'),
            ),
          ],
        ),
      ),
    );
  }
}
