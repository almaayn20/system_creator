import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:system_creator/services/size_config.dart';
import 'package:system_creator/view/widget/text_button.dart';
import 'package:system_creator/view/widget/text_field.dart';
import 'package:system_creator/view/widget/Button.dart';
import 'package:system_creator/view/widget/text_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../services/theme_Services.dart';
import '../widget/app_bar.dart';
import '../widget/list_view.dart';



class login extends StatelessWidget {
  login({super.key});

  TextEditingController controller=TextEditingController();
  TextEditingController controller2=TextEditingController();
  @override
  Widget build(BuildContext context) {
     SizeConfig().init(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        
        body: Container(
          alignment: Alignment.center,
              child:
            ListView(
        
          children: [
            SvgPicture.asset("assets/images/login.svg",width: double.infinity,height: 400,matchTextDirection: true,),
            Container(
              margin: EdgeInsets.all(smallSpacing),
              child: textFieldCustom(controller: controller, label: "الايميل", hint: "ادخل ايميلك", suffix: Icons.email_outlined, kbtype: TextInputType.emailAddress,obscure:false,),
            ),
            
            Container(
              margin: EdgeInsets.all(smallSpacing),
              child: textFieldCustom(controller: controller2, label: "كلمة السر", hint: "ادخل كلمة السر", suffix: Icons.visibility_off_outlined, kbtype: TextInputType.text,obscure:true,),
            ),

            elevatedButtonCustom(func: (){}, text: "تسجيل الدخول"),
            

            
              textButtonCustom(func: (){}, text: "نسيت كلمة السر؟"),
            

            Container(
              alignment: Alignment.bottomCenter,
              child:  elevatedButtonCustom(func: (){}, text: "إنشاء حساب",),
            ),
          
          ]
        
        ),
        ),
        
        ),
      );
  }
}
