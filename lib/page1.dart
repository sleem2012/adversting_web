import 'package:flutter/material.dart';
import 'package:whatsweb/helpers/app_config.dart';
import 'package:whatsweb/helpers/mediaQuery.dart';

import 'helpers/button_ui.dart';
import 'helpers/text_form_filed_ui.dart';

class FirstPage extends StatelessWidget {
  var messageController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  FirstPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: appConfig.backColorSelect,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
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
            SizedBox(
              height: 15,
            ),
            DataTable(
                dividerThickness: 5,
                decoration: BoxDecoration(
                    border: Border.all(
                  width: 1,
                  color: appConfig.colorMain,
                )),
                columns: const [
                  DataColumn(
                      label: Text('الاسم'),
                      tooltip: 'يظهر اسم المستخدم المسجل من المستخدم'),
                  DataColumn(
                      label: Text('رقم الهاتف'),
                      tooltip: 'يظهر رقم الهاتف السمجل من المستخدم'),
                  DataColumn(
                      label: Text('البريد'),
                      tooltip: 'يظهر البريد الالكتروني للمستخدم'),
                  DataColumn(
                      label: Text('الدوله'), tooltip: 'تظهر دولة المستخدم'),
                ],
                rows:
                    // ignore: prefer_const_literals_to_create_immutables
                    [
                  const DataRow(
                    cells: [
                      DataCell(
                        Text("حمد سليم"),
                      ),
                      DataCell(Text("01015394940")),
                      DataCell(Text("ahmedslem7799@gmail.com")),
                      DataCell(Text("مصر"))
                    ],
                  )
                ]),
          ],
        ),
      ),
    ));
  }
}
