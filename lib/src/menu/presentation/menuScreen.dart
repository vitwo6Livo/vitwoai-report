import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vitwoai_report/src/menu/presentation/generalSettings.dart';
import 'package:vitwoai_report/src/menu/presentation/rateScreen.dart';
import 'package:vitwoai_report/src/routes/routeNames.dart';
import 'package:vitwoai_report/src/settings/colors.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final List<int> favouriteList = [];

  void _toggleFavourite(int index) {
    setState(() {
      favouriteList.contains(index)
          ? favouriteList.remove(index)
          : favouriteList.add(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final crossAxisCount = MediaQuery.of(context).size.width < 600 ? 2 : 4;

    return Scaffold(
      backgroundColor: const Color(0xffe9e9e9),
      appBar: AppBar(
        title: const Text("Menu", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColor.appBarColor1, AppColor.appBarColor2],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (favouriteList.isNotEmpty)
              _buildSectionCard(
                  'Favourite',
                  favouriteList.map((index) => _buildGridItem(index)).toList(),
                  crossAxisCount),
            _buildSectionCard('Ageing', [_buildGridItem(0)], crossAxisCount),
            const SizedBox(
              height: 2,
            ),
            _buildSectionCard(
                'Purchase Register',
                [1, 2, 3, 4, 5, 6].map(_buildGridItem).toList(),
                crossAxisCount),
            const SizedBox(height: 2),
            _buildSectionCard(
                'Sales Register',
                [7, 8, 9, 10, 11, 12].map(_buildGridItem).toList(),
                crossAxisCount),
            _buildSettingsSection()
          ],
        ),
      ),
    );
  }

  Widget _buildGridItem(int index) {
    const items = [
      (Icons.assessment, 'Receivable', Colors.purple),
      (Icons.blinds, 'Product', Colors.indigo),
      (Icons.baby_changing_station, 'Vendor', Colors.amber),
      (Icons.bar_chart, 'Purchase Po', Colors.green),
      (Icons.table_chart, 'Functional Area', Colors.blue),
      (Icons.store_mall_directory, 'Storage Location', Colors.cyan),
      (Icons.on_device_training, 'Cost Center', Colors.deepOrangeAccent),
      (Icons.production_quantity_limits, 'Sales Product', Colors.indigo),
      (Icons.support_agent, 'Customer', Colors.amber),
      (Icons.vertical_split, 'Vertical', Colors.green),
      (Icons.business_center, 'Sales Order', Colors.blue),
      (Icons.contact_mail, 'Key Account Manager', Colors.cyan),
      (Icons.map, 'Region', Colors.deepPurple),
    ];
    final (icon, label, color) = items[index];
    final isFavourite = favouriteList.contains(index);

    return Material(
      color: Colors.grey[100],
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
                backgroundColor: color,
                radius: 30,
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 30,
                )),
            const SizedBox(height: 6),
            Text(label,
                style:
                    const TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
            IconButton(
              onPressed: () => _toggleFavourite(index),
              icon: Icon(isFavourite ? Icons.star : Icons.star_border,
                  color: Colors.amber),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionCard(
      String title, List<Widget> items, int crossAxisCount) {
    return Card(
      elevation: 8,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            GridView.count(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: items,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsSection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 12,
            spreadRadius: 4,
          )
        ],
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const GeneralSettingScreen();
              }));
            },
            child: _buildSettingsItem(
                icon: Icons.settings,
                title: "General Settings",
                color: const Color.fromARGB(255, 223, 129, 239)),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const RateScreen()));
            },
            child: _buildSettingsItem(
                icon: Icons.star_half, title: "Rate App", color: Colors.amber),
          ),
          InkWell(
            onTap: () {},
            child: _buildSettingsItem(
                icon: Icons.help_outline,
                title: "Help & Information",
                color: Colors.blue),
          ),
          InkWell(
            onTap: () {
              SharedPreferences.getInstance().then((sharedPreferences) {
                sharedPreferences.clear();
                Navigator.pushNamedAndRemoveUntil(
                    context, RouteNames.loginScreen, (route) => false);
              });
              print("LogOut succussfully");
            },
            child: _buildSettingsItem(
                icon: Icons.exit_to_app, title: "LogOut", color: Colors.red),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsItem({
    required IconData icon,
    required String title,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[200]!)),
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.15),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color),
        ),
        title: Text(title,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[800],
              fontWeight: FontWeight.w500,
            )),
        trailing:
            Icon(Icons.arrow_forward_ios, color: Colors.grey[600], size: 16),
        contentPadding: const EdgeInsets.symmetric(vertical: 4),
        minLeadingWidth: 24,
        visualDensity: const VisualDensity(vertical: -2),
      ),
    );
  }
}
