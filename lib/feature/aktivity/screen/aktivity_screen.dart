import 'package:flutter/material.dart';
import '../widget/completed.dart';
import '../widget/custom_Tap_Chip.dart';
import '../widget/ongoing_tab.dart';
import '../widget/scheduled_tab.dart';


class AktivityScreen extends StatefulWidget {
  const AktivityScreen({super.key});


  @override
  State<AktivityScreen> createState() => _AktivityScreenState();
}

class _AktivityScreenState extends State<AktivityScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Center(
          child: Container(
            width: 32,
            height: 32,
            decoration: const BoxDecoration(
              color: Color(0xFF06C143),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.bolt, color: Colors.white, size: 20),
          ),
        ),
        titleSpacing: 0,
        title: const Text(
          'Activity',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              indicatorColor: Colors.transparent,
              labelPadding: const EdgeInsets.symmetric(horizontal: 6),
              padding: const EdgeInsets.symmetric(horizontal: 16,  ),
              tabs: [
                CustomTabChip(label: 'Ongoing', isSelected: _tabController.index == 0),
                CustomTabChip(label: 'Scheduled', isSelected: _tabController.index == 1),
                CustomTabChip(label: 'Completed', isSelected: _tabController.index == 2),
                CustomTabChip(label: 'Cancelled', isSelected: _tabController.index == 3),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          OngoingTab(),
          ScheduledTab(),
          CompletedTab(),
          Center(child: Text('Cancelled Rides')),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        selectedItemColor: const Color(0xFF06C143),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 11),
        unselectedLabelStyle: const TextStyle(fontSize: 11),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.local_offer_outlined), label: 'Promos'),
          BottomNavigationBarItem(icon: Icon(Icons.description), label: 'Activity'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Account'),
        ],
      ),
    );
  }
}