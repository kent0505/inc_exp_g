import 'package:flutter/material.dart';

import '../../utils.dart';

class TabWidget extends StatefulWidget {
  const TabWidget({
    super.key,
    required this.page1,
    required this.page2,
    required this.page3,
    required this.title1,
    required this.title2,
    required this.title3,
  });

  final Widget page1;
  final Widget page2;
  final Widget page3;
  final String title1;
  final String title2;
  final String title3;

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20 + getStatusBar(context)),
        Container(
          height: 45,
          margin: const EdgeInsets.all(20),
          // decoration: BoxDecoration(
          //   color: Colors.redAccent,
          //   borderRadius: BorderRadius.circular(24),
          // ),
          child: TabBar(
            controller: _tabController,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Colors.greenAccent,
            ),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            tabs: [
              Tab(text: widget.title1),
              Tab(text: widget.title2),
              Tab(text: widget.title3),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              widget.page1,
              widget.page2,
              widget.page3,
            ],
          ),
        ),
      ],
    );
  }
}
