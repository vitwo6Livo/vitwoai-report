// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../src/home/presentation/main-Screen.dart';

class Bottomnav extends StatefulWidget {
  const Bottomnav({super.key});

  @override
  State<Bottomnav> createState() => _BottomnavState();
}

class _BottomnavState extends State<Bottomnav> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  final List<Widget> _screens = [
    const Main_Screen(),
    const Main_Screen(),
    const Main_Screen(),
    const Main_Screen(),
    const Main_Screen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 167, 215, 255),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt), label: 'Ageing'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'PR'),
          BottomNavigationBarItem(
              icon: Icon(Icons.payments), label: 'Sales Register'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: _screens,
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  final Function(int) onItemSelected;

  const AppDrawer({super.key, required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xff003060),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                        'https://imgcdn.stablediffusionweb.com/2024/4/7/a6908dd0-0688-4200-bfa5-fbdcb4b9dc6f.jpg'),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Sayed Al Mamoon',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Text(
                  //   'sayedalmamoon@example.com',
                  //   style: TextStyle(
                  //     color: Colors.white70,
                  //     fontSize: 14,
                  //   ),
                  // ),
                  Text.rich(TextSpan(
                    children: [
                      TextSpan(
                        text: 'Company name: ',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                      TextSpan(
                        text: 'Saregama India Limited',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  )),
                  Text.rich(TextSpan(
                    children: [
                      TextSpan(
                        text: 'Location: ',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                      TextSpan(
                        text: 'Banglore, India',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  )),
                ],
              ),
            ),
            ListTile(
              leading: LottieBuilder.asset(
                "assets/json/Home-Animation.json",
                height: 30,
              ),
              title: Text(
                'Dashboard',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              onTap: () => onItemSelected(0),
            ),
            ListTile(
              leading: LottieBuilder.asset(
                "assets/json/Chart-Animation.json",
                height: 30,
              ),
              title: Text(
                'All Reports',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              onTap: () => onItemSelected(1),
            ),
            ListTile(
              leading: LottieBuilder.asset(
                "assets/json/ChartTwo-Animation.json",
                height: 30,
              ),
              title: Text(
                'Report Details',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              onTap: () => onItemSelected(2),
            ),
            // ListTile(
            //   leading: LottieBuilder.asset(
            //     "assets/json/profile.json",
            //     height: 30,
            //   ),
            //   title: Text(
            //     'ProFile',
            //     style: Theme.of(context).textTheme.bodyLarge,
            //   ),
            //   onTap: () => onItemSelected(3),
            // ),
            ListTile(
              leading: LottieBuilder.asset(
                "assets/json/logout.json",
                height: 30,
              ),
              title: Text(
                'Logout',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
