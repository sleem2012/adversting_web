import 'package:flutter/material.dart';
import 'package:whatsweb/helpers/app_config.dart';

import 'helpers/button_ui.dart';
import 'helpers/text_form_filed_ui.dart';

class FirstPage extends StatelessWidget {
  final emailFocus = FocusNode();
  final nameFocus = FocusNode();
  final phoneFocus = FocusNode();
  final smsFocus = FocusNode();

  final formKey = GlobalKey<FormState>();
  FirstPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      backgroundColor: appConfig.backColor,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormFieldItemUi(
                ownFocus: FocusNode(),
                OnChanged: (v) {},
                nextFocus: FocusNode(),
                minLines: 1,
                maxLines: 7,
                textInputType: TextInputType.text,
                title: 'الرساله',
                iconPath: Icons.message),
           const SizedBox(
              height: 30,
            ),
            DataTable(
                dividerThickness: 5,
                decoration: BoxDecoration(
                    border: Border.all(
                  width: 1,
                  color: Colors.grey,
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
