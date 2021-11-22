// ignore_for_file: missing_return

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:whatsweb/helpers/app_config.dart';
import 'package:whatsweb/helpers/mediaQuery.dart';

import 'helpers/button_ui.dart';
import 'helpers/text_form_filed_ui.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final messageController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  List<String> recipients = [];
  final Stream<QuerySnapshot> users =
      FirebaseFirestore.instance.collection('users').snapshots();
  void _sendSMS() async {
    String _result =
        await sendSMS(message: messageController.text, recipients: recipients)
            .catchError((onError) {
      log(onError);
    });
    log(_result);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: appConfig.backColorSelect,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              RegisterField(
                horizontalMargin: context.width * .2,
                globalKey: formKey,
                isDetails: true,
                keyboardType: TextInputType.text,
                hintText: 'ادخل الرساله',
                labelText: 'ادخل الرساله',
                controller: messageController,
                validator: (v) {
                  if (v.isEmpty) {
                    return 'ادخل الرساله';
                  }

                  return null;
                },
              ),
              ButtonUi(
                w: context.width * .2,
                padding: context.height * .02,
                widget: const Text('ارسال'),
                func: _sendSMS,
                backColor: appConfig.backColorSelect,
                borderColor: appConfig.colorMain,
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: context.width * .6,
                child: StreamBuilder<QuerySnapshot>(
                    stream: users,
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapShot) {
                      if (snapShot.hasError) {
                        return const Text('error');
                      }
                      if (snapShot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      final data = snapShot.requireData;

                      return DataTable(
                          dividerThickness: 5,
                          decoration: BoxDecoration(
                              border: Border.all(
                            width: 1,
                            color: appConfig.colorMain,
                          )),
                          columns: const [
                            DataColumn(
                                label: Text('الاسم'),
                                tooltip:
                                    'يظهر اسم المستخدم المسجل من المستخدم'),
                            DataColumn(
                                label: Text('رقم الهاتف'),
                                tooltip: 'يظهر رقم الهاتف السمجل من المستخدم'),
                            DataColumn(
                                label: Text('البريد'),
                                tooltip: 'يظهر البريد الالكتروني للمستخدم'),
                            DataColumn(
                                label: Text('الدوله'),
                                tooltip: 'تظهر دولة المستخدم'),
                          ],
                          rows: data.docs.map((e) {
                            recipients.add(e['phone'].toString());
                            log('$recipients');
                            return DataRow(cells: [
                              DataCell(
                                Text(e['name']),
                              ),
                              DataCell(Text(e['phone'].toString())),
                              DataCell(Text(e['email'])),
                              DataCell(Text(e['country'])),
                            ]);
                          }).toList());
                    }),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
