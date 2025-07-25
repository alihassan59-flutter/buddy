import 'package:buddy/res/contants/colors_contants.dart';
import 'package:buddy/CreatorScreens/animatedSwitch.dart';
import 'package:buddy/CreatorScreens/notification.dart';
import 'package:buddy/CreatorScreens/search.dart';

import 'package:buddy/CreatorScreens/userProfile.dart';
import 'package:flutter/material.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  void _onNavTapped(int index) {
    setState(() => _selectedIndex = index);
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) => setState(() => _selectedIndex = index),
        children: const [
          HomePage(),
          Search(),
          AddPage(),
          NotificationPage(),
          UserProfile(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        onTap: _onNavTapped,
        elevation: 8,
        iconSize: 28,
        items: [
          BottomNavigationBarItem(
            icon: _buildHighlightedIcon('assets/icons/home.png', 0),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildHighlightedIcon(
                'assets/icons/search-interface-symbol.png', 1),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildHighlightedIcon('assets/icons/add.png', 2),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildHighlightedIcon('assets/icons/notification.png', 3),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildHighlightedIcon('assets/icons/user.png', 4),
            label: '',
          ),
        ],
      ),
    );
  }

  static Widget _buildHighlightedIcon(String assetPath, int index) {
    return Builder(
      builder: (context) {
        final parentState = context.findAncestorStateOfType<_MainHomeState>();
        final isSelected = parentState?._selectedIndex == index;
        return Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              assetPath,
              width: 24,
              height: 24,
            ),
            if (isSelected)
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.3),
                  shape: BoxShape.rectangle,
                ),
              ),
          ],
        );
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                // Centered Text
                Center(
                  child: Text(
                    "buddy",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: ColorsContants.primaryColor,
                    ),
                  ),
                ),

                // Icon at Top-Right
                Positioned(
                  //top: 10,
                  right: 10,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AnimatedSwitch()));
                    },
                    child: Icon(
                      Icons.trip_origin,
                      size: 35,
                      color: ColorsContants.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            _buildHorizontalIcons(),
            const SizedBox(height: 16),
            _buildTopBanner(),
            const SizedBox(height: 16),
            Expanded(child: _buildGridCards()),
          ],
        ),
      ),
    );
  }

  Widget _buildHorizontalIcons() {
    return SizedBox(
      height: 60, // Slightly increased for better spacing
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) => Container(
          padding: EdgeInsets.all(2), // Optional padding inside border
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Color.fromARGB(255, 28, 247, 163), // Custom green border
              width: 2,
            ),
          ),
          child: CircleAvatar(
            backgroundColor: Colors.grey.shade300,
            radius: 28, // Reduced to fit inside border nicely
          ),
        ),
      ),
    );
  }

  Widget _buildTopBanner() {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }

  Widget _buildGridCards() {
    return GridView.builder(
      padding: const EdgeInsets.only(bottom: 16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 3 / 4,
      ),
      itemCount: 6,
      itemBuilder: (context, index) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 180,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(8),
            child: const Center(child: Icon(Icons.image, size: 48)),
          ),
          const SizedBox(height: 2),
          const Text(
            "Lorem ipsum dolor sit amet, con...",
            style: TextStyle(fontSize: 12),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

// Dummy pages for other screens

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Add Page Content"));
  }
}
