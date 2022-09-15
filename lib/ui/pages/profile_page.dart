import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/shared/shared_methods.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/profile_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackbar(context, state.e);
          }
          if (state is AuthInitial) {
            Navigator.of(context).pushNamedAndRemoveUntil(
              '/sign-in',
              (route) => false,
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is AuthSuccess) {
            return ListView(
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
                        decoration:  BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: state.user.profilePicture == null ?const  AssetImage(
                              'assets/img_profil.png',
                            ) : NetworkImage(state.user.profilePicture!,) as ImageProvider,
                          ),
                        ),
                        child: state.user.verified == 1 ? Align(
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
                        ) : null,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        state.user.name.toString(),
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
                          if (await Navigator.of(context).pushNamed('/pin') ==
                              true) {
                            Navigator.of(context).pushNamed('/profile-edit');
                          }
                        },
                      ),
                      ProfileMenuItem(
                        title: 'My Pin',
                        iconUrl: 'assets/ic_pin.png',
                        onTap: () async {
                          if (await Navigator.of(context).pushNamed('/pin') ==
                              true) {
                            Navigator.of(context)
                                .pushNamed('/profile-edit-pin');
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
                        onTap: () {
                          context.read<AuthBloc>().add(AuthLogout());
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 87,
                ),
                CustomTextButton(
                  title: 'Report a Problem',
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 50,
                )
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
