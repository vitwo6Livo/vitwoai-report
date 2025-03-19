import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vitwoai_report/src/settings/colors.dart';

// Define a provider to manage the favorite items list
final favouriteProvider = StateNotifierProvider<FavouriteNotifier, List<int>>(
  (ref) => FavouriteNotifier(),
);

class FavouriteNotifier extends StateNotifier<List<int>> {
  FavouriteNotifier() : super([]) {
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final savedFavorites = prefs.getStringList('favorites') ?? [];
    state = savedFavorites.map(int.parse).toList();
  }

  Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      'favorites',
      state.map((e) => e.toString()).toList(),
    );
  }

  void toggleFavourite(int index) async {
    if (state.contains(index)) {
      state = state.where((item) => item != index).toList();
    } else {
      state = [...state, index];
    }
    await _saveFavorites();
  }
}

class FavouriteScreen extends ConsumerWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "List",
          style: TextStyle(color: Colors.white),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColor.appBarColor1, AppColor.appBarColor2],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.close,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: ListView(
          children: [
            const Text(
              "Ageing",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            _buildLineItems(
              context,
              ref,
              0,
              Icons.assessment,
              'Receivable',
              Colors.purple,
            ),
            const Text(
              "Purchase Register",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            _buildLineItems(
              context,
              ref,
              1,
              Icons.blinds,
              'Product',
              Colors.indigo,
            ),
            _buildLineItems(
              context,
              ref,
              2,
              Icons.baby_changing_station,
              'Vendor',
              Colors.amber,
            ),
            _buildLineItems(
              context,
              ref,
              3,
              Icons.bar_chart,
              'Purchase Po',
              Colors.green,
            ),
            _buildLineItems(
              context,
              ref,
              4,
              Icons.table_chart,
              'Functional Area',
              Colors.blue,
            ),
            _buildLineItems(
              context,
              ref,
              5,
              Icons.store_mall_directory,
              'Storage Location',
              Colors.cyan,
            ),
            _buildLineItems(
              context,
              ref,
              6,
              Icons.on_device_training,
              'Cost Center',
              Colors.deepOrangeAccent,
            ),
            const Text(
              "Sales Register",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            _buildLineItems(
              context,
              ref,
              7,
              Icons.production_quantity_limits,
              'Sales Product',
              Colors.indigo,
            ),
            _buildLineItems(
              context,
              ref,
              8,
              Icons.support_agent,
              'Customer',
              Colors.amber,
            ),
            _buildLineItems(
              context,
              ref,
              9,
              Icons.vertical_split,
              'Vertical',
              Colors.green,
            ),
            _buildLineItems(
              context,
              ref,
              10,
              Icons.business_center,
              'Sales Order',
              Colors.blue,
            ),
            _buildLineItems(
              context,
              ref,
              11,
              Icons.contact_mail,
              'Key Account Manager',
              Colors.cyan,
            ),
            _buildLineItems(
              context,
              ref,
              12,
              Icons.map,
              'Region',
              Colors.deepPurple,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLineItems(
    BuildContext context,
    WidgetRef ref,
    int index,
    IconData icon,
    String label,
    Color color,
  ) {
    final isFavourite = ref.watch(favouriteProvider).contains(index);

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        child: Icon(icon, color: Colors.white),
      ),
      title: Text(
        label,
        style: const TextStyle(fontSize: 20),
      ),
      trailing: IconButton(
        onPressed: () {
          ref.read(favouriteProvider.notifier).toggleFavourite(index);
        },
        icon: Icon(
          isFavourite ? Icons.star : Icons.star_border,
          color: Colors.amber,
        ),
      ),
    );
  }
}
