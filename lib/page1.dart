// ignore_for_file: missing_return

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:whatsweb/helpers/app_config.dart';
import 'package:whatsweb/helpers/mediaQuery.dart';

import 'helpers/button_ui.dart';
import 'helpers/text_form_filed_ui.dart';



class FirstPage extends StatelessWidget {
  var messageController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  FirstPage({Key key}) : super(key: key);
  final Stream<QuerySnapshot> users =
      FirebaseFirestore.instance.collection('users').snapshots();

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
                widget: Text('ارسال'),
                func: () {},
                backColor: appConfig.backColorSelect,
                borderColor: appConfig.colorMain,
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: context.height,
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
                      return ListView.builder(
                          itemCount: data.size,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
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
                                      tooltip:
                                          'يظهر رقم الهاتف السمجل من المستخدم'),
                                  DataColumn(
                                      label: Text('البريد'),
                                      tooltip:
                                          'يظهر البريد الالكتروني للمستخدم'),
                                  DataColumn(
                                      label: Text('الدوله'),
                                      tooltip: 'تظهر دولة المستخدم'),
                                ],
                                rows: [
                                  DataRow(
                                    cells: [
                                      DataCell(
                                        Text(data.docs[index]['name']),
                                      ),
                                      DataCell(Text(data.docs[index]['phone']
                                          .toString())),
                                      DataCell(Text(data.docs[index]['email'])),
                                      DataCell(
                                          Text(data.docs[index]['country'])),
                                    ],
                                  )
                                ]);
                          });
                    }),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
