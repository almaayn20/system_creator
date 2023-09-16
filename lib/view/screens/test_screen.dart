import 'package:flutter/material.dart';
import 'package:system_creator/services/size_config.dart';
import 'package:system_creator/services/theme_services.dart';
import 'package:system_creator/view/widget/button.dart';
import 'package:system_creator/view/widget/card.dart';
import 'package:system_creator/view/widget/list_view.dart';
import 'package:system_creator/view/widget/tap_bar.dart';
import 'package:tuple/tuple.dart';

import '../widget/app_bar.dart';
import '../widget/bottom_sheet.dart';
import '../widget/carousel_slider.dart';
import '../widget/drop_down_box.dart';
import '../widget/form.dart';
import '../widget/full_screen_dialog.dart';
import '../widget/text_button.dart';
import '../widget/text_field.dart';
import '../widget/text_form_field.dart';

class ChangeAppTheme extends StatefulWidget {
  ChangeAppTheme({Key? key}) : super(key: key);

  @override
  State<ChangeAppTheme> createState() => _ChangeAppThemeState();
}

class _ChangeAppThemeState extends State<ChangeAppTheme>
    with TickerProviderStateMixin {
  TextEditingController cont = TextEditingController();
  late TabController _tabController;
  List<Tuple2<String, IconData>> tabsTitles = const [
    Tuple2('DOGS', Icons.favorite),
    Tuple2('CATS', Icons.music_note),
    Tuple2('BIRDS', Icons.search),
  ];

  List<Tuple2<dynamic, String>> bankEntries = const [
    Tuple2(1, 'الكريمي'),
    Tuple2(2, 'التضامن'),
    Tuple2(2, 'البنك التجاري'),
  ];

  List<Tuple2<Widget, IconData>> listValues = const [
    Tuple2(Text('DOGS'), Icons.favorite),
    Tuple2(Text('CATS'), Icons.music_note),
    Tuple2(Text('BIRDS'), Icons.search),
  ];

  static final _formKey = GlobalKey<FormState>();

//  List of widget

  List<Widget> low() {
    return ([
      textFormFieldCustom(
        validate: validate,
        controller: cont,
        label: "label",
        hint: "hint",
        obscure: false,
        kbtype: TextInputType.text,
      ),
      Padding(padding: EdgeInsets.all(10.0)),
      textFormFieldCustom(
        validate: validate,
        controller: cont,
        label: "label",
        hint: "hint",
        obscure: true,
        kbtype: TextInputType.number,
      ),
      Padding(padding: EdgeInsets.all(10.0)),
      textFormFieldCustom(
        validate: validate,
        controller: cont,
        label: "label",
        hint: "hint",
        obscure: true,
        kbtype: TextInputType.number,
      ),
      Padding(padding: EdgeInsets.all(10.0)),
      elevatedButtonCustom(func: anyFunction, text: "submit"),
    ]);
  }

  static String? validate(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

// عند ضغط الزر
  static anyFunction() {
    // اذا تم التحقق
    if (_formKey.currentState!.validate()) {
      // اكتب الكود هنا
    }
  }

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80',

    // 'assets/images/1.png',
    // 'assets/images/2.png',
    // 'assets/images/3.png',
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
        ),
        body: TabBarWidget(
          tabController: _tabController,
          tabs: tabsTitles,
          tabViews: [
            page(context),
            page2(context),
            page3(context),
          ],
        ),
      ),
    );
  }

  Center page2(BuildContext context) {
    return Center(
        child: SingleChildScrollView(
      child: Column(
        children: [
          carouselSliderCustom(
              imageList: imgList, useNetworkImage: true, ratio: 0.6),
        ],
      ),
    )
        // elevatedButtonCustom(
        //     func: () => openFullscreenDialog(context, "Material 3"),
        //     text: "openFullscreenDialog"),
        );
  }

  Center page(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          width: double.maxFinite - 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              cardCustom([
                DropDownMenuCustom(bankEntries, "Banks"),
              ]),
              formCustom(formKey: _formKey, widgets: low()),
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
      ),
    );
  }

  Center page3(BuildContext context) {
    return Center(
      child: listViewCustom([
        ListTileProps(
          title: Text('Item 1'),
          trailing: Icons.star,
        ),
        ListTileProps(
          title: Text('Item 2'),
          subtitle: Text('Subtitle for Item 2'),
          leading: Icons.info,
          isThreeLine: false,
          onTap: () {
            // Handle onTap for Item 2
          },
          trailing: Icons.star_border,
        ),
      ]),
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
    return textFieldCustom(
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
    return textFieldCustom(
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
