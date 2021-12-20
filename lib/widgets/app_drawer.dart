import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: <Widget>[
        AppBar(
          title: const Text(
            'Menu',
          ),
          automaticallyImplyLeading: false,
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
          child: const Text(
            'Platform',
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.start,
          ),
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.dashboard),
          title: const Text('Dashboard'),
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/');
          },
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.games),
          title: const Text('Game Management'),
          onTap: () {},
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.people),
          title: const Text('User Management'),
          onTap: () {},
        ),
        const Divider(),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: const Text(
            'Provider',
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.start,
          ),
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.report),
          title: const Text('Reports'),
          onTap: () {},
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.person),
          title: const Text('Providers'),
          onTap: () {},
        ),
        const Divider(),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: const Text(
            'Social',
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.start,
          ),
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.auto_awesome_mosaic),
          title: const Text('Assets'),
          onTap: () {},
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.store),
          title: const Text('Consumables'),
          onTap: () {},
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.ad_units),
          title: const Text('Promotions'),
          onTap: () {},
        ),
        const Divider(),
        const Spacer(),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.account_box),
          title: const Text('Login'),
          onTap: () {},
        ),
        const Divider(),
      ],
    ));
  }
}
