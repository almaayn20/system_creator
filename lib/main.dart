import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:system_creator/view/screens/compaines.dart';
import 'package:system_creator/view/screens/company_features.dart';
import 'package:system_creator/view/screens/settings.dart';
import 'package:system_creator/view/screens/test_screen.dart';
import 'package:system_creator/view/screens/login.dart';
import 'package:system_creator/view/screens/signup.dart';
import 'package:system_creator/view/screens/new_password.dart';
import 'package:system_creator/view/screens/verification.dart';
import 'package:system_creator/view/screens/create_company_first_screen.dart';
import 'package:system_creator/view/screens/create_company_second_screen.dart';
import 'package:tuple/tuple.dart';

import 'services/theme_Services.dart';
import 'view/widget/tap_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Settings();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeServices().theme,
      home: Login(),
    );
  }
}

class test extends StatefulWidget {
  test({super.key});

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> with TickerProviderStateMixin {
  late TabController _tabController;

  List<Tuple2<String, IconData>> tabsTitles = const [
    Tuple2('DOGS', Icons.favorite),
    Tuple2('CATS', Icons.music_note),
    Tuple2('BIRDS', Icons.search),
  ];
  //FUNCTION TO ANALYZE FEATURES AND SEND SUITABLE SCREENS
  //FUNCTION TO CONVERT FEATURES TO List<Tuple2<String, IconData>>
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

  List<TabBarWidget> featuresTabs() {
    return [
      TabBarWidget(
        tabs: tabsTitles,
        tabViews: [
          Scaffold(),
          Scaffold(),
          Scaffold(),
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return TabBarWidget(
      tabs: tabsTitles,
      tabViews: [
        Scaffold(),
        Scaffold(),
        Scaffold(),
      ],
    );
  }
}
