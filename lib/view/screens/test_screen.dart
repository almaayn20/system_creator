import 'package:flutter/material.dart';
import 'package:system_creator/services/size_config.dart';
import 'package:system_creator/services/theme_services.dart';
import 'package:system_creator/view/widget/button.dart';
import 'package:system_creator/view/widget/tap_bar.dart';
import 'package:tuple/tuple.dart';

import '../widget/app_bar.dart';
import '../widget/bottom_sheet.dart';
import '../widget/text_button.dart';
import '../widget/text_field.dart';

class ChangeAppTheme extends StatefulWidget {
  ChangeAppTheme({Key? key}) : super(key: key);

  @override
  State<ChangeAppTheme> createState() => _ChangeAppThemeState();
}

class _ChangeAppThemeState extends State<ChangeAppTheme>
    with TickerProviderStateMixin {
  TextEditingController cont = TextEditingController();
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

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: appBarCustom(
          title: 'صانع التطبيقات',
          actions: [
            IconButton(
                onPressed: () {
                  ThemeServices().switchTheme();
                },
                icon: ThemeServices().theme == ThemeMode.dark
                    ? const Icon(Icons.light_mode_outlined)
                    : const Icon(Icons.dark_mode_outlined)),
          ],
        ),
        body: TabBarWidget(
          tabController: _tabController,
          tabs: tabsTitles,
          tabViews: [
            page(context),
            page2(context),
            page(context),
          ],
        ),
      ),
    );
  }

  Center page2(BuildContext context) {
    return Center(
      child: Text("salman"),
    );
  }

  Center page(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(20),
        width: double.maxFinite - 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            elevatedButtonCustom(
                func: () async {
                  // ShowTimePickerCustom().show(context);
                  //  ShowDatePickerCustome().show(context: context);
                  // alertDialogCustom(
                  //     context: context,
                  //     title: 'تنبيه',
                  //     text: 'هذه مربع تنبيه',
                  //     actions: [signInButton()]);
                },
                text: 'date picker'),
            elevatedButtonCustom(
                func: () => bottomSheet(
                      context,
                      300,
                      [
                        emailTextField(),
                        colDivider,
                        passwordTextField(),
                        colDivider,
                        signInButton()
                      ],
                    ),
                text: 'BottomSheet',
                filled: true),
          ],
        ),
      ),
    );
  }

  static void al() {}
  final List<Widget>? listOfWidgets = [
    textButtonCustom(func: al, text: 'text'),
    textButtonCustom(func: al, text: 'text'),
  ];

  FilledButton signInButton() {
    return FilledButton(
        onPressed: () {
          Navigator.of(context).pop();
          //  snackBarCustom(context, 'تمت العملية بنجاح!', 'إخفاء', () => null);
        },
        child: const Text('تسجيل الدخول'));
  }

  TextField passwordTextField() {
    return textField(
        controller: cont,
        label: 'كلمة السر',
        hint: 'ادخل كلمة السر',
        //helper: 'Ent',
        //   error: 'invalid email',
        prefix: Icons.password_outlined,
        // suffix: Icons.exit_to_app,
        obscure: true,
        kbtype: TextInputType.visiblePassword);
  }

  TextField emailTextField() {
    return textField(
        controller: cont,
        label: 'الإيميل',
        hint: 'ادخل إيميلك',
        //helper: 'Ent',
        //   error: 'invalid email',
        prefix: Icons.email_outlined,
        // suffix: Icons.exit_to_app,
        obscure: false,
        kbtype: TextInputType.emailAddress);
  }
}
