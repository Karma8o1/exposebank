import 'package:expose_banq/view/home/components/quick_service_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SelectDepositType extends StatelessWidget {
  const SelectDepositType({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      children: [
        QuickServiceBox(
          onTap: () {},
          icon: FontAwesomeIcons.buildingColumns,
          text: 'Bank Deposit',
        ),
        QuickServiceBox(
          onTap: () {},
          icon: FontAwesomeIcons.buildingColumns,
          text: 'International Bank Deposit (UK Only)',
        ),
        QuickServiceBox(
          onTap: () {},
          icon: FontAwesomeIcons.buildingColumns,
          text: 'International Bank Deposit (Except UK)',
        ),
        QuickServiceBox(
          onTap: () {},
          icon: FontAwesomeIcons.buildingColumns,
          text: 'Mobile Money',
        ),
        QuickServiceBox(
          onTap: () {},
          icon: FontAwesomeIcons.buildingColumns,
          text: 'Debit/Credit Card',
        ),
      ],
    );
  }
}
