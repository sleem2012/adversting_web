import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:whatsweb/helpers/app_config.dart';
import 'package:whatsweb/helpers/text_form_filed_ui.dart';

import 'helpers/button_ui.dart';

class SecondPage extends StatefulWidget {
  SecondPage({Key key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final emailFocus = FocusNode();

  final nameFocus = FocusNode();

  final phoneFocus = FocusNode();

  final regionFocus = FocusNode();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
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
                              func: () async {
                                // if (formKey.currentState.validate()) {
                                // }
                                await users.add({
                                  'name': 'ahmed',
                                  'email': "ahmedslem779@gmail.com",
                                  'phone': 01015394940
                                }).then((value) {
                                  return print('done');
                                });
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
