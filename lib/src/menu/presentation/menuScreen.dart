import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vitwoai_report/src/menu/presentation/generalSettings.dart';
import 'package:vitwoai_report/src/menu/presentation/rateScreen.dart';
import 'package:vitwoai_report/src/menu/presentation/widget/helpScreen.dart';
import 'package:vitwoai_report/src/routes/routeNames.dart';
import 'package:vitwoai_report/src/settings/colors.dart';
import 'package:vitwoai_report/src/settings/texts.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final List<int> favouriteList = [];
  late SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    _loadFavourites();
  }

  Future<void> _loadFavourites() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      favouriteList.clear();
      final savedFavourites =
          sharedPreferences.getStringList('favouriteList') ?? [];
      favouriteList.addAll(savedFavourites.map(int.parse));
    });
  }

  Future<void> _saveFavourites() async {
    await sharedPreferences.setStringList(
        'favouriteList', favouriteList.map((e) => e.toString()).toList());
  }

  void _toggleFavourite(int index) {
    setState(() {
      if (favouriteList.contains(index)) {
        favouriteList.remove(index);
      } else {
        favouriteList.add(index);
      }
      _saveFavourites();
    });
  }

  // void _navigateOtherScreen(int index) {
  //   switch (index) {
  //     case 1:
  //       Navigator.pushNamed(context, RouteNames.payableScreen);
  //       break;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final crossAxisCount = MediaQuery.of(context).size.width < 600 ? 2 : 4;

    return Scaffold(
      backgroundColor: AppColor.menuScreenBgColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(HandText.menuTitle,
            style: TextStyle(color: AppColor.appbarFont)),
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
                  HandText.menuFavSectionTitle,
                  favouriteList.map((index) => _buildGridItem(index)).toList(),
                  crossAxisCount),
            _buildSectionCard(HandText.menuAgeingSectionTitle,
                [0, 1].map(_buildGridItem).toList(), crossAxisCount),
            const SizedBox(
              height: 2,
            ),
            _buildSectionCard(
                HandText.menuPRSectionTitle,
                [2, 3, 4, 5, 6, 7].map(_buildGridItem).toList(),
                crossAxisCount),
            const SizedBox(height: 2),
            _buildSectionCard(
                HandText.menuSRSectionTitle,
                [8, 9, 10, 11, 12, 13].map(_buildGridItem).toList(),
                crossAxisCount),
            _buildSettingsSection()
          ],
        ),
      ),
    );
  }

  Widget _buildGridItem(int index) {
    // const items = [
    //   (Icons.assessment, 'Receivable', Colors.purple),
    //   (Icons.payments, 'Payable', Colors.orange),
    //   (Icons.blinds, 'Product', Colors.indigo),
    //   (Icons.baby_changing_station, 'Vendor', Colors.amber),
    //   (Icons.bar_chart, 'Purchase Po', Colors.green),
    //   (Icons.table_chart, 'Functional Area', Colors.blue),
    //   (Icons.store_mall_directory, 'Storage Location', Colors.cyan),
    //   (Icons.on_device_training, 'Cost Center', Colors.deepOrangeAccent),
    //   (Icons.production_quantity_limits, 'Sales Product', Colors.indigo),
    //   (Icons.support_agent, 'Customer', Colors.amber),
    //   (Icons.vertical_split, 'Vertical', Colors.green),
    //   (Icons.business_center, 'Sales Order', Colors.blue),
    //   (Icons.contact_mail, 'Key Account Manager', Colors.cyan),
    //   (Icons.map, 'Region', Colors.deepPurple),
    // ];
    var items = [
      (
        Icons.assessment,
        HandText.menuAgeingReceivable,
        Colors.purple,
        () {
          Navigator.pushNamed(context, RouteNames.Receivable);
        }
      ),
      (
        Icons.payments,
        HandText.menuAgeingPayable,
        Colors.orange,
        () {
          Navigator.pushNamed(context, RouteNames.payableScreen);
        }
      ),
      (
        Icons.blinds,
        HandText.menuPRAll,
        Colors.indigo,
        () {
          Navigator.pushNamed(context, RouteNames.Purchase);
        }
      ),
      (
        Icons.bar_chart,
        HandText.menuPRPO,
        Colors.green,
        () {
          Navigator.pushNamed(context, RouteNames.POWise);
        }
      ),
      (
        Icons.baby_changing_station,
        HandText.menuPRVendor,
        Colors.amber,
        () {
          Navigator.pushNamed(context, RouteNames.VendorWise);
        }
      ),
      (
        Icons.table_chart,
        HandText.menuPRIW,
        Colors.blue,
        () {
          Navigator.pushNamed(context, RouteNames.ItemWise);
        }
      ),
      (
        Icons.store_mall_directory,
        HandText.menuPRIGW,
        Colors.cyan,
        () {
          Navigator.pushNamed(context, RouteNames.ItemGroupWise);
        }
      ),
      (
        Icons.on_device_training,
        HandText.menuPRHSN,
        Colors.deepOrangeAccent,
        () {
          Navigator.pushNamed(context, RouteNames.HSNWise);
        }
      ),
      (
        Icons.vertical_split,
        HandText.menuSRAll,
        Colors.green,
        () {
          Navigator.pushNamed(context, RouteNames.Sales);
        }
      ),
      (
        Icons.business_center,
        HandText.menuSRSO,
        Colors.blue,
        () {
          Navigator.pushNamed(context, RouteNames.SOWise);
        }
      ),
      (
        Icons.contact_mail,
        HandText.menuSRCustomer,
        Colors.cyan,
        () {
          Navigator.pushNamed(context, RouteNames.SalesCustomerWise);
        }
      ),
      (
        Icons.production_quantity_limits,
        HandText.menuSRIW,
        Colors.indigo,
        () {
          Navigator.pushNamed(context, RouteNames.SalesItemWise);
        }
      ),
      (
        Icons.support_agent,
        HandText.menuSRIGW,
        Colors.amber,
        () {
          Navigator.pushNamed(context, RouteNames.SalesItemGroupWise);
        }
      ),
      (
        Icons.map,
        HandText.menuSRHSN,
        Colors.deepPurple,
        () {
          Navigator.pushNamed(context, RouteNames.SalesHSNWise);
        }
      ),
    ];
    final (icon, label, color, ontap) = items[index];
    final isFavourite = favouriteList.contains(index);

    return Material(
      color: Colors.grey[100],
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: ontap,
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
      color: AppColor.cardBackgroundColor,
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
        color: AppColor.cardBackgroundColor,
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
                title: HandText.menuSettings,
                color: const Color.fromARGB(255, 223, 129, 239)),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const RateScreen()));
            },
            child: _buildSettingsItem(
                icon: Icons.star_half,
                title: HandText.menuRateApp,
                color: Colors.amber),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HelpScreen()));
            },
            child: _buildSettingsItem(
                icon: Icons.help_outline,
                title: HandText.menuHelpInfo,
                color: Colors.blue),
          ),
          InkWell(
            onTap: () {
              SharedPreferences.getInstance().then((sharedPreferences) {
                sharedPreferences.clear();
                Navigator.pushNamedAndRemoveUntil(
                    context, RouteNames.loginScreen, (route) => false);
              });
              print("LogOut successfully");
            },
            child: _buildSettingsItem(
                icon: Icons.exit_to_app,
                title: HandText.logoutBttn,
                color: Colors.red),
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
              color: AppColor.menuOptionsTitleColor,
              fontWeight: FontWeight.w500,
            )),
        trailing: Icon(Icons.arrow_forward_ios,
            color: AppColor.menuOptionArrowColor, size: 16),
        contentPadding: const EdgeInsets.symmetric(vertical: 4),
        minLeadingWidth: 24,
        visualDensity: const VisualDensity(vertical: -2),
      ),
    );
  }
}
