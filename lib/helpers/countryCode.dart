// ignore_for_file: file_names

import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:whatsweb/helpers/themes.dart';

class CustomCountryCodePicker extends StatelessWidget {
  final void Function(Country) onChange;

  const CustomCountryCodePicker({Key key,  this.onChange})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CountryPickerDropdown(
      iconSize: 0,
      itemFilter: (c) => [
        'IQ',
        'EG',
      ].contains(c.isoCode),
      itemBuilder: _buildDropdownItem,
      sortComparator: (Country a, Country b) => a.isoCode.compareTo(b.isoCode),
      onValuePicked: onChange,
    );
  }

  Widget _buildDropdownItem(Country country) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            const VerticalDivider(
              thickness: 2,
            ),
            Text(
              '+${country.phoneCode}(${country.isoCode})',
              style: MainTheme.textFormFieldTextStyle,
            ),
            const SizedBox(
              width: 8.0,
            ),
            CountryPickerUtils.getDefaultFlagImage(country),
          ],
        ),
      );
}
