// ignore_for_file: file_names

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_pickers/country.dart';
import 'package:flutter/material.dart';
import 'package:whatsweb/helpers/countryCode.dart';
import 'package:whatsweb/helpers/mediaQuery.dart';

import 'helpers/text_form_filed_ui.dart';
import 'helpers/themes.dart';

class AddOrEditUser extends StatefulWidget {
  // final bool add;
  final QueryDocumentSnapshot<Object> members;
  const AddOrEditUser({
    Key key,
    // this.add,
    this.members,
  }) : super(key: key);

  @override
  State<AddOrEditUser> createState() => _AddOrEditUserState();
}

class _AddOrEditUserState extends State<AddOrEditUser> {
  String name,
      phone,
      email,
      country = 'Egypt',
      countryCode = '20',
      intialCountry = 'EG';
          final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    // if (widget.add == false) {
    //   if (widget.members['country'] == 'Egypt') {
    //     country = 'Egypt';
    //     intialCountry = 'EG';
    //     countryCode = '20';
    //   } else if (widget.members['country'] == 'Iraq') {
    //     country = 'Iraq';
    //     intialCountry = 'IQ';
    //     countryCode = '964';
    //   } else {
    //     country = 'Turkey';
    //     intialCountry = 'TR';
    //     countryCode = '90';
    //   }
    // }
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff18203f),
        body: Padding(
          padding: EdgeInsets.all(context.width * .1),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Form(
              key: _formKey,
              child: ListView(
                shrinkWrap: true,
                children: [
                  const Center(
                    child: Text(
                      'يسعدنا تواصلكم معنا',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: context.height * .01,
                  ),
                  Icon(Icons.account_circle,
                      color: Colors.white, size: context.height * .08),
                  SizedBox(
                    height: context.height * .05,
                  ),
                  CustomTextFormField(
                    onChanged: (v) {
                      name = v.trim();
                    },
                    labelText: 'الاسم',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    SuffixIcon: CustomCountryCodePicker(
                      initialValue: 'IQ',
                      onChange: (Country value) {
                        countryCode = value.phoneCode;

                        country = value.name;
                      },
                    ),
                    width: context.width * 0.4,
                    onChanged: (v) {
                      phone = v.trim();
                    },
                    // initialValue: widget.add == false
                    //     ? widget.members['phone'].toString()
                    //     : null,
                    numbersOnly: true,
                    labelText: 'رقم الهاتف',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    onChanged: (v) {
                      email = v.trim();
                    },
                    email: true,
                    // initialValue:
                    //     widget.add == false ? widget.members['email'] : null,
                    labelText: 'البريد الالكتروني',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          await users.add({
                            'name': name,
                            'email': email,
                            'phone': phone,
                            'countryCode': countryCode,
                            'country': country,
                            'createdAt':
                                DateTime.now().toString().substring(0, 10)
                          }).whenComplete(() => AwesomeDialog(
                                context: context,
                                dialogType: DialogType.SUCCES,
                                animType: AnimType.BOTTOMSLIDE,
                                title: 'تم الارسال',
                                desc:
                                    'نشكرك علي تواصلك معنا وسيتم التواصل معك قريبا',
                                btnOkOnPress: () {},
                              )..show());
                        }
                      },
                      child: Text(
                        'ارسال البيانات',
                        style: MainTheme.textFormFieldTextStyle
                            .copyWith(fontSize: 15),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xff25bcbb)))),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
