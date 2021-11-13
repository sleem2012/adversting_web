import 'package:flutter/material.dart';
import 'package:whatsweb/helpers/app_config.dart';
import 'package:whatsweb/helpers/text_form_filed_ui.dart';

import 'helpers/button_ui.dart';

class SecondPage extends StatelessWidget {
  final emailFocus = FocusNode();
  final nameFocus = FocusNode();
  final phoneFocus = FocusNode();
  final regionFocus = FocusNode();

  final formKey = GlobalKey<FormState>();
  SecondPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      backgroundColor: appConfig.backColor,
      body: Column(
        children: [
          Expanded(
              child: Container(
            color: appConfig.backColor,
            padding: EdgeInsets.all(appConfig.paddingValue),
            child: SingleChildScrollView(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Container(
                        color: Colors.white,
                        padding: EdgeInsets.all(appConfig.paddingValue),
                        child: Column(
                          children: [
                            TextFormFieldItemUi(
                                OnChanged: (v) {},
                                ownFocus: FocusNode(),
                                nextFocus: emailFocus,
                                minLines: 1,
                                maxLines: 1,
                                textInputType: TextInputType.text,
                                title: 'الإسم',
                                iconPath: Icons.person),
                            SizedBox(
                              height: appConfig.paddingValue,
                            ),
                            TextFormFieldItemUi(
                              OnChanged: (v) {},
                              ownFocus: FocusNode(),
                              iconPath: Icons.email,
                              nextFocus: phoneFocus,
                              minLines: 1,
                              maxLines: 1,
                              textInputType: TextInputType.text,
                              title: 'البريد الالكترونى',
                            ),
                            SizedBox(
                              height: appConfig.paddingValue,
                            ),
                            TextFormFieldItemUi(
                                OnChanged: (v) {},
                                ownFocus: phoneFocus,
                                nextFocus: regionFocus,
                                minLines: 1,
                                maxLines: 1,
                                textInputType: TextInputType.phone,
                                title: ' رقم الواتساب',
                                iconPath: Icons.phone_android),
                            SizedBox(
                              height: appConfig.paddingValue,
                            ),
                            TextFormFieldItemUi(
                                OnChanged: (v) {},
                                ownFocus: regionFocus,
                                nextFocus: FocusNode(),
                                minLines: 1,
                                maxLines: 5,
                                textInputType: TextInputType.text,
                                
                                title: 'الدوله',
                                iconPath: Icons.location_city),
                            SizedBox(
                              height: appConfig.paddingValue,
                            ),
                            ButtonUi(
                              borderColor: appConfig.colorMain,
                              padding: 10.0,
                              backColor: appConfig.colorMain,
                              w: MediaQuery.of(context).size.width - 30.0,
                              widget: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    'إرسال البيانات',
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                              func: () {
                                if (formKey.currentState.validate()) {}
                              },
                            ),
                            
                            SizedBox(
                              height: appConfig.paddingValue * 2,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ))
        ],
      ),
    ));
  }
}
