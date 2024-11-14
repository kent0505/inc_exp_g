import 'package:flutter/material.dart';

import '../../config/app_colors.dart';

class TabWidget extends StatefulWidget {
  const TabWidget({
    super.key,
    required this.pages,
    required this.titles,
  }) : assert(
            pages.length == titles.length, 'Pages and titles count must match');

  final List<Widget> pages;
  final List<String> titles;

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: 1,
    );
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
        Container(
          height: 45,
          margin: const EdgeInsets.symmetric(horizontal: 26),
          child: TabBar(
            controller: _tabController,
            indicator: const UnderlineTabIndicator(
              borderSide: BorderSide(
                width: 5.0,
                color: AppColors.main,
              ),
            ),
            overlayColor: WidgetStateProperty.all(
              Colors.transparent, // splash color removed
            ),
            tabs: widget.titles.map((title) => _Tab(title)).toList(),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: widget.pages,
          ),
        ),
      ],
    );
  }
}

class _Tab extends StatelessWidget {
  const _Tab(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        title,
        style: const TextStyle(
          color: AppColors.main,
          fontSize: 22,
          fontFamily: Fonts.ns400,
        ),
      ),
    );
  }
}
