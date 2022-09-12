import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/profile_menu_item.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 32,
              vertical: 22,
            ),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/img_profil.png',
                      ),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: whiteColor,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.check_circle,
                          color: greenColor,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Shayna Hanna",
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                ProfileMenuItem(
                  title: 'Edit Profile',
                  iconUrl: 'assets/ic_edit_profile.png',
                  onTap: () async {
                    if (await Navigator.of(context).pushNamed('/pin') == true) {
                      Navigator.of(context).pushNamed('/profile-edit');
                    }
                  },
                ),
                ProfileMenuItem(
                  title: 'My Pin',
                  iconUrl: 'assets/ic_pin.png',
                  onTap: () async {
                    if (await Navigator.of(context).pushNamed('/pin') == true) {
                      Navigator.of(context).pushNamed('/profile-edit-pin');
                    }
                  },
                ),
                ProfileMenuItem(
                  title: 'Wallet Settings',
                  iconUrl: 'assets/ic_wallet.png',
                  onTap: () {},
                ),
                ProfileMenuItem(
                  title: 'My Reward',
                  iconUrl: 'assets/ic_reward.png',
                  onTap: () {},
                ),
                ProfileMenuItem(
                  title: 'Help Center',
                  iconUrl: 'assets/ic_help.png',
                  onTap: () {},
                ),
                ProfileMenuItem(
                  title: 'Log Out',
                  iconUrl: 'assets/ic_logout.png',
                  onTap: () {},
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 87,
          ),
          CustomTextButton(
            title: 'Report a Pproblem',
            onPressed: () {},
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
