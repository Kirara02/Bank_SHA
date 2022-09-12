import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/forms.dart';
import 'package:bank_sha/ui/widgets/transfer_recent_user_item.dart';
import 'package:bank_sha/ui/widgets/transfer_result_user_item.dart';
import 'package:flutter/material.dart';

class TransferPage extends StatelessWidget {
  const TransferPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfer'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            'Search',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          const CustomFormField(
            title: 'by username',
            isShowTitle: false,
          ),
          // buildRecentUsers(),
          buildResult(),
          const SizedBox(
            height: 274,
          ),
          CustomFilledButton(
            title: 'Continue',
            onPressed: () {
              Navigator.of(context).pushNamed('/transfer-amount');
            },
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }

  Widget buildRecentUsers() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent Users',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          const TransferRecentUsersItem(
            imageUrl: 'assets/img_friend3.png',
            name: 'Yonna Jie',
            username: 'yoenna',
          ),
          const TransferRecentUsersItem(
            imageUrl: 'assets/img_friend2.png',
            name: 'John Hi',
            username: 'johnhi',
          ),
          const TransferRecentUsersItem(
            imageUrl: 'assets/img_friend1.png',
            name: 'Kirara Bernstein',
            username: 'kirara',
            isVerified: true,
          ),
        ],
      ),
    );
  }

  Widget buildResult() {
    return Container(
      margin: const EdgeInsets.only(
        top: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Result',
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
                TransferResultUserItem(
                  imageUrl: 'assets/img_friend3.png',
                  name: 'Yonna Jie',
                  username: 'yoenna',
                ),
                TransferResultUserItem(
                  imageUrl: 'assets/img_friend1.png',
                  name: 'Kirara Bernstein',
                  username: 'kirara',
                  isVerified: true,
                  isSelected: true,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
