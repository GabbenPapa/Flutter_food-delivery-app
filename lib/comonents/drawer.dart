import 'package:flutter/material.dart';
import 'package:food_delivery/services/auth/auth_services.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  void logout() {
    final authServices = AuthServices();
    authServices.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Drawer(
        backgroundColor: Theme.of(context).colorScheme.onSurface,
        child: Padding(
          padding: const EdgeInsets.only(top: 80.0, bottom: 80.0),
          child: Column(children: [
            Icon(
              Icons.lock_open_rounded,
              size: 76,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox(height: 20),
            HomeDrowerTile(
              text: 'H O M E',
              icon: Icons.home,
              onTap: () {
                Navigator.of(context).pushNamed('/home_screen');
              },
            ),
            HomeDrowerTile(
              text: 'S E T T I N G S',
              icon: Icons.settings,
              onTap: () {
                Navigator.of(context).pushNamed('/settings');
              },
            ),
            Spacer(),
            HomeDrowerTile(
              text: 'L O G O U T',
              icon: Icons.logout,
              onTap: () {
                logout();
              },
            ),
          ]),
        ),
      ),
    );
  }
}

class HomeDrowerTile extends StatelessWidget {
  final String text;
  final IconData? icon;
  final void Function()? onTap;

  const HomeDrowerTile({
    super.key,
    required this.text,
    this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: ListTile(
        title: Text(
          text,
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
            fontSize: 16,
          ),
        ),
        leading: Icon(
          icon,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
        onTap: onTap,
      ),
    );
  }
}
