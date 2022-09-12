import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/data_package_item.dart';
import 'package:bank_sha/ui/widgets/forms.dart';
import 'package:flutter/material.dart';

class DataPackagePage extends StatelessWidget {
  const DataPackagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paket Data'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            'Phone Number',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          const CustomFormField(
            title: '+628',
            isShowTitle: false,
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            'Select Package',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Center(
            child: Wrap(
              spacing: 17,
              runSpacing: 17,
              children: const [
                DataPackageItem(
                  amount: 10,
                  price: 100000,
                ),
                DataPackageItem(
                  amount: 25,
                  price: 200000,
                  isSelected: true,
                ),
                DataPackageItem(
                  amount: 60,
                  price: 300000,
                ),
                DataPackageItem(
                  amount: 100,
                  price: 400000,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 85,
          ),
          CustomFilledButton(
            title: 'Continue',
            onPressed: () async {
              if (await Navigator.of(context).pushNamed('/pin') == true) {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/data-success', (route) => false);
              }
            },
          ),
          const SizedBox(
            height: 57,
          ),
        ],
      ),
    );
  }
}
