import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:whatsweb/helpers/app_config.dart';
import 'package:whatsweb/helpers/mediaQuery.dart';
import 'package:whatsweb/helpers/text_form_filed_ui.dart';

import 'helpers/button_ui.dart';

class SecondPage extends StatefulWidget {
  SecondPage({Key key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var regionController = TextEditingController();

  final emailFocus = FocusNode();

  final nameFocus = FocusNode();

  final phoneFocus = FocusNode();

  final regionFocus = FocusNode();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // CollectionReference users = FirebaseFirestore.instance.collection('users');
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
              child: Container(
            color: Colors.white,
            padding: EdgeInsets.all(appConfig.paddingValue),
            child: SingleChildScrollView(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: context.height * .05,
                      ),
                      Text(
                        'يسعدنا تواصلكم معنا',
                        style: TextStyle(
                            color: appConfig.colorMain,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: context.height * .01,
                      ),
                      Icon(Icons.account_circle,
                          color: appConfig.colorMain,
                          size: context.height * .08),
                      SizedBox(
                        height: context.height * .05,
                      ),
                      RegisterField(
                        horizontalMargin: context.width * .2,
                        isDetails: false,
                        keyboardType: TextInputType.name,
                        hintText: 'الاسم',
                        labelText: 'الاسم',
                        controller: nameController,
                        validator: (v) {
                          if (v.isEmpty) {
                            return 'ادخل الاسم';
                          }

                          return null;
                        },
                      ),
                      SizedBox(
                        height: appConfig.paddingValue,
                      ),
                      RegisterField(
                        horizontalMargin: context.width * .2,
                        isDetails: true,
                        keyboardType: TextInputType.emailAddress,
                        hintText: 'البريد الالكترونى',
                        labelText: 'البريد الالكترونى',
                        controller: emailController,
                        validator: (v) {
                          if (v.isEmpty) {
                            return 'ادخل البريد';
                          }

                          return null;
                        },
                      ),
                      SizedBox(
                        height: appConfig.paddingValue,
                      ),
                      RegisterField(
                        horizontalMargin: context.width * .2,
                        isDetails: true,
                        keyboardType: TextInputType.phone,
                        hintText: 'رقم الواتساب',
                        labelText: ' رقم الواتساب',
                        controller: phoneController,
                        validator: (v) {
                          if (v.isEmpty) {
                            return 'ادخل الرقم';
                          }

                          return null;
                        },
                      ),
                      SizedBox(
                        height: appConfig.paddingValue,
                      ),
                      RegisterField(
                        horizontalMargin: context.width * .2,
                        isDetails: false,
                        keyboardType: TextInputType.text,
                        hintText: ' الدوله',
                        labelText: ' الدوله',
                        controller: regionController,
                        validator: (v) {
                          if (v.isEmpty) {
                            return 'ادخل الدوله';
                          }

                          return null;
                        },
                      ),
                      SizedBox(
                        height: appConfig.paddingValue,
                      ),
                      ButtonUi(
                        borderColor: appConfig.colorMain,
                        padding: 10.0,
                        backColor: appConfig.colorMain,
                        w: context.width * .2,
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
                          // await users.add({
                          //   'name': 'ahmed',
                          //   'email': "ahmedslem779@gmail.com",
                          //   'phone': 01015394940
                          // }).then((value) {
                          //   return print('done');
                          // });
                        },
                      ),
                      SizedBox(
                        height: appConfig.paddingValue * 2,
                      )
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
