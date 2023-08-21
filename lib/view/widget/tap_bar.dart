import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

class TabBarWidget extends StatelessWidget {
  final List<Widget> tabViews;
  final TabController tabController;
  final List<Tuple2<String, Icon>> tabs;

  TabBarWidget(
      {required this.tabs,
      required this.tabController,
      required this.tabViews});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          //  isScrollable: true,
          controller: tabController,
          tabs: [
            for (var tab in tabs)
              Tab(
                text: tab.item1,
                icon: tab.item2,
                iconMargin: const EdgeInsets.only(bottom: 0.0),
              ),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: tabViews,
          ),
        ),
      ],
    );
  }
}

//الاستدعاء
/*
class _ChangeAppThemeState extends State<ChangeAppTheme>
    with TickerProviderStateMixin {
  late TabController _tabController;
  List<Tuple2<String, Icon>> tabsTitles = const [
    Tuple2('DOGS', Icon(Icons.favorite)),
    Tuple2('CATS', Icon(Icons.music_note)),
    Tuple2('BIRDS', Icon(Icons.search)),
  ];
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

  body: TabBarWidget(
          tabController: _tabController,
          tabs: tabsTitles,
          tabViews: [
            page(context),
            page2(context),
            page(context),
          ],
        ),
*/